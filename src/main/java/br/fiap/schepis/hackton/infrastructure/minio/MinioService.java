package br.fiap.schepis.hackton.infrastructure.minio;

import io.minio.BucketExistsArgs;
import io.minio.GetObjectArgs;
import io.minio.GetPresignedObjectUrlArgs;
import io.minio.MakeBucketArgs;
import io.minio.MinioClient;
import io.minio.PutObjectArgs;
import io.minio.http.Method;
import java.io.InputStream;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class MinioService {

    private static final Logger logger = LoggerFactory.getLogger(MinioService.class);

    @Autowired
    private MinioClient minioClient;

    @Value("${minio.bucket-name}")
    private String bucketName;

    public void uploadFile(MultipartFile file) {
        try {
            // Cria o bucket se ele não existir
            if (!minioClient.bucketExists(BucketExistsArgs.builder().bucket(bucketName).build())) {
                minioClient.makeBucket(MakeBucketArgs.builder().bucket(bucketName).build());
            }

            // Faz o upload do arquivo
            minioClient.putObject(PutObjectArgs.builder()
                    .bucket(bucketName)
                    .object(file.getOriginalFilename())
                    .stream(file.getInputStream(), file.getSize(), -1) // InputStream direto
                    .contentType(file.getContentType())
                    .build());

            // Log após a conclusão do upload
            logger.info("Upload do arquivo '{}' concluído com sucesso.", file.getOriginalFilename());
        } catch (Exception e) {
            logger.error("Erro ao fazer upload do arquivo no bucket: {}.", file.getOriginalFilename());
            throw new RuntimeException("Erro ao fazer upload do arquivo no bucket.");
        }
    }

    public void uploadFile(String fileName, InputStream inputStream, long size, String contentType) {
        try {
            // Cria o bucket se ele não existir
            if (!minioClient.bucketExists(BucketExistsArgs.builder().bucket(bucketName).build())) {
                minioClient.makeBucket(MakeBucketArgs.builder().bucket(bucketName).build());
            }

            // Faz o upload do arquivo
            minioClient.putObject(PutObjectArgs.builder()
                    .bucket(bucketName)
                    .object(fileName)
                    .stream(inputStream, size, -1) // InputStream direto
                    .contentType(contentType)
                    .build());

            // Log após a conclusão do upload
            logger.info("Upload do arquivo '{}' concluído com sucesso.", fileName);
        } catch (Exception e) {
            logger.error("Erro ao fazer download do arquivo no bucket: {}.", fileName);
            throw new RuntimeException("Erro ao fazer upload do arquivo no bucket.");
        }
    }

    public InputStream downloadFile(String fileName) throws Exception {
        // Faz o download do arquivo
        return minioClient.getObject(GetObjectArgs.builder()
                .bucket(bucketName)
                .object(fileName)
                .build());
    }

    public String getUrlDownload(String fileName) {
        try {
            return minioClient.getPresignedObjectUrl(
                    GetPresignedObjectUrlArgs.builder()
                            .method(Method.GET)
                            .bucket(bucketName)
                            .object(fileName)
                            .expiry(3600)
                            .build()
            );
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
