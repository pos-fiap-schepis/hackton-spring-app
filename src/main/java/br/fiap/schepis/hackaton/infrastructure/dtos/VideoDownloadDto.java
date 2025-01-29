package br.fiap.schepis.hackaton.infrastructure.dtos;

import br.fiap.schepis.hackaton.infrastructure.enums.StatusProcessamentoEnum;

public class VideoDownloadDto {

    private String fileName;

    private StatusProcessamentoEnum status;

    private String linkDownload;

    private String message;

    public VideoDownloadDto(String fileName, String linkDownload, StatusProcessamentoEnum status, String message) {
        this.fileName = fileName;
        this.linkDownload = linkDownload;
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

    public String getLinkDownload() {
        return linkDownload;
    }

    public void setLinkDownload(String linkDownload) {
        this.linkDownload = linkDownload;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
