package br.fiap.schepis.hackaton.minio;


import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import io.minio.BucketExistsArgs;
import io.minio.MakeBucketArgs;
import io.minio.MinioClient;
import io.minio.PutObjectArgs;
import java.io.ByteArrayInputStream;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.web.multipart.MultipartFile;

public class MinioServiceTest {

  @Mock
  private MinioClient minioClient;

  @Mock
  private MultipartFile multipartFile;

  @InjectMocks
  private MinioService minioService;

  @BeforeEach
  public void setUp() {
    MockitoAnnotations.openMocks(this);
  }



  @Test
  public void testUploadFile_Exception() throws Exception {
    when(multipartFile.getOriginalFilename()).thenReturn("testFile.txt");
    when(multipartFile.getInputStream()).thenReturn(new ByteArrayInputStream(new byte[0]));
    when(multipartFile.getSize()).thenReturn(0L);
    when(multipartFile.getContentType()).thenReturn("text/plain");
    when(minioClient.bucketExists(any(BucketExistsArgs.class))).thenThrow(new RuntimeException("Error"));

    assertThrows(RuntimeException.class, () -> minioService.uploadFile(multipartFile));

    verify(minioClient, never()).makeBucket(any(MakeBucketArgs.class));
    verify(minioClient, never()).putObject(any(PutObjectArgs.class));
  }
}