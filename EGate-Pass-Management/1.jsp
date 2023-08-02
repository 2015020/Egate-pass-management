<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
                     Class.forName("com.mysql.jdbc.Driver");
                     String query1 = "insert into accept (user,date,exit_time,reg_num,phone_num,destination) values (?,?,?,?,?,?)";
                     PreparedStatement ps = con.prepareStatement(query1);
                     ps.setString(1,a);
                     ps.setString(2,b);
                     ps.setString(3,c);
                     ps.setString(4,d);
                     ps.setString(5,e);
                     ps.setString(6,f);
                     ps.executeUpdate();
                    }
                    
                    Statement st = con.createStatement();
                    st.executeUpdate("delete from exitpass where reg_num = '"+num+"'");
                    response.sendRedirect("adminout.jsp");

                %>