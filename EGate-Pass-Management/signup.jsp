<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
body{
	margin:0;
	color:#6a6f8c;
  background-image: linear-gradient(135deg, #f36ef5 10%, #0a0634 100%);
  
	font:600 16px/18px 'Open Sans',sans-serif;
}
*,:after,:before{box-sizing:border-box}
.clearfix:after,.clearfix:before{content:'';display:table}
.clearfix:after{clear:both;display:block}
a{color:inherit;text-decoration:none}

.login-wrap{
	width:100%;
	margin:auto;
	max-width:625px;
	min-height:1240px;
	position:relative;
	background:url('hostel.jpg') no-repeat center;
	box-shadow:0 12px 15px 0 rgba(0,0,0,.24),0 17px 50px 0 rgba(0,0,0,.19);
}
.login-html{
	width:100%;
	height:100%;
	position:absolute;
	padding:90px 70px 50px 70px;
	background:rgba(40,57,101,.9);
}

.login-html .sign-up-htm{
	top:0;
	left:0;
	right:0;
	bottom:0;
	position:absolute;
	transform:rotateY(180deg);
	backface-visibility:hidden;
	transition:all .4s linear;
}

.login-html .sign-up,
.login-form .group .check{
	display:none;
}
.login-html .tab,
.login-form .group .label,
.login-form .group .button{
	text-transform:uppercase;
}
.login-html .tab{
	font-size:22px;
	margin-right:15px;
	padding-bottom:5px;
	margin:0 15px 10px 0;
	display:inline-block;
	border-bottom:2px solid transparent;
}

.login-html .sign-up:checked + .tab{
	color:#fff;
	border-color:#1161ee;
}
.login-form{
	min-height:345px;
	position:relative;
	perspective:1000px;
	transform-style:preserve-3d;
}
.login-form .group{
	margin-bottom:15px;
}
.login-form .group .label,
.login-form .group .input,
.login-form .group .button{
	width:100%;
	color:#fff;
	display:block;
}
.login-form .group .input,
.login-form .group .button{
	border:none;
	padding:15px 20px;
	border-radius:25px;
	background:rgba(255,255,255,.1);
}
.login-form .group input[data-type="password"]{
	text-security:circle;
	-webkit-text-security:circle;
}
.login-form .group .label{
	color:#aaa;
	font-size:12px;
}
.login-form .group .button{
	background:#1161ee;
}
.login-form .group label .icon{
	width:15px;
	height:15px;
	border-radius:2px;
	position:relative;
	display:inline-block;
	background:rgba(255,255,255,.1);
}
.login-form .group label .icon:before,
.login-form .group label .icon:after{
	content:'';
	width:10px;
	height:2px;
	background:#fff;
	position:absolute;
	transition:all .2s ease-in-out 0s;
}
.login-form .group label .icon:before{
	left:3px;
	width:5px;
	bottom:6px;
	transform:scale(0) rotate(0);
}
.login-form .group label .icon:after{
	top:6px;
	right:0;
	transform:scale(0) rotate(0);
}
.login-form .group .check:checked + label{
	color:#fff;
}
.login-form .group .check:checked + label .icon{
	background:#1161ee;
}
.login-form .group .check:checked + label .icon:before{
	transform:scale(1) rotate(45deg);
}
.login-form .group .check:checked + label .icon:after{
	transform:scale(1) rotate(-45deg);
}
.login-html .sign-in:checked + .tab + .sign-up + .tab + .login-form .sign-in-htm{
	transform:rotate(0);
}
.login-html .sign-up:checked + .tab + .login-form .sign-up-htm{
	transform:rotate(0);
}

.hr{
	height:2px;
	margin:60px 0 50px 0;
	background:rgba(255,255,255,.2);
}
.foot-lnk{
	text-align:center;
}
button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}
</style>
<body>

  <div class="login-wrap">
    <div class="login-html">
      
      <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Registration</label>
      <div class="login-form">

		<form action="">
			<div class="sign-up-htm">
				<div class="group">
				  <label for="user" class="label">Name</label>
				  <input id="user" type="text" name="user_name" class="input">
				</div>
				<div class="group">
				  <label for="pass" class="label">reg_num</label>
				  <input id="pass" type="text"  name="reg_num" class="input">
				</div>
				<div class="group">
					<label for="pass" class="label">Department</label>
					<input id="pass" type="text"  name="Department" class="input">
				  </div>
				  <div class="group">
					<label for="pass" class="label">Year</label>
					<input id="pass" type="text"  name="Year" class="input">
				  </div>
				<div class="group">
				  <label for="pass" class="label">Password</label>
				  <input id="pass" type="password"  name="password" class="input" data-type="password">
				</div>
				<div class="group">
				  <label for="pass" class="label">Confirm Password</label>
				  <input id="pass" type="password" name="confirm_password" class="input" data-type="password">
				</div>
				<div class="group">
				  <label for="pass" class="label">Email Address</label>
				  <input id="pass" type="text" name="email" class="input">
				</div>
				<div class="group">
					<h1 for="pass" class="label" style="font-size: large;">Personal Details:</h1>
				  </div>
				  <div class="group">
					<label for="pass" class="label">Father Name</label>
					<input id="pass" type="text" name="Father" class="input">
				  </div>
				  <div class="group">
					<label for="pass" class="label">Gender</label>
					<input id="pass" type="text" name="Gender" class="input">
				  </div>
				  <div class="group">
					<label for="pass" class="label">Hosteller/Dayscholar</label>
					<input id="pass" type="text" name="Hostel" class="input">
				  </div>
				<div class="group">
					<label for="pass" class="label">Address</label>
					<input id="pass" type="text" name="Address" class="input">
				  </div>
				  <div class="group">
					<label for="pass" class="label">Parent Number</label>
					<input id="pass" type="number" name="parent" class="input">
				  </div>
				  <div class="group">
					<label for="pass" class="label">Student Number</label>
					<input id="pass" type="number" name="student" class="input">
				  </div>
				<div class="group">
				  <button>SUBMIT</button>
				</div>
				<div class="hr"></div>
				<div class="foot-lnk">
				  <a href="reallogin.jsp" style="color: #0a0634;">Already Member?</a>
				</div>
			  </div>
		</form>
        
      
      </div>
    </div>
  </div>
</body>
</html>

<%
    String a = request.getParameter("user_name");
	String b = request.getParameter("reg_num");
    String c = request.getParameter("password");
    String d = request.getParameter("confirm_password");
    String e = request.getParameter("email");
	String f = request.getParameter("Department");
	String g = request.getParameter("Year");
	String h = request.getParameter("Address");
	String i = request.getParameter("Father");
	String j = request.getParameter("Hostel");
	String k = request.getParameter("Gender");
	String l = request.getParameter("parent");
	String m = request.getParameter("student");
    String host= "jdbc:mysql://localhost:3306/gatepass";
    PreparedStatement stmt = null;
    Class.forName("com.mysql.jdbc.Driver");
    if(a!=null && b!=null && c!=null && d!=null && e!=null && f!=null && g!=null && h!=null && i!=null && j!=null && k!=null && l!=null && m!=null){
        Connection con = DriverManager.getConnection(host,"root","");
        stmt = con.prepareStatement("insert into signup(user_name, reg_num, password, confirm_password, email, Department, Year, Address, Father, Hostel, Gender, parent, student) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        stmt.setString(1,a);
        stmt.setString(2,b);
        stmt.setString(3,c);
        stmt.setString(4,d);
		stmt.setString(5,e);
		stmt.setString(6,f);
		stmt.setString(7,g);
		stmt.setString(8,h);
		stmt.setString(9,i);
		stmt.setString(10,j);
		stmt.setString(11,k);
		stmt.setString(12,l);
		stmt.setString(13,m);
        stmt.executeUpdate();
        response.sendRedirect("reallogin.jsp");
    }
%>
