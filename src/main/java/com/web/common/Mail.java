package com.web.common;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mail {

	private static final String SENDER = "superfantastic";
	private static String ID = "";
	private static String PWD = "";

	public static void mailSend(String receiver, String title, String content) {
		Properties props = System.getProperties();
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		
		// 아이디 비밀번호 정보가져오기
		getInfo();
		
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

	public static void getInfo() {
		try {
			File file = new File("/info/google");
			BufferedReader br = new BufferedReader(new FileReader(file));
			StringBuffer sb = new StringBuffer();
			String line = "";

			while ((line = br.readLine()) != null) {
				sb.append(line);
			}

			String[] split = sb.toString().split("/");

			ID = split[0];
			PWD = split[1];

			br.close();
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
