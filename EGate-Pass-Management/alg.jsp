<%@ page import="java.sql.*"%>
<%
String username=request.getParameter("user");
String password=request.getParameter("password");
try
{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gatepass","root","");
    PreparedStatement ps = conn.prepareStatement("select *from adminlog where username=? and password=?");
    ps.setString(1,username);
    ps.setString(2,password);
    ResultSet rs=ps.executeQuery();
    if(rs.next())
    {
        String e=rs.getString("username");
        String p=rs.getString("password");
        if(e.equals(username) && p.equals(password))
        {
             response.sendRedirect("adt.jsp");
        }
        else
        {
             response.sendRedirect("adminlogin.jsp");
        }
    }
    else
    {
         response.sendRedirect("adminlogin.jsp");
    }   
}
catch(Exception e)
{
    out.println(e);
}

%>
