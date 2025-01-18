package br.fiap.schepis.hackton.infrastructure.producers;

import br.fiap.schepis.hackton.infrastructure.configuration.RabbitMQConfig;
import br.fiap.schepis.hackton.infrastructure.dtos.VideoRequestDto;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VideoProcessorProducer {

    @Autowired
    private RabbitTemplate rabbitTemplate;

    public void sendMessage(VideoRequestDto dto) {
        rabbitTemplate.convertAndSend(RabbitMQConfig.EXCHANGE_NAME, RabbitMQConfig.ROUTING_KEY, dto);
        System.out.println("Mensagem enviada: " + dto.getId());
    }
}
