package com.college.sendMail;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {

	public  String sendMail(String to, String subject, String message) {
		String result = null;

		try {

			String from = "mschaity98@gmail.com";
			// host name
			String host = "smtp.gmail.com";

			// system properties

			Properties properties = System.getProperties();

			properties.put("mail.smtp.host", host);
			properties.put("mail.smtp.port", "465");
			properties.put("mail.smtp.ssl.enable", "true");
			properties.put("mail.smtp.auth", "true");

			// Getting Session

			Session session = Session.getInstance(properties, new Authenticator() {
				@Override
				protected PasswordAuthentication getPasswordAuthentication() {
					// TODO Auto-generated method stub
					return new PasswordAuthentication("mschaity98@gmail.com", "sornali97");
				}
			});

			session.setDebug(true);

			// Preparing message
			MimeMessage messageTeamplate = new MimeMessage(session);

			// from mail
			messageTeamplate.setFrom(from.trim());
			// Adding recipient
			messageTeamplate.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			// Adding subject to mail
			messageTeamplate.setSubject(subject.trim());
			// Setting message
			messageTeamplate.setText(message.trim());

			// Sending mail
			Transport.send(messageTeamplate);

			result = "Successfully";

		} catch (Exception e) {
			e.printStackTrace();

		}

		return result;
	}

	public static void main(String[] args) {
		System.out.println(new SendMail().sendMail("email2satish2000@gmail.com","Reset Password","Hi This mail is testing"));
	}
}
