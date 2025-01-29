package br.fiap.schepis.hackaton.infrastructure.repositories;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;

@Entity
@Table(name = "VIDEO_PROCESSOR_METADATA", schema = "HACKATON")
@SequenceGenerator(name = "SQ_VIDEO_PROCESSOR_METADATA", sequenceName = "HACKATON.SQ_VIDEO_PROCESSOR_METADATA", allocationSize = 1, initialValue = 1)
public class VideoProcessorMetadata {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SQ_VIDEO_PROCESSOR_METADATA")
    @Column(name = "id", length = 100, nullable = false)
    private Long id;

    @Column(name = "mb", nullable = false)
    private Double mb;

    @Column(name = "filename", length = 100, nullable = false)
    private String filename;

    @Column(name = "seconds", length = 200, nullable = false)
    private Integer minutes;

    public VideoProcessorMetadata() {
    }

    public VideoProcessorMetadata(Double mb, String filename, Integer minutes) {
        this.mb = mb;
        this.filename = filename;
        this.minutes = minutes;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Double getMb() {
        return mb;
    }

    public void setMb(Double mb) {
        this.mb = mb;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public Integer getMinutes() {
        return minutes;
    }

    public void setMinutes(Integer minutes) {
        this.minutes = minutes;
    }
}