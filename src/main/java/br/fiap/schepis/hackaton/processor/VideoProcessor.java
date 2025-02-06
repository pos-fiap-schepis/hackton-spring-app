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
        String outputZipFormatted = this.outputFolder + fileName + ".zip";

        try (ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
             ZipOutputStream zipOutputStream = new ZipOutputStream(byteArrayOutputStream)) {

            zipOutputStream.setLevel(9); // Nível máximo de compressão

            // Inicializando o FFmpegFrameGrabber
            FFmpegFrameGrabber grabber = new FFmpegFrameGrabber(video);
            grabber.start();

            // Definir o intervalo de captura
            double frameRate = grabber.getFrameRate();
            double intervalFrames = frameRate * intervalSeconds;

            // Gerar imagens e adicioná-las diretamente ao ZIP
            gerarImagensNoZip(zipOutputStream, grabber, frameRate, intervalFrames);

            grabber.stop();
            zipOutputStream.finish();

            // Fazer upload do ZIP para o MinIO
            byte[] zipBytes = byteArrayOutputStream.toByteArray();
            minioService.uploadFile(outputZipFormatted, new ByteArrayInputStream(zipBytes), zipBytes.length, "application/zip");

            atualizarProcessado(id);

        } catch (Exception e) {
            logger.error("Erro ao processar vídeo: {}", videoName, e);
            e.printStackTrace();
        }
    }

    private void gerarImagensNoZip(ZipOutputStream zipOutputStream, FFmpegFrameGrabber grabber, double frameRate, double intervalFrames) throws IOException {
        for (int currentTimeInFrames = 0; currentTimeInFrames < grabber.getLengthInFrames(); currentTimeInFrames += intervalFrames) {
            grabber.setFrameNumber(currentTimeInFrames);
            Frame frame = grabber.grabImage();

            if (frame != null) {
                // Converter o Frame para BufferedImage
                BufferedImage bufferedImage = new Java2DFrameConverter().convert(frame);

                // Criar um ByteArrayOutputStream para armazenar a imagem
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                ImageIO.write(bufferedImage, "jpg", outputStream);

                // Obter os bytes da imagem
                byte[] imageBytes = outputStream.toByteArray();
                String imageName = "frame_at_" + (currentTimeInFrames / frameRate) + ".jpg";

                // Adicionar imagem diretamente ao ZIP
                ZipEntry zipEntry = new ZipEntry(imageName);
                zipOutputStream.putNextEntry(zipEntry);
                zipOutputStream.write(imageBytes);
                zipOutputStream.closeEntry();

                logger.info("Adicionando frame ao ZIP: " + imageName);
            }
        }
    }

    private void atualizarProcessado(Long id) {
        videoProcessorRequestRepository.findById(id).ifPresent(request -> {
            request.setStatus(StatusProcessamentoEnum.PROCESSADO);
            videoProcessorRequestRepository.save(request);
        });
    }
}