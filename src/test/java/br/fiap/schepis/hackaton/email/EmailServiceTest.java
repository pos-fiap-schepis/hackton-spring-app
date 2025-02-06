package br.fiap.schepis.hackaton.email;


import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.verify;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

public class EmailServiceTest {

  @Mock
  private JavaMailSender mailSender;

  @InjectMocks
  private EmailService emailService;

  @BeforeEach
  public void setUp() {
    MockitoAnnotations.openMocks(this);
  }

  @Test
  public void testSendEmail() {
    String to = "test@example.com";
    String subject = "Test Subject";
    String text = "Test Text";

    emailService.sendEmail(to, subject, text);

    verify(mailSender).send(any(SimpleMailMessage.class));
  }
}