package br.fiap.schepis.hackaton.processor;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyLong;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.atLeastOnce;
import static org.mockito.Mockito.doThrow;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import br.fiap.schepis.hackaton.enums.StatusProcessamentoEnum;
import br.fiap.schepis.hackaton.minio.MinioService;
import br.fiap.schepis.hackaton.repositories.VideoProcessorMetadata;
import br.fiap.schepis.hackaton.repositories.VideoProcessorRequest;
import br.fiap.schepis.hackaton.repositories.VideoProcessorRequestRepository;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;


public class VideoProcessorTest {

  @Mock
  private MinioService minioService;

  @Mock
  private VideoProcessorRequestRepository videoProcessorRequestRepository;

  @Mock
  private VideoProcessorMetadata videoProcessorMetadata;

  @InjectMocks
  private VideoProcessor videoProcessor;

  private VideoProcessorRequest videoProcessorRequest;

  @BeforeEach
  public void setUp() {
    MockitoAnnotations.openMocks(this);
    videoProcessorRequest = new VideoProcessorRequest(
      "12345",
      LocalDateTime.now(),
      "userApp",
      "email@example.com",
      StatusProcessamentoEnum.EM_PROCESSAMENTO,
      videoProcessorMetadata
    );
  }

  @Test
  public void testProcessVideo_Success() throws Exception {
    InputStream videoStream = Files.newInputStream(Paths.get("src/test/resources/testVideo.mp4"));
    when(videoProcessorRequestRepository.findById(anyLong())).thenReturn(java.util.Optional.of(videoProcessorRequest));

    videoProcessor.processVideo(1L, "testVideo.mp4", videoStream);

    verify(minioService, atLeastOnce()).uploadFile(anyString(), any(InputStream.class), anyLong(), anyString());
    verify(videoProcessorRequestRepository, atLeastOnce()).save(any());
  }

  @Test
  public void testProcessVideo_Exception() throws Exception {
    InputStream videoStream = Files.newInputStream(Paths.get("src/test/resources/testVideo.mp4"));
    doThrow(new RuntimeException("Error")).when(minioService).uploadFile(anyString(), any(InputStream.class), anyLong(), anyString());

    videoProcessor.processVideo(1L, "testVideo.mp4", videoStream);

    verify(minioService, atLeastOnce()).uploadFile(anyString(), any(InputStream.class), anyLong(), anyString());
    verify(videoProcessorRequestRepository, never()).save(any());
  }
}