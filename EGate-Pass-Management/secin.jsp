
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="style.css">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <p><br/></p>   
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h3>In time<a href="security.jsp" id="b"><button class="b">Back</button></a></h3>
            </div>
            <!-- <div class="col-md-4">
                <form action="" method="get">
                    <input type="text" name="q" id="q" class="form-control" placeholder="Search Here..." >
                </form>
            </div>-->
             <div class="col-md-4">
            </div>
        </div>
        <hr>
        <table class = "table table-bordered table-striped table-hover">
            <thead>
                 <tr>
                    <th>username</th>
                     <th>Date</th>
                     <th>In_time</th>
                     <th>Reg_num</th>
                     <th>Department</th>
                     <th>Phone_num</th>
                     
                     <!-- <th class="text-center">View</th>
                     <th class="text-center">Action</th> -->
                 </tr>
            </thead>
            <tbody>
                <%
                     String host= "jdbc:mysql://localhost:3306/gatepass";
                     Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection(host,"root","");
                    Statement stmt = con.createStatement(); 
                     String query =  "select *from secin_time";
                    ResultSet rs = stmt.executeQuery(query);
                     while(rs.next()){
                %>
                <tr>
                    <td><%=rs.getString("user")%></td>
                    <td><%=rs.getString("date")%></td>
                    <td><%=rs.getString("in_time")%></td>
                    <td><%=rs.getString("reg_num")%></td>
                    <td><%=rs.getString("Department")%></td>
                    <td><%=rs.getString("phone_num")%></td>
                    
                </tr>
                <%
                 }
                %>
            </tbody>
         </table>
    </div>
</html>