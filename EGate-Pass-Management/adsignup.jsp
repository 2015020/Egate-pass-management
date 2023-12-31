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
  background-image: linear-gradient(135deg, #FAB2FF 10%, #0a0634 100%);
  
	font:600 16px/18px 'Open Sans',sans-serif;
}
*,:after,:before{box-sizing:border-box}
.clearfix:after,.clearfix:before{content:'';display:table}
.clearfix:after{clear:both;display:block}
a{color:inherit;text-decoration:none}

.login-wrap{
	width:100%;
	margin:auto;
	max-width:525px;
	min-height:670px;
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
      
      <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
      <div class="login-form">

		<form action="">
			<div class="sign-up-htm">
				<div class="group">
				  <label for="user" class="label">Username</label>
				  <input id="user" type="text" name="username" class="input">
				</div>
				<div class="group">
				  <label for="pass" class="label">admin_id</label>
				  <input id="pass" type="text"  name="admin_id" class="input">
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
				  <input id="pass" type="text" name="email_id" class="input">
				</div>
				<div class="group">
				  <button>SUBMIT</button>
				</div>
				<div class="hr"></div>
				<div class="foot-lnk">
				  <a href="reallogin.jsp">Already Member?</a>
				</div>
			  </div>
		</form>
        
      
      </div>
    </div>
  </div>
</body>
</html>

<%
    String a = request.getParameter("username");
	String b = request.getParameter("admin_id");
    String c = request.getParameter("password");
    String d = request.getParameter("confirm_password");
    String e = request.getParameter("email_id");
    String host= "jdbc:mysql://localhost:3306/gatepass";
    PreparedStatement stmt = null;
    Class.forName("com.mysql.jdbc.Driver");
    if(a!=null && b!=null && c!=null && d!=null && e!=null ){
        Connection con = DriverManager.getConnection(host,"root","");
        stmt = con.prepareStatement("insert into adminlog(username, admin_id, password, confirm_password, email_id) values (?, ?, ?, ?, ?)");
        stmt.setString(1,a);
        stmt.setString(2,b);
        stmt.setString(3,c);
        stmt.setString(4,d);
		stmt.setString(5,e);
        stmt.executeUpdate();
        response.sendRedirect("adminlogin.jsp");
    }
%>
