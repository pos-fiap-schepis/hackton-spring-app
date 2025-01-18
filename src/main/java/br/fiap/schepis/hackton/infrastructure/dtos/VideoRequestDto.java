package br.fiap.schepis.hackton.infrastructure.dtos;

public class VideoRequestDto {

    private String id;
    private String videoName;
    private Double mb;

    public VideoRequestDto(String id, String videoName, Double mb) {
        this.id = id;
        this.videoName = videoName;
        this.mb = mb;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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
