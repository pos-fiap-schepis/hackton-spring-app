package br.fiap.schepis.hackton.infrastructure.consumers;

import br.fiap.schepis.hackton.core.processor.VideoProcessor;
import br.fiap.schepis.hackton.infrastructure.configuration.RabbitMQConfig;
import br.fiap.schepis.hackton.infrastructure.dtos.VideoRequestDto;
import br.fiap.schepis.hackton.infrastructure.email.EmailService;
import br.fiap.schepis.hackton.infrastructure.enums.StatusProcessamentoEnum;
import br.fiap.schepis.hackton.infrastructure.minio.MinioService;
import br.fiap.schepis.hackton.infrastructure.repositories.VideoProcessorRequestRepository;
import java.io.InputStream;
import java.util.Objects;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class VideoProcessorConsumer {

    private static final Logger logger = LoggerFactory.getLogger(MinioService.class);

    @Autowired
    private MinioService minioService;

    @Autowired
    private VideoProcessor videoProcessor;

    @Autowired
    private VideoProcessorRequestRepository videoProcessorRequestRepository;

    @Autowired
    private EmailService emailService;

    @Value("${output.folder:imagens-processadas/}")
    private String outputFolder;

    @RabbitListener(queues = RabbitMQConfig.QUEUE_NAME)
    public void receiveMessage(VideoRequestDto dto) {
        String errorMessage = null;
        try {
            InputStream video = minioService.downloadFile(dto.getVideoName());
            atualizarEmProcessamento(dto);

            videoProcessor.processVideo(dto.getId(), dto.getVideoName(), video);
            String fileName = dto.getVideoName().split("\\.")[0];
            String fileNameFormatted = outputFolder + fileName + "/" +fileName + ".zip";

            String url = minioService.getUrlDownload(fileNameFormatted);
            logger.info("Video processado e link gerado com sucesso");
            emailService.sendEmail("weillerschepis@gmail.com", "Processamento de vídeo concluído", "O Vídeo: " + dto.getVideoName() +
                    " foi processado com sucesso, clique no link para download : " + url);
        } catch (Exception e) {
            errorMessage = e.getMessage();
            emailService.sendEmail("weillerschepis@gmail.com", "Erro processamento de vídeo", "Ocorreu um erro ao processar o video: " + dto.getVideoName() + " contate o administrador.");
        }

        if (Objects.nonNull(errorMessage)) {
            atualizarErroProcessamento(dto, errorMessage);
        }
    }

    private void atualizarEmProcessamento(VideoRequestDto dto) {
        videoProcessorRequestRepository.findById(dto.getId()).ifPresent(request -> {
            request.setStatus(StatusProcessamentoEnum.EM_PROCESSAMENTO);
            videoProcessorRequestRepository.save(request);
        });
    }

    private void atualizarErroProcessamento(VideoRequestDto dto, String errorMessage) {
        videoProcessorRequestRepository.findById(dto.getId()).ifPresent(request -> {
            request.setStatus(StatusProcessamentoEnum.ERRO);
            request.setErrorMessage(errorMessage);
            videoProcessorRequestRepository.save(request);
        });
    }
}
