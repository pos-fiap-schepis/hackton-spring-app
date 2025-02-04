package br.fiap.schepis.hackaton.dtos;

import br.fiap.schepis.hackaton.enums.StatusProcessamentoEnum;

public class RequestStatusDto {
    private String idRequest;

    private String fileName;
    private StatusProcessamentoEnum status;
    private String errorMessage;

    public RequestStatusDto(String idRequest, String fileName, StatusProcessamentoEnum status, String errorMessage) {
        this.idRequest = idRequest;
        this.fileName = fileName;
        this.status = status;
        this.errorMessage = errorMessage;
    }

    public String getIdRequest() {
        return idRequest;
    }

    public void setIdRequest(String idRequest) {
        this.idRequest = idRequest;
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

    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }
}
