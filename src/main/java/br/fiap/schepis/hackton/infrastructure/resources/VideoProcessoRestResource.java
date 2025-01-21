package br.fiap.schepis.hackton.infrastructure.resources;

import br.fiap.schepis.hackton.core.processor.VideoService;
import br.fiap.schepis.hackton.infrastructure.dtos.RequestDownloadDto;
import br.fiap.schepis.hackton.infrastructure.dtos.RequestProcessingDto;
import br.fiap.schepis.hackton.infrastructure.dtos.RequestStatusDto;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/api/video")
public class VideoProcessoRestResource {

    @Autowired
    private VideoService service;


    @PostMapping("/upload")
    public ResponseEntity<RequestProcessingDto> uploadVideos(@RequestParam("files") List<MultipartFile> files) {
//        long totalSize = files.stream().mapToLong(MultipartFile::getSize).sum();
//        if (totalSize > 10 * 1024 * 1024) { // 10MB
//            return ResponseEntity.status(HttpStatus.PAYLOAD_TOO_LARGE).body("Tamanho máximo permitido é de 10MB");
//        }

        return ResponseEntity.status(HttpStatus.OK).body(service.prepareVideosProcessing(files));
    }

    @PostMapping("/status/{idRequest}")
    public ResponseEntity<List<RequestStatusDto>> statusVideoById(@PathVariable String idRequest) {
        return ResponseEntity.status(HttpStatus.OK).body(service.getVideosStatusProcessing(idRequest));
    }

    @GetMapping("/download/{idRequest}")
    public ResponseEntity<RequestDownloadDto> downloadZip(@PathVariable String idRequest) {
        return ResponseEntity.status(HttpStatus.OK).body(service.getUrlDownload(idRequest));
    }

}
