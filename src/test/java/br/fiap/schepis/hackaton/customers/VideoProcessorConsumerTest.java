package br.fiap.schepis.hackaton.customers;


import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyLong;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.atLeastOnce;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import br.fiap.schepis.hackaton.consumers.VideoProcessorConsumer;
import br.fiap.schepis.hackaton.dtos.VideoRequestDto;
import br.fiap.schepis.hackaton.email.EmailService;
import br.fiap.schepis.hackaton.enums.StatusProcessamentoEnum;
import br.fiap.schepis.hackaton.minio.MinioService;
import br.fiap.schepis.hackaton.processor.VideoProcessor;
import br.fiap.schepis.hackaton.repositories.VideoProcessorRequest;
import br.fiap.schepis.hackaton.repositories.VideoProcessorRequestRepository;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.Optional;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

public class VideoProcessorConsumerTest {

  @Mock
  private MinioService minioService;

  @Mock
  private VideoProcessor videoProcessor;

  @Mock
  private VideoProcessorRequestRepository videoProcessorRequestRepository;

  @Mock
  private EmailService emailService;

  @InjectMocks
  private VideoProcessorConsumer videoProcessorConsumer;

  private VideoRequestDto videoRequestDto;
  private VideoProcessorRequest videoProcessorRequest;

  @BeforeEach
  public void setUp() {
    MockitoAnnotations.openMocks(this);
    videoRequestDto = new VideoRequestDto(
      1L,
    "testVideo.mp4",
      "teste",
      10.0
    );
    videoRequestDto.setId(1L);
    videoRequestDto.setVideoName("testVideo.mp4");

    videoProcessorRequest = new VideoProcessorRequest();
    videoProcessorRequest.setId(1L);
    videoProcessorRequest.setEmail("email@example.com");
    videoProcessorRequest.setStatus(StatusProcessamentoEnum.EM_PROCESSAMENTO);
  }

  @Test
  public void testReceiveMessage_Success() throws Exception {
    InputStream videoStream = new ByteArrayInputStream(new byte[0]);
    when(minioService.downloadFile(anyString())).thenReturn(videoStream);
    when(videoProcessorRequestRepository.findById(anyLong())).thenReturn(Optional.of(videoProcessorRequest));
    when(minioService.getUrlDownload(anyString())).thenReturn("http://example.com/download/testVideo.zip");

    videoProcessorConsumer.receiveMessage(videoRequestDto);

    verify(videoProcessorRequestRepository, atLeastOnce()).save(any(VideoProcessorRequest.class));
    verify(minioService, atLeastOnce()).downloadFile(anyString());
    verify(videoProcessor, atLeastOnce()).processVideo(anyLong(), anyString(), any(InputStream.class));
    verify(emailService, atLeastOnce()).sendEmail(anyString(), anyString(), anyString());
  }

  @Test
  public void testReceiveMessage_Exception() throws Exception {
    when(minioService.downloadFile(anyString())).thenThrow(new RuntimeException("Error"));
    when(videoProcessorRequestRepository.findById(anyLong())).thenReturn(Optional.of(videoProcessorRequest));

    videoProcessorConsumer.receiveMessage(videoRequestDto);

    verify(videoProcessorRequestRepository, atLeastOnce()).save(any(VideoProcessorRequest.class));
    verify(minioService, atLeastOnce()).downloadFile(anyString());
    verify(emailService, atLeastOnce()).sendEmail(anyString(), anyString(), anyString());
  }
}
