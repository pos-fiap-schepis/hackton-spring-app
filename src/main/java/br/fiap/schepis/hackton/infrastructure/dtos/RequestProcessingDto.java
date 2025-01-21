package br.fiap.schepis.hackton.infrastructure.dtos;

import java.util.ArrayList;
import java.util.List;

public class RequestProcessingDto {
    private String idRequest;

    List<RequestVideoProcessingDto> videosStatus = new ArrayList<>();

    public RequestProcessingDto() {
    }


    public String getIdRequest() {
        return idRequest;
    }

    public void setIdRequest(String idRequest) {
        this.idRequest = idRequest;
    }

    public List<RequestVideoProcessingDto> getVideosStatus() {
        return videosStatus;
    }

    public void setVideosStatus(List<RequestVideoProcessingDto> videosStatus) {
        this.videosStatus = videosStatus;
    }
}
