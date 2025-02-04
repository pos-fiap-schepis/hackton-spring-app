package br.fiap.schepis.hackaton.resources;

import br.fiap.schepis.hackaton.dtos.LoginDto;
import br.fiap.schepis.hackaton.dtos.UserDto;
import br.fiap.schepis.hackaton.keycloack.KeycloakUserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/keycloak")
@Tag(name = "Gerenciamento de Usuários no Keycloak", description = "Endpoints para criação e autenticação de usuários no Keycloak")
public class KeycloakController {

    private final KeycloakUserService keycloakUserService;

    public KeycloakController(KeycloakUserService keycloakUserService) {
        this.keycloakUserService = keycloakUserService;
    }

    @PostMapping("/criar-usuario")
    @Operation(summary = "Criar um novo usuário", description = "Cria um novo usuário no Keycloak com as credenciais fornecidas.")
    public ResponseEntity<String> criarUsuario(@Valid @RequestBody UserDto usuarioRequest) {
        boolean sucesso = keycloakUserService.createUser(usuarioRequest);
        return sucesso ? ResponseEntity.ok("Usuário criado com sucesso!")
                : ResponseEntity.status(500).body("Falha ao criar usuário.");
    }

    @PostMapping("/token")
    @Operation(summary = "Obter token JWT", description = "Autentica um usuário e retorna um token JWT para acesso.")
    public ResponseEntity<?> obterToken(@Valid @RequestBody LoginDto loginRequest) {
        return keycloakUserService.getUserToken(loginRequest);
    }

}