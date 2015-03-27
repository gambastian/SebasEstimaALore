package uniandes.cupi2.impuestosCarro.mundo;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {

	public static void send() throws FileNotFoundException, IOException {
		Properties properties = new Properties();
		FileInputStream input = new FileInputStream("data/impuestos.properties");
		properties.load(input);
        
		final String username = "watchapp.latam@gmail.com";
		final String password = "miso4101";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(username, password);
					}
				});
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("watchapp.latam@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(properties.getProperty("adminmail")));
			message.setSubject("Impuestos");
			message.setText("Estan por encima de 2000000!");

			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
}
