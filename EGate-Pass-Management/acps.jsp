<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.*"%>
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
                    <th>username</th>
                     <th>Date</th>
                     <th>Reg_num</th>
                     <th>status</th>
                    

                     
                     <!-- <th class="text-center">View</th>
                     <th class="text-center">Action</th> -->
                 </tr>
            </thead>
            <tbody>
                    <% 
                     
                      String cd= "jdbc:mysql://localhost:3306/gatepass";
                     Class.forName("com.mysql.jdbc.Driver");
                    Connection cons = DriverManager.getConnection(cd,"root","");
                    Statement stmt= cons.createStatement(); 
                         String query = request.getParameter("q");
                         String data;
                         if(query!=null){
                            data = "select *from accept where reg_num = '"+query+"'";
                             %>
                            <a href="acps.jsp" class="btn btn-primary">back</a>
                            <hr>
                           
                       <%}
                        else
                            data =  "select *from accept";
                         ResultSet st = stmt.executeQuery(data);
                     while(st.next()){ 
                %>
                <tr>
                    <td><%=st.getString("user")%></td>
                    <td><%=st.getString("date")%></td>
                    <td><%=st.getString("reg_num")%></td>
                    <td Style="color:green;">Accepted</td>

                    
                </tr>
                <%
                     }	 
                %>
            </tbody>

         </table>
    </div>
    
</html>