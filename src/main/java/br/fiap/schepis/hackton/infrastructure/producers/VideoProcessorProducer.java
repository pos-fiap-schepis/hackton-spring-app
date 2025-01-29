package br.fiap.schepis.hackton.infrastructure.producers;

import br.fiap.schepis.hackton.core.processor.VideoService;
import br.fiap.schepis.hackton.infrastructure.configuration.RabbitMQConfig;
import br.fiap.schepis.hackton.infrastructure.dtos.VideoRequestDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VideoProcessorProducer {

    private static final Logger logger = LoggerFactory.getLogger(VideoService.class);

    @Autowired
    private RabbitTemplate rabbitTemplate;

    public void sendMessage(VideoRequestDto dto) {
        try {
            rabbitTemplate.convertAndSend(RabbitMQConfig.EXCHANGE_NAME, RabbitMQConfig.ROUTING_KEY, dto);
            logger.info("Mensagem enviada");
        } catch (Exception e) {
            throw new RuntimeException("Erro ao enviar mensagem para o RabbitMQ.");
        }

    }
}
