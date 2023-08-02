<%@ page import="java.util.Properties" %>
<%@page import="javax.mail.*" %>
<%@page import="javax.mail.internet.*"%>
<%@page import="javax.mail.Session"%>
<%
String email = "2015020@nec.edu.in";
Session session1 = null;
	

	String to = email;// change accordingly
	// Get the session object
	Properties props = new Properties();
	props.put("mail.smtp.host", "smtp.gmail.com");
	props.put("mail.smtp.socketFactory.port", "465");
	props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	props.put("mail.smtp.auth", "true");
	props.put("mail.smtp.port", "587java.lang.SecurityException: Access to default session denied");
	session1 = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication("2015020@nec.edu.in", "umoutbvauycfijvq");// Put your email
																							// id and
																							// password here
		}
	});
	// compose message
	try {
		MimeMessage message = new MimeMessage(session1);
		message.setFrom(new InternetAddress(email));// change accordingly
		message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
		message.setSubject("Hello");
		message.setText("Hii");
		// send message
		Transport.send(message);
	}

	catch (MessagingException e) {
		throw new RuntimeException(e);
	}
%>