<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="style.css">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>STUDENT Dashboard</title>
    <link rel="stylesheet" type="text/css" href="adm.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap');

        :root{
    --violet:#fd0000;
    --white:#fff;
    --black:#000;
    --lightblue:#b3bbd1;
    --gray:#e5e5e5;
}
*{margin: 0px;  padding: 0px; font-family: 'Montserrat', sans-serif;}
body{height: 100vh;}
.sidebar{
    width: 20%;
    float: left;
    background: var(--violet);
    height: 100vh;
    position: relative;
}
.main{width: 75%;float: left;height: 90vh; padding: 30px;}
.logo{text-align: center;color: var(--white); margin-top: 50px; font-weight: 800;
margin-bottom: 50px;}
.nav{margin-left: 40px;}
.nav li{list-style: none; padding: 16px 19px;}
.nav li i{ margin-right: 10px;}
.nav li a{color: var(--white); text-decoration: none; font-weight: 600;}
.active{
    background:var(--white);
    border-radius: 27px;
    position: relative;
}
.nav > .active::before, .nav > .active::after {
     content: "";
     position: absolute;
}
.nav > li{
    border-radius: 60px 0 0 60px;
        width: 92%;
    margin-left: -15px;
}
.nav > .active::before {
    top: -80px;
    right: 0px;
    height: 80px;
    width: 62px;
    border-bottom-right-radius: 80px;
    box-shadow: 0 40px 0 0 var(--white);
    transform: rotateZ(360deg);
}
.nav > .active::after {
    top: 51px;
    right: 0px;
    height: 80px;
    width: 62px;
    border-top-right-radius: 80px;
    box-shadow: 0 -40px 0 0 var(--white);
    transform: rotateZ(360deg);
    
}
.active a{color: var(--blue)!important;}
.clearfix{clear: both;}
.col-6{width: 50%; float: left;}
.hicon{margin-right: 20px; font-size: 22px!important;position: relative;}
.hicon:nth-child(1):after{
    content: '';
    position:absolute;
    width: 7px;
    height: 7px;
    background: red;
    border-radius: 10px;
    left: 13px;
    top: 7px;
    transform: scale(0.5);
    box-shadow: 0 0 0 0 rgba(255, 82, 82, 1);
    animation: pulse-red 2s infinite;
    cursor: pointer;

}

@keyframes pulse-red {
    0% {
        transform: scale(0.85);
        box-shadow: 0 0 0 0 rgba(255, 82, 82, 0.7);
    }
    
    70% {
        transform: scale(1);
        box-shadow: 0 0 0 25px rgba(255, 82, 82, 0);
    }
    
    100% {
        transform: scale(0.85);
        box-shadow: 0 0 0 0 rgba(255, 82, 82, 0);
    }
}
.user{
    background:var(--lightblue);
    padding: 5px;
    width: 30px;
    margin-bottom: -11px;
    border-radius: 5px;
    cursor: pointer;
}
.profile-div{
  background-color: var(--gray);
  width: 140px;
  border: 1px solid #ddd;
  padding: 10px 0px;
  right: 2%;
  border-radius: 5px;
  position: absolute;
  z-index: 9;
  display: none;
  top: 84px;
  text-align: left;
}
.profile-div:after{
  content: '';
    position: absolute;
    height: 10px;
    width: 10px;
    background-color: var(--gray);
    top: -6px;
    border-left: 1px solid #ddd;
    border-top: 1px solid #ddd;
    transform: rotate(45deg);
    right: 10%;
}
.profile-div p{margin: 0px;padding: 10px 20px;}
.profile-div p:hover{
  margin: 0px;
    padding: 10px 20px;
    background-color: var(--violet);
    border-radius: 0px;
    color: var(--white);
}
.notification-div{
  background-color: var(--gray);
  width: 246px;
  border: 1px solid #ddd;
  padding: 10px 0px;
  right: 9.4%;
  border-radius: 5px;
  position: absolute;
  z-index: 9;
  display: none;
  top: 84px;
  text-align: left;
}
.notification-div:after{
  content: '';
    position: absolute;
    height: 10px;
    width: 10px;
    background-color: var(--gray);
    top: -6px;
    border-left: 1px solid #ddd;
    border-top: 1px solid #ddd;
    transform: rotate(45deg);
    right: 10%;
}
.notification-div p{margin: 0px;padding: 10px 20px;}
.notification-div p:hover{
  margin: 0px;
    padding: 10px 20px;
    background-color: var(--violet);
    border-radius: 0px;
    color: var(--white); 
}
.search{ padding: 5px; display: none; outline: none; border:none;
    border-bottom: 1px solid black;
}

    </style>
</head>

<body>

<section>
    <div class="sidebar">
    <div id="myd">
        <h1 class="logo">e gatepass</h1>
        <ul class="nav">
            <li><a href="#"><i class="fa fa-windows"></i> Dashboard</a></li>
            <li><a href="in.jsp"><i class="fa fa-sign-in"></i> in</a></li>
            <li><a href="exit.jsp"><i class="fa fa-sign-out"></i>out</a></li>
        </ul>
        </div>
    </div>
    <div class="main">
        
        <div class="head-section">
            <div class="col-6">
                <h2>STUDENT</h2>
            </div>

            <div class="col-6" style="text-align: right;">
                <i class="fa fa-bell-o hicon"></i>
                <input style="z-index: 1;" type="text" class="search" placeholder="Search.." id="mys" onkeyup="filterFunction1()">
                <i class="fa fa-search hicon sicon"></i>

                <img src="use.png" class="user">

                <div class="profile-div">
                <%String name1 = (String)session.getAttribute("username");%>
                    <%=name1%>
                    <p><a href="logout.jsp"><i class="fa fa-power-off"></i>Log Out</a></p>
                </div>

        <div class="notification-div">
            <p>Success!Your registration is now complete!</p>
            <p>Here's some information you may find useful!</p>         
        </div>

            </div>

            <div class="clearfix"></div>
        </div>

        <br><br>
        <div class="content">
            <p>gatepass</p><br><br>
            <!--<button type="accepeted">accepeted</button>-->
            <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h3>Accepted List</h3>
            </div>
             <!--<div class="col-md-4">
                <form action="" method="get">
                    <input type="text" name="q" id="q" class="form-control" placeholder="Search Here..." >
                </form>
            </div>-->
             <div class="col-md-4">
            </div>
        </div>
        <hr>
        <table class= "table table-bordered table-striped table-hover" style="color: #000;"> 
            <thead style="color:#fd0000">
                 <tr>
                    <th>username</th>
                     <th>Date</th>
                     <th>exit_time</th>
                     <th>Reg_num</th>
                     <th>Department</th>
                     <th>Phone_num</th>
                     <th>Place</th>
                     <th>status</th>
                    

                     
                     <!-- <th class="text-center">View</th>
                     <th class="text-center">Action</th> -->
                 </tr>
            </thead>
            <tbody>
                    <% 
                    
                    String name =(String) session.getAttribute("user");
                     
                      String cd= "jdbc:mysql://localhost:3306/gatepass";
                     Class.forName("com.mysql.jdbc.Driver");
                    Connection cons = DriverManager.getConnection(cd,"root","");
                    Statement stmt= cons.createStatement(); 
                    String query = request.getParameter("q");
                           String data ;
                           if(query!=null){
                                data = "select *from accept where reg_num = '"+name+"'" ;
                            %>

                        <%}
                        else
                        data =  "select *from accept";
                     ResultSet st = stmt.executeQuery(data);
                 while(st.next()){ 


                        
                %>
                <tr>
                    <td><%=st.getString("user")%></td>
                    <td><%=st.getString("date")%></td>
                    <td><%=st.getString("exit_time")%></td>
                    <td><%=st.getString("reg_num")%></td>
                    <td><%=st.getString("phone_num")%></td>
                    <td><%=st.getString("destination")%></td>
                    <td><%=st.getString("Department")%></td>
                    <td Style="color:rgb(255, 0, 0);">Accepted</td>

                    
                </tr>
                <%
                     }	 
                %>
                
            </tbody>

         </table>
    </div>

        </div>



    </div>
</section>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
$(document).ready(function(){
  $(".user").click(function(){
    $(".profile-div").toggle(1000);
  });
  $(".hicon:nth-child(1)").click(function(){
    $(".notification-div").toggle(1000);
  });
  $(".sicon").click(function(){
    $(".search").toggle(1000);
  });
});
</script>

<script type="text/javascript">
    $('li').click(function(){
    $('li').removeClass("active");
    $(this).addClass("active");
});
function filterFunction1() {
  var input, filter, ul, li, a, i;
  input = document.getElementById("mys");
  filter = input.value.toUpperCase();
  div = document.getElementById("myd");
  a = div.getElementsByTagName("a");
  for (i = 0; i < a.length; i++) {
    txtValue = a[i].textContent || a[i].innerText;
    if (txtValue.toUpperCase().indexOf(filter) > -1) {
      a[i].style.display = "";
    } else {
      a[i].style.display = "none";
    }
  }
}
</script>
</body>
</html>