package br.fiap.schepis.hackaton.infrastructure.keycloack;

import br.fiap.schepis.hackaton.infrastructure.dtos.LoginDto;
import br.fiap.schepis.hackaton.infrastructure.dtos.UserDto;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

@Service
public class KeycloakUserService {

    @Value("${keycloak.token-url}")
    private String tokenUrl;

    @Value("${keycloak.users-url}")
    private String usersUrl;

    @Value("${keycloak.client-id}")
    private String clientId;

    @Value("${keycloak.client-key-password}")
    private String clientSecret;

    @Value("${keycloak.admin-username}")
    private String adminUsername;

    @Value("${keycloak.admin-password}")
    private String adminPassword;

    private final RestTemplate restTemplate = new RestTemplate();

    private String getAdminAccessToken() {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        String requestBody = "client_id=" + clientId
                + "&client_secret=" + clientSecret
                + "&username=" + adminUsername
                + "&password=" + adminPassword
                + "&grant_type=password";

        HttpEntity<String> request = new HttpEntity<>(requestBody, headers);
        ResponseEntity<Map> response = restTemplate.exchange(
                tokenUrl, HttpMethod.POST, request, Map.class
        );

        return response.getBody() != null ? (String) response.getBody().get("access_token") : null;
    }

    public boolean createUser(final UserDto user) {
        final String token = getAdminAccessToken();
        if (token == null) {
            throw new RuntimeException("Failed to obtain access token from Keycloak");
        }

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setBearerAuth(token);

        Map<String, Object> param = new HashMap<>();
        param.put("username", user.getUsername());
        param.put("email", user.getEmail());
        param.put("firstName", user.getFirstName());
        param.put("lastName", user.getLastName());
        param.put("enabled", true);
        param.put("emailVerified", true);

        param.put("credentials", Collections.singletonList(Map.of(
                "type", "password",
                "value", user.getPassword(),
                "temporary", false
        )));

        HttpEntity<Map<String, Object>> request = new HttpEntity<>(param, headers);
        ResponseEntity<Void> response = restTemplate.exchange(usersUrl, HttpMethod.POST, request, Void.class);

        return response.getStatusCode() == HttpStatus.CREATED;
    }

    public ResponseEntity<Map<String, Object>> getUserToken(final LoginDto login) {
        final HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        final String requestBody = "client_id=" + clientId +
                "&client_secret=" + clientSecret +
                "&username=" + login.getUsername() +
                "&password=" + login.getPassword() +
                "&grant_type=password";

        final HttpEntity<String> request = new HttpEntity<>(requestBody, headers);

        final ResponseEntity<Map> response = restTemplate.exchange(
                tokenUrl, HttpMethod.POST, request, Map.class
        );

        return ResponseEntity.status(response.getStatusCode()).body(response.getBody());
    }

}