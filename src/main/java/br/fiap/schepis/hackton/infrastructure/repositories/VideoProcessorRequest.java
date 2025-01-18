package br.fiap.schepis.hackton.infrastructure.repositories;

import br.fiap.schepis.hackton.infrastructure.enums.StatusProcessamentoEnum;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import java.time.LocalDateTime;

@Entity
@Table(name = "VIDEO_PROCESSOR_REQUEST", schema = "HACKATON")
public class VideoProcessorRequest {

    @Id
    @Column(name = "id", length = 100, nullable = false)
    private String id;

    @Column(name = "date_request", nullable = false)
    private LocalDateTime dateRequest;

    @Column(name = "user_app", length = 100, nullable = false)
    private String userApp;

    @Column(name = "email", length = 200, nullable = false)
    private String email;

    @Column(name = "status", nullable = false)
    @Enumerated(EnumType.STRING)
    private StatusProcessamentoEnum status;

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "id_metadata", nullable = false)
    private VideoProcessorMetadata videoProcessorMetadata;


    public VideoProcessorRequest() {
    }

    public VideoProcessorRequest(String id, LocalDateTime dateRequest, String userApp, String email, StatusProcessamentoEnum status, VideoProcessorMetadata videoProcessorMetadata) {
        this.id = id;
        this.dateRequest = dateRequest;
        this.userApp = userApp;
        this.email = email;
        this.status = status;
        this.videoProcessorMetadata = videoProcessorMetadata;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public LocalDateTime getDateRequest() {
        return dateRequest;
    }

    public void setDateRequest(LocalDateTime dateRequest) {
        this.dateRequest = dateRequest;
    }

    public String getUserApp() {
        return userApp;
    }

    public void setUserApp(String userApp) {
        this.userApp = userApp;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public StatusProcessamentoEnum getStatus() {
        return status;
    }

    public void setStatus(StatusProcessamentoEnum status) {
        this.status = status;
    }

    public VideoProcessorMetadata getVideoProcessorMetadata() {
        return videoProcessorMetadata;
    }

    public void setVideoProcessorMetadata(VideoProcessorMetadata videoProcessorMetadata) {
        this.videoProcessorMetadata = videoProcessorMetadata;
    }
}