package br.fiap.schepis.hackaton.resources;


import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.multipart;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import br.fiap.schepis.hackaton.config.TestSecurityConfig;
import br.fiap.schepis.hackaton.dtos.RequestDownloadDto;
import br.fiap.schepis.hackaton.dtos.RequestProcessingDto;
import br.fiap.schepis.hackaton.dtos.RequestStatusDto;
import br.fiap.schepis.hackaton.enums.StatusProcessamentoEnum;
import br.fiap.schepis.hackaton.processor.VideoService;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.Collections;
import java.util.List;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.context.annotation.Import;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.web.servlet.MockMvc;

@ExtendWith(SpringExtension.class)
@WebMvcTest(VideoProcessoRestResource.class)
@Import(TestSecurityConfig.class)
public class VideoProcessoRestResourceTest {

  @Autowired
  private MockMvc mockMvc;

  @MockitoBean
  private VideoService videoService;

  @Autowired
  private ObjectMapper objectMapper;

  @BeforeEach
  public void setUp() {
    Mockito.reset(videoService);
  }

  @Test
  public void testUploadVideos_Sucesso() throws Exception {
    MockMultipartFile file = new MockMultipartFile("files", "video.mp4", MediaType.MULTIPART_FORM_DATA_VALUE, "video content".getBytes());
    RequestProcessingDto responseDto = new RequestProcessingDto();
    Mockito.when(videoService.prepareVideosProcessing(Mockito.anyList())).thenReturn(responseDto);

    mockMvc.perform(multipart("/api/video/upload")
        .file(file))
      .andExpect(status().isOk())
      .andExpect(content().json(objectMapper.writeValueAsString(responseDto)));
  }

  @Test
  public void testStatusVideoById_Sucesso() throws Exception {
    List<RequestStatusDto> responseDtoList = Collections.singletonList(
      new RequestStatusDto("12345", "meu video",
      StatusProcessamentoEnum.EM_PROCESSAMENTO, "video.mp4"));
    Mockito.when(videoService.getVideosStatusProcessing(Mockito.anyString())).thenReturn(responseDtoList);

    mockMvc.perform(post("/api/video/status/{idRequest}", "12345"))
      .andExpect(status().isOk())
      .andExpect(content().json(objectMapper.writeValueAsString(responseDtoList)));
  }

  @Test
  public void testDownloadZip_Sucesso() throws Exception {
    RequestDownloadDto responseDto = new RequestDownloadDto();
    Mockito.when(videoService.getUrlDownload(Mockito.anyString())).thenReturn(responseDto);

    mockMvc.perform(get("/api/video/download/{idRequest}", "12345"))
      .andExpect(status().isOk())
      .andExpect(content().json(objectMapper.writeValueAsString(responseDto)));
  }
}