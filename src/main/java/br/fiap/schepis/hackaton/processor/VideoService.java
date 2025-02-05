package br.fiap.schepis.hackaton.processor;

import br.fiap.schepis.hackaton.common.UsuarioLogado;
import br.fiap.schepis.hackaton.common.RandomIdGenerator;
import br.fiap.schepis.hackaton.dtos.RequestDownloadDto;
import br.fiap.schepis.hackaton.dtos.RequestProcessingDto;
import br.fiap.schepis.hackaton.dtos.RequestStatusDto;
import br.fiap.schepis.hackaton.dtos.RequestVideoProcessingDto;
import br.fiap.schepis.hackaton.dtos.VideoDownloadDto;
import br.fiap.schepis.hackaton.dtos.VideoRequestDto;
import br.fiap.schepis.hackaton.email.EmailService;
import br.fiap.schepis.hackaton.enums.StatusProcessamentoEnum;
import br.fiap.schepis.hackaton.minio.MinioService;
import br.fiap.schepis.hackaton.producers.VideoProcessorProducer;
import br.fiap.schepis.hackaton.repositories.VideoProcessorMetadata;
import br.fiap.schepis.hackaton.repositories.VideoProcessorRequest;
import br.fiap.schepis.hackaton.repositories.VideoProcessorRequestRepository;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.util.List;
import org.bytedeco.javacv.FFmpegFrameGrabber;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.security.oauth2.jwt.Jwt;

@Service
public class VideoService {

    private static final Logger logger = LoggerFactory.getLogger(VideoService.class);

    @Autowired
    private MinioService minioService;

    @Autowired
    private VideoProcessorProducer producer;

    @Autowired
    private VideoProcessorRequestRepository repository;

    @Autowired
    private EmailService emailService;

    @Value("${output.folder:imagens-processadas/}")
    private String outputFolder;

    public RequestProcessingDto prepareVideosProcessing(List<MultipartFile> videos) {
        String idRequest = RandomIdGenerator.generateRandomId();
        RequestProcessingDto requestProcessingDto = new RequestProcessingDto();
        requestProcessingDto.setIdRequest(idRequest);
        Jwt usuarioLogado = UsuarioLogado.getJwt();

        videos.forEach(v -> {
            try {
                Double fileSizeInMB = v.getSize() / (1024.0 * 1024.0);

                logger.info("Enviando arquivo: {}", v.getOriginalFilename());
                VideoProcessorMetadata videoProcessorMetadata = new VideoProcessorMetadata(fileSizeInMB, v.getOriginalFilename(), getVideoDurationInSeconds(v));
                VideoProcessorRequest videoProcessorRequest = new VideoProcessorRequest(idRequest, LocalDateTime.now(),
                        usuarioLogado.getClaim("preferred_username"), usuarioLogado.getClaim("email"), StatusProcessamentoEnum.ENVIADO, videoProcessorMetadata);
                repository.save(videoProcessorRequest);

                minioService.uploadFile(v);

                VideoRequestDto dto = new VideoRequestDto(videoProcessorRequest.getId(), idRequest, v.getOriginalFilename(), fileSizeInMB);

                logger.info("Enviando requisição com ID: {}", idRequest);
                producer.sendMessage(dto);
                logger.info("Requisição com ID {} enviada:", idRequest);

                requestProcessingDto.getVideosStatus().add(new RequestVideoProcessingDto(v.getOriginalFilename(), StatusProcessamentoEnum.ENVIADO, "Video: " + v.getOriginalFilename() + " enviado com sucesso"));

                emailService.sendEmail(usuarioLogado.getClaim("email"), "Processamento de vídeo", "Seu vídeo: " + v.getOriginalFilename() + " está sendo processado, aguarde o link para download.");
            } catch (Exception e) {
                logger.error("Erro ao preparar requisição do vídeo: {}", v.getOriginalFilename(), e);
                requestProcessingDto.getVideosStatus().add(new RequestVideoProcessingDto(v.getOriginalFilename(), StatusProcessamentoEnum.ERRO, "Erro ao enviar video: " + v.getOriginalFilename() + " Mensagem: " + e.getMessage()));
                emailService.sendEmail(usuarioLogado.getClaim("email"), "Processamento de vídeo", "Ocorreu um erro ao enviar o vídeo para processamento: " + v.getOriginalFilename() + " contate o administrador.");
            }
        });

        return requestProcessingDto;
    }

    public List<RequestStatusDto> getVideosStatusProcessing(String idRequest) {
        List<VideoProcessorRequest> videos = repository.findByIdRequest(idRequest);
        return videos.stream().map(v -> new RequestStatusDto(v.getIdRequest(), v.getVideoProcessorMetadata().getFilename(), v.getStatus(),  null)).toList();
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

    public RequestDownloadDto getUrlDownload(String idRequest) {
        List<VideoProcessorRequest> videoProcessorRequest = repository.findByIdRequest(idRequest);
        RequestDownloadDto dto = new RequestDownloadDto();
        dto.setIdRequest(idRequest);

        videoProcessorRequest.forEach(v -> {
            if (StatusProcessamentoEnum.PROCESSADO.equals(v.getStatus())) {
                String fileName = v.getVideoProcessorMetadata().getFilename().split("\\.")[0];

                String fileNameFormatted = outputFolder + "/" +fileName + ".zip";
                String url = minioService.getUrlDownload(fileNameFormatted);
                dto.getVideo().add(new VideoDownloadDto(v.getVideoProcessorMetadata().getFilename(), url, v.getStatus(), null));
            } else {
                dto.getVideo().add(new VideoDownloadDto(v.getVideoProcessorMetadata().getFilename(), null, v.getStatus(), "Não há link para download, arquivo não foi processado."));
            }


        });

        return dto;
    }

}
