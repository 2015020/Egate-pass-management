<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" type="text/css" href="adm.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap');

        :root{
    --violet:#fd000d;
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
        box-shadow: 0 0 0 0 rgba(235, 8, 8, 0.7);
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
.head{
	padding:20px;
}
.col-div-3{
	width: 25%;
	float: left;
}
.box{
	width: 85%;
	height: 100px;
	background-color:rgb(11, 8, 8);
	margin-left: 10px;
	padding:10px;
}
.box h4{
	 font-size: 35px;
    color:#ecebeb;
    font-weight: bold;
    line-height: 30px;
    padding-left: 10px;
    margin-top: 20px;
    display: inline-block;
}
.box h4 span{
	font-size: 20px;
	font-weight: 400;
	color: #c3bebe;
}
.box-icon{
	  font-size: 30px!important;
    float: right;
    margin-top: 45px!important;
    color: #c1bbbb;
    padding-right: 10px;
}
.dropbtn {
  background-color: rgb(9, 3, 9);
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
  cursor: pointer;
}

.dropbtn:hover, .dropbtn:focus {
  background-color: rgb(128, 0, 0);
}

#myInput {
  box-sizing: border-box;
  background-image: url('searchicon.png');
  background-position: 14px 12px;
  background-repeat: no-repeat;
  font-size: 16px;
  padding: 14px 20px 12px 45px;
  border: none;
  border-bottom: 1px solid #ddd;
}

#myInput:focus {outline: 3px solid #ddd;}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f6f6f6;
  min-width: 230px;
  overflow: auto;
  border: 1px solid #ddd;
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown a:hover {background-color: #ddd;}

.show {display: block;}
.clearfix{
	clear: both;
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
            <li><a href="secin.jsp"><i class="fa fa-sign-in"></i> in</a></li>
            <li><a href="secacc.jsp"><i class="fa fa-smile-o"></i>accepted</a></li>

        </ul>
        </div>
    </div>
    <div class="main">
        
        <div class="head-section">
            <div class="col-6">
                <h2>security</h2>
                <p>gatepass</p>
            </div>

            <div class="col-6" style="text-align: right;">
                <i class="fa fa-bell-o hicon"></i>
               <input style="z-index: 1;" type="text" class="search" placeholder="Search.." id="mys" onkeyup="filterFunction1()">
                <i class="fa fa-search hicon sicon"></i>

                <img src="ad.jpg" class="user">

                <div class="profile-div">
                <p>security</p>
                    <!--<p><i class="fa fa-user"></i>   Profile</p>
                    <p><i class="fa fa-cog"></i>   Settings</p>-->
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
        <!--<div class="content">
            <p>All gatepass</p><br><br>
        </div>-->
        <div class="dropdown">
            <button onclick="myFunction()" class="dropbtn">Enter GATEPASS</button>
            <div id="myDropdown" class="dropdown-content">
              <input type="text" placeholder="Search.." id="myInput" onkeyup="filterFunction()">
              <a href="in.jsp">in</a>
              <a href="exit.jsp">out</a>
            </div>
            <div class="clearfix"></div>
          </div>
          <br><br>
        <div class="col-div-3">
			<div class="box">
				<h4><%
          try
          {
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gatepass","root","");     
              Statement st=con.createStatement();
              String strQuery = "SELECT COUNT(*) FROM in_time";
              ResultSet rs = st.executeQuery(strQuery);
          
              String Countrow="";
                while(rs.next()){
                Countrow = rs.getString(1);
                out.println("Total_in : " +Countrow);
                 } 
              }
          catch (Exception e){
              e.printStackTrace();
            }
            %><br><span>in</span></h4>
				<i class="fa fa-sign-in box-icon"></i>
			</div>
		</div>
		<div class="col-div-3">
			<div class="box">
				<h4><%
          try
          {
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gatepass","root","");     
              Statement st=con.createStatement();
              String strQuery = "SELECT COUNT(*) FROM accept";
              ResultSet rs = st.executeQuery(strQuery);
          
              String Countrow="";
                while(rs.next()){
                Countrow = rs.getString(1);
                out.println("accept: " +Countrow);
                 } 
              }
          catch (Exception e){
              e.printStackTrace();
            }
            %><br/><span>accepted</span></h4>
				<i class="fa fa-smile-o box-icon"></i>
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
 /* When the user clicks on the button,
toggle between hiding and showing the dropdown content */
function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

function filterFunction() {
  var input, filter, ul, li, a, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  div = document.getElementById("myDropdown");
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