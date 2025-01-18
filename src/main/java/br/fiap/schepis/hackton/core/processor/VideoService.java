package br.fiap.schepis.hackton.core.processor;

import br.fiap.schepis.hackton.infrastructure.common.RandomIdGenerator;
import br.fiap.schepis.hackton.infrastructure.dtos.VideoRequestDto;
import br.fiap.schepis.hackton.infrastructure.enums.StatusProcessamentoEnum;
import br.fiap.schepis.hackton.infrastructure.minio.MinioService;
import br.fiap.schepis.hackton.infrastructure.producers.VideoProcessorProducer;
import br.fiap.schepis.hackton.infrastructure.repositories.VideoProcessorMetadata;
import br.fiap.schepis.hackton.infrastructure.repositories.VideoProcessorRequest;
import br.fiap.schepis.hackton.infrastructure.repositories.VideoProcessorRequestRepository;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.util.List;
import org.bytedeco.javacv.FFmpegFrameGrabber;
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

    @Autowired
    private VideoProcessorRequestRepository repository;

    public void prepararProcessamentoVideos(List<MultipartFile> videos) {
        String idRequest = RandomIdGenerator.generateRandomId();

        videos.forEach(v -> {
            try {
                Double fileSizeInMB = v.getSize() / (1024.0 * 1024.0);

                logger.info("Enviando arquivo: {}", v.getOriginalFilename());
                VideoProcessorMetadata videoProcessorMetadata = new VideoProcessorMetadata(fileSizeInMB, v.getOriginalFilename(), getVideoDurationInSeconds(v));
                VideoProcessorRequest videoProcessorRequest = new VideoProcessorRequest(idRequest, LocalDateTime.now(),
                        "user", "email", StatusProcessamentoEnum.ENVIADO, videoProcessorMetadata);
                repository.save(videoProcessorRequest);

                minioService.uploadFile(v);

                VideoRequestDto dto = new VideoRequestDto(videoProcessorRequest.getId(), idRequest, v.getOriginalFilename(), fileSizeInMB);

                logger.info("Enviando requisição com ID: {}", idRequest);
                producer.sendMessage(dto);
                logger.info("Requisição com ID {} enviada:", idRequest);
            } catch (Exception e) {
                logger.error("Erro ao preparar requisição do vídeo: {}", v.getOriginalFilename(), e);
                throw new RuntimeException(e);
            }
        });
    }



    public int getVideoDurationInSeconds(MultipartFile videoFile) throws Exception {
        try (InputStream inputStream = videoFile.getInputStream()) {
            FFmpegFrameGrabber grabber = new FFmpegFrameGrabber(inputStream);
            grabber.start();
            int durationInSeconds = (int) (grabber.getLengthInTime() / 1_000_000);
            grabber.stop();
            return durationInSeconds;
        }
    }

}
