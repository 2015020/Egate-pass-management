<%@ page import="java.sql.*"%>
<%
String user_name=request.getParameter("user");
String password=request.getParameter("password");
try
{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gatepass","root","");
    PreparedStatement ps = conn.prepareStatement("select *from signup where user_name=? and password=?");
    ps.setString(1,user_name);
    ps.setString(2,password);
    ResultSet rs=ps.executeQuery();
    if(rs.next())
    {
        String e=rs.getString("user_name");
        String a = rs.getString("reg_num");
        String p=rs.getString("password");
        if(e.equals(user_name) && p.equals(password))
        {
            session.setAttribute("username",user_name);
             response.sendRedirect("student.jsp");
             session.setAttribute("user",a);
        }
        else
        {
             response.sendRedirect("reallogin.jsp");
        }
    }
    else
    {
         response.sendRedirect("reallogin.jsp");
    }   
}
catch(Exception e)
{
    out.println(e);
}

%>
