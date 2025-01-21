package br.fiap.schepis.hackton.infrastructure.dtos;

import java.util.ArrayList;
import java.util.List;

public class RequestDownloadDto {

    private String idRequest;

    private List<VideoDownloadDto> video = new ArrayList<>();

    public String getIdRequest() {
        return idRequest;
    }

    public void setIdRequest(String idRequest) {
        this.idRequest = idRequest;
    }

    public List<VideoDownloadDto> getVideo() {
        return video;
    }

    public void setVideo(List<VideoDownloadDto> video) {
        this.video = video;
    }
}
