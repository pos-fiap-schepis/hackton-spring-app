package br.fiap.schepis.hackton.core.processor;

import br.fiap.schepis.hackton.infrastructure.common.RandomIdGenerator;
import br.fiap.schepis.hackton.infrastructure.dtos.VideoRequestDto;
import br.fiap.schepis.hackton.infrastructure.minio.MinioService;
import br.fiap.schepis.hackton.infrastructure.producers.VideoProcessorProducer;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class VideoService {

    private static final Logger logger = LoggerFactory.getLogger(VideoService.class);

    @Autowired
    private MinioService minioService;

    @Autowired
    private VideoProcessorProducer producer;

    public void prepararProcessamentoVideos(List<MultipartFile> videos) {
        videos.forEach(v -> {
            try {
                logger.info("Enviando arquivo: {}", v.getOriginalFilename());
                minioService.uploadFile(v);

                String idRequest = RandomIdGenerator.generateRandomId();
                Double fileSizeInMB = v.getSize() / (1024.0 * 1024.0);
                VideoRequestDto dto = new VideoRequestDto(idRequest, v.getOriginalFilename(), fileSizeInMB);

                logger.info("Enviando requisição com ID: {}", idRequest);
                producer.sendMessage(dto);
                logger.info("Requisição com ID {} enviada:", idRequest);
            } catch (Exception e) {
                logger.error("Erro ao preparar requisição do vídeo: {}", v.getOriginalFilename(), e);
                throw new RuntimeException(e);
            }
        });
    }

}
