package br.fiap.schepis.hackton.infrastructure.consumers;

import br.fiap.schepis.hackton.core.processor.VideoProcessor;
import br.fiap.schepis.hackton.infrastructure.configuration.RabbitMQConfig;
import br.fiap.schepis.hackton.infrastructure.dtos.VideoRequestDto;
import br.fiap.schepis.hackton.infrastructure.enums.StatusProcessamentoEnum;
import br.fiap.schepis.hackton.infrastructure.minio.MinioService;
import br.fiap.schepis.hackton.infrastructure.repositories.VideoProcessorRequestRepository;
import java.io.InputStream;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VideoProcessorConsumer {

    @Autowired
    private MinioService minioService;

    @Autowired
    private VideoProcessor videoProcessor;

    @Autowired
    private VideoProcessorRequestRepository videoProcessorRequestRepository;

    @RabbitListener(queues = RabbitMQConfig.QUEUE_NAME)
    public void receiveMessage(VideoRequestDto dto) {

        try {
            InputStream video = minioService.downloadFile(dto.getVideoName());
            atualizarEmProcessamento(dto);

            videoProcessor.processVideo(dto.getId(), dto.getVideoName(), video);
            System.out.println("Mensagem recebida: " + dto.getId());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private void atualizarEmProcessamento(VideoRequestDto dto) {
        videoProcessorRequestRepository.findById(dto.getId()).ifPresent(request -> {
            request.setStatus(StatusProcessamentoEnum.EM_PROCESSAMENTO);
            videoProcessorRequestRepository.save(request);
        });
    }
}
