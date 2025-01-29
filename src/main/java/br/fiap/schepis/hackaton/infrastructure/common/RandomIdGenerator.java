package br.fiap.schepis.hackaton.infrastructure.common;

import java.util.UUID;

public class RandomIdGenerator {
    public static String generateRandomId() {
        return UUID.randomUUID().toString();
    }
}