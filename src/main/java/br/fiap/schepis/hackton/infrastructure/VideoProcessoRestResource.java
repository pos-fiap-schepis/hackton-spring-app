package br.fiap.schepis.hackton.infrastructure;

import br.fiap.schepis.hackton.core.processor.VideoProcessor;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/api/video")
public class VideoProcessoRestResource {

    @Autowired
    private VideoProcessor videoProcessor;


    @PostMapping("/upload")
    public ResponseEntity<String> uploadVideos(@RequestParam("files") List<MultipartFile> files) {
//        long totalSize = files.stream().mapToLong(MultipartFile::getSize).sum();
//        if (totalSize > 10 * 1024 * 1024) { // 10MB
//            return ResponseEntity.status(HttpStatus.PAYLOAD_TOO_LARGE).body("Tamanho máximo permitido é de 10MB");
//        }

        for (MultipartFile file : files) {
            try {
                videoProcessor.processVideo(file.getInputStream());
            } catch (IOException e) {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Erro ao processar video: " + file.getOriginalFilename());
            }
        }

        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Todos os videos foram enviados para processamento");
    }

    @GetMapping("/download")
    public ResponseEntity<InputStreamResource> downloadZip() throws IOException {
        String zipFilePath = "src/main/resources/processado/images.zip";
        File zipFile = new File(zipFilePath);

        InputStreamResource resource = new InputStreamResource(new FileInputStream(zipFile));

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=" + zipFile.getName())
                .contentType(MediaType.APPLICATION_OCTET_STREAM)
                .contentLength(zipFile.length())
                .body(resource);
    }
}
