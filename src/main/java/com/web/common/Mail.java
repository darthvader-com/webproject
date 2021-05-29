package com.web.common;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mail {

	private static final String SENDER = "";
	private static final String ID = "";
	private static final String PWD = "";

	public static void mailSend(String receiver, String title, String content) {
		Properties props = System.getProperties();
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		try {
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
					return new javax.mail.PasswordAuthentication(ID, PWD);
				}
			});
			session.setDebug(false);
			Message mimeMessage = new MimeMessage(session);
			mimeMessage.setFrom(new InternetAddress(SENDER));
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
			mimeMessage.setSubject(title);
			mimeMessage.setText(content);
			Transport.send(mimeMessage);
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
