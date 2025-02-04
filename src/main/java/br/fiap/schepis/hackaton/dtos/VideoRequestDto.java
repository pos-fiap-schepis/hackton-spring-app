package br.fiap.schepis.hackaton.dtos;

public class VideoRequestDto {

    private Long id;

    private String idRequest;
    private String videoName;
    private Double mb;

    public VideoRequestDto(Long id, String idRequest, String videoName, Double mb) {
        this.id = id;
        this.idRequest = idRequest;
        this.videoName = videoName;
        this.mb = mb;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getIdRequest() {
        return idRequest;
    }

    public void setIdRequest(String idRequest) {
        this.idRequest = idRequest;
    }

    public String getVideoName() {
        return videoName;
    }

    public void setVideoName(String videoName) {
        this.videoName = videoName;
    }

    public Double getMb() {
        return mb;
    }

    public void setMb(Double mb) {
        this.mb = mb;
    }
}
