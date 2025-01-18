package br.fiap.schepis.hackton.infrastructure.common;

import java.util.UUID;

public class RandomIdGenerator {
    public static String generateRandomId() {
        return UUID.randomUUID().toString();
    }
}