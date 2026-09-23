package Model;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailService {


    public static void enviarCodigo(String destinatario, String codigo) {

        Properties props = new Properties();
        props.put("mail.smtp.host", "localhost");
        props.put("mail.smtp.port", "1025"); // Porta do MailHog
        props.put("mail.smtp.auth", "false");
        props.put("mail.smtp.starttls.enable", "false");

        Session session = Session.getInstance(props);

        try {
            Message mensagem = new MimeMessage(session);
            mensagem.setFrom(new InternetAddress("GLAMVC@comer.com"));
            mensagem.setRecipients(Message.RecipientType.TO, InternetAddress.parse(destinatario));
            mensagem.setSubject("Código de Recuperação");
            mensagem.setText("Seu código é: " + codigo);
            mensagem.setSubject("Nao responda este email");

            Transport.send(mensagem);
            System.out.println("E-mail enviado com sucesso!");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }


}
