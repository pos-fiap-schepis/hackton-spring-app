package br.fiap.schepis.hackton.infrastructure.repositories;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface VideoProcessorRequestRepository extends JpaRepository<VideoProcessorRequest, Long> {

    @Query("select v from VideoProcessorRequest v join fetch v.videoProcessorMetadata where v.idRequest = :idRequest")
    List<VideoProcessorRequest> findByIdRequest(String idRequest);

}
