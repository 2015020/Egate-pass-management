<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.*" %>
<%@page import="javax.mail.*" %>
<%@page import="javax.mail.internet.*"%>
<%@page import="jakarta.servlet.*"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.UnsupportedEncodingException"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Properties"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="style.css">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <p><br/></p>   
    <!--<%
      String id=request.getParameter("id");%>-->
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h3>Accepted List</h3>
            </div>
             <div class="col-md-4">
                <form action="" method="get">
                    <input type="text" name="q" id="q" class="form-control" placeholder="Search Here..." >
                </form>
            </div>
             <div class="col-md-4">
            </div>
        </div>
        <hr>
        <table class= "table table-bordered table-striped table-hover">
            <thead>
                 <tr>
                     <th>Name</th>
                     <th>Date</th>
                     <th>In_time</th>
                     <th>Reg_num</th>
                     <th>Department</th>
                     <th>Phone_num</th>
                     <th>email</th>
                     <th>Destination</th>
                     <th>status</th>
                    

                     
                     <!-- <th class="text-center">View</th>
                     <th class="text-center">Action</th> -->
                 </tr>
            </thead>
            <tbody>
            <%
                String host= "jdbc:mysql://localhost:3306/gatepass";
                Class.forName("com.mysql.jdbc.Driver");
               Connection con = DriverManager.getConnection(host,"root","");
               
               String num = request.getParameter("d");
               PreparedStatement stmt1 = con.prepareStatement("select *from exitpass where reg_num = ?");
               stmt1.setString(1,num);
               ResultSet rs = stmt1.executeQuery();
               if(rs.next()){
                   String a = rs.getString("user");
                String b = rs.getString("date");
                String c = rs.getString("exit_time");
                String d = rs.getString("reg_num");
                String e = rs.getString("phone_num");
                String f = rs.getString("destination");
                String g = rs.getString("Department");
                String h = rs.getString("email");
                Class.forName("com.mysql.jdbc.Driver");
                String query1 = "insert into accept (user,date,exit_time,reg_num,phone_num,destination,Department,email) values (?,?,?,?,?,?,?,?)";
                PreparedStatement ps = con.prepareStatement(query1);
                ps.setString(1,a);
                ps.setString(2,b);
                ps.setString(3,c);
                ps.setString(4,d);
                ps.setString(5,e);
                ps.setString(6,f);
                ps.setString(7,g);
                ps.setString(8,h);
                ps.executeUpdate();
               }
               
               Statement st = con.createStatement();
               st.executeUpdate("delete from exitpass where reg_num = '"+num+"'");
               



<!-- public class send {
    public static void sendMail(String email,String mname)throws Exception{
        	
        System.out.println("Preparing to send email");
        Properties properties = new Properties();
        
        //Enable authentication
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        //Your gmail address
        final String myAccountEmail = request.getParameter("email");
        //Your gmail password        

        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(myAccountEmail, password);
            }
        });

       
        //Send mail
        Transport.send(message);
        
    }

    private static Message prepareMessage(Session session, String myAccountEmail, String email,String mname) {
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(myAccountEmail));
            message.setSubject("Out-of-date medicines");
           message.setText("Medicine Details  :\n\nMedicine Name  : "+mname+"\n\n Has Expired!..!!"); 
            return message;
        } catch (Exception ex) {
            System.out.print(ex);
        }
        return null;
    }
}
            %> -->

            </tbody>
         </table>
        <a href="adt.jsp" id="b"><button class="b">Back</button></a>
    </div>
    
</html>