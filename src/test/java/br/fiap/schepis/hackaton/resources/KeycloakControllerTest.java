package br.fiap.schepis.hackaton.resources;

import br.fiap.schepis.hackaton.config.TestSecurityConfig;
import br.fiap.schepis.hackaton.dtos.LoginDto;
import br.fiap.schepis.hackaton.dtos.UserDto;
import br.fiap.schepis.hackaton.keycloack.KeycloakUserService;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.Map;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.context.annotation.Import;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@Import(TestSecurityConfig.class)
@ExtendWith(SpringExtension.class)
@WebMvcTest(KeycloakController.class)
public class KeycloakControllerTest {

  @Autowired
  private MockMvc mockMvc;

  @MockitoBean
  private KeycloakUserService keycloakUserService;

  @Autowired
  private ObjectMapper objectMapper;

  @BeforeEach
  public void setUp() {
    Mockito.reset(keycloakUserService);
  }

  @Test
  public void testCriarUsuario_Sucesso() throws Exception {
    UserDto userDto = new UserDto();
    userDto.setUsername("username");
    userDto.setEmail("email@gmail.com");
    userDto.setPassword("password");
    userDto.setFirstName("firstName");
    userDto.setLastName("lastName");
    Mockito.when(keycloakUserService.createUser(Mockito.any(UserDto.class))).thenReturn(true);

    mockMvc.perform(post("/keycloak/criar-usuario")
        .contentType(MediaType.APPLICATION_JSON)
        .content(objectMapper.writeValueAsString(userDto)))
      .andExpect(status().isOk())
      .andExpect(content().string("Usuário criado com sucesso!"));
  }

  @Test
  public void testCriarUsuario_Falha() throws Exception {
    UserDto userDto = new UserDto();
    Mockito.when(keycloakUserService.createUser(Mockito.any(UserDto.class))).thenReturn(false);

    mockMvc.perform(post("/keycloak/criar-usuario")
        .contentType(MediaType.APPLICATION_JSON)
        .content(objectMapper.writeValueAsString(userDto)))
      .andExpect(status().isBadRequest());
  }

  @Test
  public void testObterToken() throws Exception {
    LoginDto loginDto = new LoginDto();
    loginDto.setUsername("user.username");
    loginDto.setPassword("password123");
    Mockito.when(keycloakUserService.getUserToken(Mockito.any(LoginDto.class)))
      .thenReturn(ResponseEntity.ok(Map.of("access_token", "token")));

    mockMvc.perform(post("/keycloak/token")
        .contentType(MediaType.APPLICATION_JSON)
        .content(objectMapper.writeValueAsString(loginDto)))
      .andExpect(status().isOk())
      .andExpect(content().string("{\"access_token\":\"token\"}"));
  }
}