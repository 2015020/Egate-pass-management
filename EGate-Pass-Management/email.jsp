<!-- <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.mail.*"%> 
<%@page import="javax.mail.internet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>

  <%
   String host= "jdbc:mysql://localhost:3306/gatepass";
                     Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection(host,"root","");
                    
                    String num = request.getParameter("d");
                    PreparedStatement stmt1 = con.prepareStatement("select *from accept where reg_num = ?");
                    stmt1.setString(1,num);
                    ResultSet rs = stmt1.executeQuery();
                    if(rs.next()){
                    String a = rs.getString("user");
                     String b = rs.getString("date");
                     String c = rs.getString("exit_time");
                     String d = rs.getString("reg_num");
                     String e = rs.getString("phone_num");
                     String f = rs.getString("destination");
                     String g = request.getParameter("Department");
                    
                     String query1 = "insert into accept (user,date,exit_time,reg_num,phone_num,destination,Department) values (?,?,?,?,?,?,?)";
                     PreparedStatement ps = con.prepareStatement(query1);
                     ps.setString(1,a);
                     ps.setString(2,b);
                     ps.setString(3,c);
                     ps.setString(4,d);
                     ps.setString(5,e);
                     ps.setString(6,f);
                     ps.setString(7,g);
                     ps.executeUpdate();
                    }
                  
                    Statement st = con.createStatement();
                    st.executeUpdate("delete from exitpass where reg_num = '"+num+"'");
                    String recepient="";
                    PreparedStatement stmt2 = con.prepareStatement("select email from signup where reg_num = ?");
                    stmt1.setString(1,num);
                    ResultSet rs2 = stmt2.executeQuery();
                    if(rs2.next()){
                      recepient=rs2.getString(1);
                    }
                    System.out.println("Preparing to Send Email...."); 
		Properties p = new Properties();
		p.put("mail.smtp.auth","true");
		p.put("mail.smtp.starttls.enable","true");
		p.put("mail.smtp.ssl.protocols","TLSv1.2");
		p.put("mail.smtp.host","smtp.gmail.com");
		p.put("mail.smtp.port","587");
		
		String senderemail = "2015020@nec.edu.in";
		String password = "manisankar";
		
		Session session = Session.getInstance(p,new Authenticator() {    
           protected PasswordAuthentication getPasswordAuthentication() {    
				              return new PasswordAuthentication(senderemail,password);  
           }    
		}); 

		MimeMessage message = new MimeMessage(session); 
		try { 
		   message.setFrom(new InternetAddress(senderemail));	
          message.addRecipient(Message.RecipientType.TO,new InternetAddress(recepient));    
          message.setSubject("Regarding accept or not"); 
			    message.setText("your gatepass was accepted");
          Transport.send(message);    
          System.out.println("\nOTP is sent to your email");
          } 
		  catch (MessagingException e) {
			  System.out.print(e);
			  System.exit(0);
		  }    
                    response.sendRedirect("adminout.jsp");

                %> -->

                <%@page import="java.io.IOException"%>
<%@page import="java.util.*" %>
<%@page import="javax.mail.*" %>
<%@page import="javax.mail.internet.*"%>
<%@page import="jakarta.servlet.*"%>
<%@page import="jakarta.servlet.RequestDispatcher"%>
<%@page import="javax.mail.Session"%>
<%
String email = request.getParameter("email");
RequestDispatcher dispatcher = null;
int otpvalue = 0;
HttpSession mySession = request.getSession();
Session session1 = null;
	// sending otp
	Random rand = new Random();
	otpvalue = rand.nextInt(1255650);

	String to = email;// change accordingly
	// Get the session object
	Properties props = new Properties();
	props.put("mail.smtp.host", "smtp.gmail.com");
	props.put("mail.smtp.socketFactory.port", "465");
	props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	props.put("mail.smtp.auth", "true");
	props.put("mail.smtp.port", "465");
	session1 = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication("viranthrocky@gmail.com", "tfqsfczktheolswr");// Put your email
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
		message.setText("your OTP is: " + otpvalue);
		// send message
		Transport.send(message);
		System.out.println("message sent successfully");
	}

	catch (MessagingException e) {
		throw new RuntimeException(e);
	}
	<!-- dispatcher = request.getRequestDispatcher("EnterOtp.jsp"); -->
	<!-- request.setAttribute("message","OTP is sent to your email id"); -->
	//request.setAttribute("connection", con);
	<!-- mySession.setAttribute("otp",otpvalue);  -->
	<!-- mySession.setAttribute("email",email);  -->
	dispatcher.forward(request, response);
	//request.setAttribute("status", "success");


%>