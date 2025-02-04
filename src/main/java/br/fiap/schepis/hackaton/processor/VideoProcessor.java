package br.fiap.schepis.hackaton.processor;

import br.fiap.schepis.hackaton.enums.StatusProcessamentoEnum;
import br.fiap.schepis.hackaton.minio.MinioService;
import br.fiap.schepis.hackaton.repositories.VideoProcessorRequestRepository;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
import javax.imageio.ImageIO;
import org.bytedeco.javacv.FFmpegFrameGrabber;
import org.bytedeco.javacv.Frame;
import org.bytedeco.javacv.Java2DFrameConverter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class VideoProcessor {

    private static final Logger logger = LoggerFactory.getLogger(VideoProcessor.class);

    @Value("${output.folder:imagens-processadas/}")
    private String outputFolder;

    @Autowired
    private MinioService minioService;

    @Autowired
    private VideoProcessorRequestRepository videoProcessorRequestRepository;

    public void processVideo(Long id, String videoName, InputStream video) {
        int intervalSeconds = 20; // Intervalo de captura (em segundos)
        String fileName = videoName.split("\\.")[0];
        String outputFormatted = this.outputFolder + fileName;
        String outputZipFormatted = outputFormatted;
        try {
            // Inicializando o FFmpegFrameGrabber
            FFmpegFrameGrabber grabber = new FFmpegFrameGrabber(video);
            grabber.start();

            // Definir o intervalo de captura
            double frameRate = grabber.getFrameRate();
            double intervalFrames = frameRate * intervalSeconds;
            gerarImagensEnviarMinio(outputFormatted, grabber, frameRate, intervalFrames);
            grabber.stop();

            outputZipFormatted += "/" + (fileName + ".zip");
            generateZip(outputZipFormatted);
            atualizarProcessado(id);
        } catch (Exception e) {
            logger.error("Error ao processar video: {}", videoName, e);
            e.printStackTrace();
        }
    }

    private void gerarImagensEnviarMinio(String outputFormatted, FFmpegFrameGrabber grabber, double frameRate, double intervalFrames) throws IOException {
        for (int currentTimeInFrames = 0; currentTimeInFrames < grabber.getLengthInFrames(); currentTimeInFrames += intervalFrames) {
            grabber.setFrameNumber(currentTimeInFrames);
            Frame frame = grabber.grabImage();

            if (frame != null) {
                // Converter o Frame para BufferedImage
                BufferedImage bufferedImage = new Java2DFrameConverter().convert(frame);

                // Criar um ByteArrayOutputStream para armazenar a imagem
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                ImageIO.write(bufferedImage, "jpg", outputStream);
                String objectName = "frame_at_" + (currentTimeInFrames / frameRate) + ".jpg";

                // Obter os bytes da imagem
                byte[] imageBytes = outputStream.toByteArray();
                minioService.uploadFile(outputFormatted + "/" + objectName, new ByteArrayInputStream(imageBytes), imageBytes.length, "image/jpeg");

                logger.info("Processando frame: " + (currentTimeInFrames / frameRate));
            }
        }
    }


    private void generateZip(String outputFolder) {
        try (ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
             ZipOutputStream zipOutputStream = new ZipOutputStream(byteArrayOutputStream)) {

            zipOutputStream.setLevel(9); // Definir nível de compactação (opcional)

            File folder = new File(outputFolder);
            File[] files = folder.listFiles((dir, name) -> name.endsWith(".jpg"));

            if (files != null) {
                for (File file : files) {
                    try (FileInputStream fis = new FileInputStream(file)) {
                        ZipEntry zipEntry = new ZipEntry(file.getName());
                        zipOutputStream.putNextEntry(zipEntry);

                        byte[] buffer = new byte[1024];
                        int length;
                        while ((length = fis.read(buffer)) >= 0) {
                            zipOutputStream.write(buffer, 0, length);
                        }
                        zipOutputStream.closeEntry();
                    }
                }
            }

            // Fechar o ZipOutputStream para garantir que os dados sejam gravados
            zipOutputStream.finish();

            // Obter os bytes do ZIP
            byte[] zipBytes = byteArrayOutputStream.toByteArray();

            minioService.uploadFile(outputFolder, new ByteArrayInputStream(zipBytes), zipBytes.length, "application/zip");

        } catch (Exception e) {
            logger.error("Error ao processar video");
            throw new RuntimeException(e);
        }
    }

    private void atualizarProcessado(Long id) {
        videoProcessorRequestRepository.findById(id).ifPresent(request -> {
            request.setStatus(StatusProcessamentoEnum.PROCESSADO);
            videoProcessorRequestRepository.save(request);
        });
    }
}