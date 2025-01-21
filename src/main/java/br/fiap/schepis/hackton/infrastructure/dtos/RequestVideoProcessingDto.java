package br.fiap.schepis.hackton.infrastructure.dtos;

import br.fiap.schepis.hackton.infrastructure.enums.StatusProcessamentoEnum;

public class RequestVideoProcessingDto {

    private String fileName;
    private StatusProcessamentoEnum status;
    private String message;

    public RequestVideoProcessingDto(String fileName, StatusProcessamentoEnum status, String message) {
        this.fileName = fileName;
        this.status = status;
        this.message = message;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public StatusProcessamentoEnum getStatus() {
        return status;
    }

    public void setStatus(StatusProcessamentoEnum status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
