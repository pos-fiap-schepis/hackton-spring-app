package br.fiap.schepis.hackaton.infrastructure.enums;

import java.util.Optional;

public enum StatusProcessamentoEnum {

    ENVIADO("Enviado"),
    EM_PROCESSAMENTO("Em processamento"),
    PROCESSADO("Processado"),
    ERRO("Erro");
    private String descricao;

    public String getDescricao() {
        return descricao;
    }

    StatusProcessamentoEnum(String descricao) {
        this.descricao = descricao;
    }

    public static Optional<StatusProcessamentoEnum> fromString(String value) {
        try {
            return Optional.of(StatusProcessamentoEnum.valueOf(value));
        } catch (IllegalArgumentException e) {
            return Optional.empty();
        }
    }
}
