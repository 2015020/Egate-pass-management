<%@ page import="java.sql.*"%>
<%
String username=request.getParameter("user");
String password=request.getParameter("password");
try
{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gatepass","root","");
    PreparedStatement ps = conn.prepareStatement("select * from securitylog where username=? and password=?");
    ps.setString(1,username);
    ps.setString(2,password);
    ResultSet rs=ps.executeQuery();
    if(rs.next())
    {
        String e=rs.getString("username");
        String p=rs.getString("password");
        if(e.equals(username) && p.equals(password))
        {
             response.sendRedirect("security.jsp");
        }
        else
        {
             response.sendRedirect("seclogin.jsp");
        }
    }
    else
    {
         response.sendRedirect("seclogin.jsp");
    }   
}
catch(Exception e)
{
    out.println(e);
}

%>

