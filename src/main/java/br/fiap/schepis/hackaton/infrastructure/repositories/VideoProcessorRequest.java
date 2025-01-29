package br.fiap.schepis.hackaton.infrastructure.repositories;

import br.fiap.schepis.hackaton.infrastructure.enums.StatusProcessamentoEnum;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import java.time.LocalDateTime;

@Entity
@Table(name = "VIDEO_PROCESSOR_REQUEST", schema = "HACKATON")
@SequenceGenerator(name = "SQ_VIDEO_PROCESSOR_REQUEST", sequenceName = "HACKATON.SQ_VIDEO_PROCESSOR_REQUEST", allocationSize = 1, initialValue = 1)
public class VideoProcessorRequest {

    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SQ_VIDEO_PROCESSOR_REQUEST")
    private Long id;

    @Column(name = "id_request", length = 100, nullable = false)
    private String idRequest;

    @Column(name = "date_request", nullable = false)
    private LocalDateTime dateRequest;

    @Column(name = "user_app", length = 100, nullable = false)
    private String userApp;

    @Column(name = "email", length = 200, nullable = false)
    private String email;

    @Column(name = "status", nullable = false)
    @Enumerated(EnumType.STRING)
    private StatusProcessamentoEnum status;

    @Column(name = "error_message", length = 4000)
    private String errorMessage;

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "id_metadata", nullable = false)
    private VideoProcessorMetadata videoProcessorMetadata;


    public VideoProcessorRequest() {
    }

    public VideoProcessorRequest(String idRequest, LocalDateTime dateRequest, String userApp, String email, StatusProcessamentoEnum status, VideoProcessorMetadata videoProcessorMetadata) {
        this.idRequest = idRequest;
        this.dateRequest = dateRequest;
        this.userApp = userApp;
        this.email = email;
        this.status = status;
        this.videoProcessorMetadata = videoProcessorMetadata;
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

    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }
}