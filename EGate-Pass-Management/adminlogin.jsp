<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>E-GATE PASS MANAGEMENT</title>
  <style>
      body {
  background-image: linear-gradient(135deg, #fe5757 10%, #0a0634 100%);
  background-size: cover;
  background-repeat: no-repeat;
  background-attachment: fixed;
  font-family: "Open Sans", sans-serif;
  color: #333333;
}
.overlay h1{
  animation-duration: 5s;
  animation-name: slidein;
}
@keyframes slidein{
  from{
    margin-left: 100%;
    width: 100%;
  }
  to{
    margin-left: 0%;
    width: 100%;
  }
}


.box-form {
  margin: 0 auto;
  width: 80%;
  background: #FFFFFF;
  border-radius: 10px;
  overflow: hidden;
  display: flex;
  flex: 1 1 100%;
  align-items: stretch;
  justify-content: space-between;
  box-shadow: 0 0 20px 6px #090b6f85;
}
@media (max-width: 980px) {
  .box-form {
    flex-flow: wrap;
    text-align: center;
    align-content: center;
    align-items: center;
  }
}
.box-form div {
  height: auto;
}
.box-form .left {
  color: #FFFFFF;
  background-size: cover;
  background-repeat: no-repeat;
  background-image:url('10.jpeg');
  overflow: hidden;
}
.box-form .left .overlay {
  padding: 30px;
  width: 100%;
  height: 100%;
  background: #2f2f31ad;
  overflow: hidden;
  box-sizing: border-box;
}
.box-form .left .overlay h1 {
  font-size: 10vmax;
  line-height: 1;
  font-weight: 900;
  margin-top: 40px;
  margin-bottom: 20px;
}
.box-form .left .overlay span p {
  margin-top: 30px;
  font-weight: 900;
}
.box-form .left .overlay span a {
  background: #3b5998;
  color: #FFFFFF;
  margin-top: 10px;
  padding: 14px 50px;
  border-radius: 100px;
  display: inline-block;
  box-shadow: 0 3px 6px 1px #042d4657;
}
.box-form .left .overlay span a:last-child {
  background: #1dcaff;
  margin-left: 30px;
}
.box-form .right {
  padding: 40px;
  overflow: hidden;
}
@media (max-width: 980px) {
  .box-form .right {
    width: 100%;
  }
}
.box-form .right h5 {
  font-size: 6vmax;
  line-height: 0;
}
.box-form .right p {
  font-size: 14px;
  color: #B0B3B9;
}
.box-form .right .inputs {
  overflow: hidden;
}
.box-form .right input {
  width: 100%;
  padding: 10px;
  margin-top: 25px;
  font-size: 16px;
  border: none;
  outline: none;
  border-bottom: 2px solid #B0B3B9;
}
.box-form .right .remember-me--forget-password {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.box-form .right .remember-me--forget-password input {
  margin: 0;
  margin-right: 7px;
  width: auto;
}
.box-form .right button {
  float: right;
  color: #fff;
  font-size: 16px;
  padding: 12px 35px;
  border-radius: 50px;
  display: inline-block;
  border: 0;
  outline: 0;
  box-shadow: 0px 4px 20px 0px #a3a4eda6;
  background-image: linear-gradient(135deg, #9370f5 10%, #d1e0cd 100%);
}

label {
  display: block;
  position: relative;
  margin-left: 30px;
}

label::before {
  content: ' \f00c';
  position: absolute;
  font-family: FontAwesome;
  background: transparent;
  border: 3px solid #ccddcc;
  border-radius: 4px;
  color: transparent;
  left: -30px;
  transition: all 0.2s linear;
}

label:hover::before {
  font-family: FontAwesome;
  content: ' \f00c';
  color: #fff;
  cursor: pointer;
  background: #ecf1ec;
}

label:hover::before .text-checkbox {
  background: #90b090;
}

label span.text-checkbox {
  display: inline-block;
  height: auto;
  position: relative;
  cursor: pointer;
  transition: all 0.2s linear;
}

label input[type="checkbox"] {
  display: none;
}
button {
  background-color: #e9fcf5;
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
  <script>
    function validateForm() 
    {
      let x = document.forms["myForm"]["user"].value;
      if (x == "") {
        alert("Name must be filled out");
        return false;
      }
      let y = document.forms["myForm"]["password"].value;
      if (y == "") {
        alert("password must be filled out");
        return false;
      }
    }
  </script>
</head>
<body>
<!-- partial:index.partial.html -->
<div class="box-form">
	<div class="left">
		<div class="overlay">
		<h1 Style="font-size:500%;text-shadow: 5px 5px 5px rgb(197, 81, 81);color: white;">E-GATE PASS MANAGEMENT</h1>
		<p></p>
		
		</div>
	</div>
	
	
		<div class="right">
    <h3>Admin</h3>
		<h5>Login</h5>
		<p>Don't have an account? <a href="adsignup.jsp">SIGN UP</a> it takes less than a minute</p>
    <form name="myForm"  onsubmit="return validateForm()" method="post" action="alg.jsp">
		<div class="inputs">
			<input type="text" name="user" placeholder="username" id="username">
			<br>
			<input type="password" name="password" placeholder="password" id="password">
		</div>
			
			<br><br>
			
		<div class="remember-me--forget-password">
				<!-- Angular -->
	<label>
		<input type="checkbox" name="item" checked/>
		<span class="text-checkbox">Remember me</span>
	</label>
			<!--<p>forget password?</p>-->
		</div>
			
			<br>
			<button type="submit"><a style="text-decoration: none; color: #0a0634;">Login</a></button>
      <!--<input type="submit" name="" value="Login" onclick="validate()">-->
	</div>
  </form>
	
</div>
<!-- partial -->
  
</body>
</html>