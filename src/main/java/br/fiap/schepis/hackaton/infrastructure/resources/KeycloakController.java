package br.fiap.schepis.hackaton.infrastructure.resources;

import br.fiap.schepis.hackaton.infrastructure.dtos.LoginDto;
import br.fiap.schepis.hackaton.infrastructure.dtos.UserDto;
import br.fiap.schepis.hackaton.infrastructure.keycloack.KeycloakUserService;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/keycloak")
public class KeycloakController {

    private final KeycloakUserService keycloakUserService;

    public KeycloakController(KeycloakUserService keycloakUserService) {
        this.keycloakUserService = keycloakUserService;
    }

    @PostMapping("/create-user")
    public ResponseEntity<String> createUser(@Valid @RequestBody UserDto userRequest) {
        boolean success = keycloakUserService.createUser(userRequest);
        return success ? ResponseEntity.ok("User created successfully!")
                : ResponseEntity.status(500).body("Failed to create user.");
    }

    @PostMapping("/token")
    public ResponseEntity<?> getToken(@Valid @RequestBody LoginDto loginRequest) {
        return keycloakUserService.getUserToken(loginRequest);
    }

}
