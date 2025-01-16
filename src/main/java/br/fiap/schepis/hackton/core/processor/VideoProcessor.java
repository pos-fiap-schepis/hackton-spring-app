package br.fiap.schepis.hackton.core.processor;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
import javax.imageio.ImageIO;
import org.bytedeco.javacv.FFmpegFrameGrabber;
import org.bytedeco.javacv.Frame;
import org.bytedeco.javacv.Java2DFrameConverter;
import org.springframework.stereotype.Service;

@Service
public class VideoProcessor {


    public void processVideo(InputStream video) throws IOException {
        String outputFolder = "src/main/resources/processado/";
        int intervalSeconds = 20; // Intervalo de captura (em segundos)

        try {
            // Criação do diretório de saída, caso não exista
            File outputDir = new File(outputFolder);
            if (!outputDir.exists()) {
                outputDir.mkdirs();
            }

            // Inicializando o FFmpegFrameGrabber
            FFmpegFrameGrabber grabber = new FFmpegFrameGrabber(video);
            grabber.start();

            // Definir o intervalo de captura
            double frameRate = grabber.getFrameRate();
            double intervalFrames = frameRate * intervalSeconds;

            for (int currentTimeInFrames = 0; currentTimeInFrames < grabber.getLengthInFrames(); currentTimeInFrames += intervalFrames) {
                grabber.setFrameNumber(currentTimeInFrames);
                Frame frame = grabber.grabImage();

                if (frame != null) {
                    // Converter o Frame para BufferedImage
                    BufferedImage bufferedImage = new Java2DFrameConverter().convert(frame);

                    // Nome do arquivo de saída
                    String outputPath = outputFolder + File.separator + "frame_at_" + (currentTimeInFrames / frameRate) + ".jpg";
                    File outputFile = new File(outputPath);

                    // Salvar a imagem
                    ImageIO.write(bufferedImage, "jpg", outputFile);
                    System.out.println("Processando frame: " + (currentTimeInFrames / frameRate));
                }
            }

            grabber.stop();

            String destinationZipFilePath = "src/main/resources/processado/images.zip";
            generateZip(outputFolder, destinationZipFilePath);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void generateZip(String outputFolder, String zipFilePath) {
        try (ZipOutputStream zipOutputStream = new ZipOutputStream(new FileOutputStream(zipFilePath))) {
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
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
