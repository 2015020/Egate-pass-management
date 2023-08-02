<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta
	name="viewport"
	content="width=device-width,
			initial-scale=1.0"/>
	<link rel="stylesheet" href="style.css"
		class="css" />
</head>
<style>
    * {
margin: 0;
padding: 0;

}

body {
    
font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
font-weight: bold;
background-image: url("silver.jpeg");
background-repeat: no-repeat;
background-size: cover

}

.container {
height: 900px;
width: 800px;
background-image: url("black.jpeg");
/*background-image: linear-gradient(#b04fb0, #e324ea);*/
top: 50%;
left: 50%;
position: absolute;
transform: translate(-50%, -50%);
position: absolute;
border-bottom-left-radius: 180px;
border-top-right-radius: 150px;
}

.main-content {
height: 235px;
/*background-image: linear-gradient(#e66de6, #d342d8);
background-color:rgb(166, 47, 189);*/
border-bottom-left-radius: 90px;
border-bottom-right-radius: 80px;
/*border-top:#f06feb;*/
}

.text {
text-align: center;
font-size: 300%;
text-decoration: aliceblue;
color: rgb(238, 239, 241);
}

.course {
color: rgb(235, 229, 229);
font-size: 25px;
font-weight: bolder;
text-shadow: 5px 5px 10px rgb(235, 229, 229);
}

.centre-content {
height: 180px;
margin: -70px 30px 20px;
color: aliceblue;
text-align: center;
font-size: 20px;
border-radius: 25px;
padding-top: 0.5px;
/*background-image: linear-gradient(#fd8cf4, #ed1de2);*/
}

.centre-content-h1 {
padding-top: 30px;
padding-bottom: 30px;
font-weight: normal;
}

.price {
font-size: 60px;
margin-left: 5px;
bottom: 15px;
position: relative;
text-shadow: 5px 5px 4px rgb(237, 29, 29);
}

.pay-now-btn {
cursor: pointer;
color: #fff;
height: 50px;
width: 290px;
border: none;
margin: 5px 30px;
background-color: rgb(227, 12, 12);
position: relative;
}

.card-details {
background: rgb(8, 49, 14);
color: rgb(225, 223, 233);
margin: 10px 30px;
padding: 10px;
/* border-bottom-left-radius: 80px; */
}

.card-details p {
font-size: 15px;
}

.card-details label {
font-size: 15px;
line-height: 35px;
}

.submit-now-btn {
cursor: pointer;
color: #fff;
height: 30px;
width: 240px;
border: none;
margin: 5px 30px;
background-color: rgb(229, 16, 30);
}

</style>
<body>
    
	<div class="container">
	<div class="main-content">
		<p class="text">GATEPASS</p>
	</div>

	<div class="centre-content">
		<h1 class="price">GATEPASS<span>/-</span></h1>
		<p class="course">
		EXIT PASS
		</p>
	</div>

	<P style="margin-left:40% ; color: #e6e2e2;">FILL THIS!</p></br></br>
    <form action="" method="post">
		<div class="card-number">
		   <label style="margin-left:30% ;color: #fff;", > NAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
		   <input
			type="text" name="user"
			class="card-number-field"/>
        </div>
        
			
		
		
		<div class="date-number">
		<label style="margin-left:30% ; color: #fff;" >  DATE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
		<input type="text" class="date-number-field" name="date"
				placeholder="DD-MM-YY" />
		</div>
        <div class="date-number">
            <label style="margin-left:30% ;color: #fff;">  EXIT TIME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input type="text" class="date-number-field" name="exit_time"
                    placeholder="00:00" />
            </div>
        


		<div class="cvv-number">
		<label style="margin-left:30% ;color: #fff;"> REG NUM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
		
		<input type="text" class="cvv-number-field" name="reg_num"
				placeholder="" />
		</div>

		<div class="cvv-number">
			<label style="margin-left:30% ;color: #fff;"> DEPART...&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
			
			<input type="text" class="cvv-number-field" name="Department"
					placeholder="" />
			</div>
		<div class="cvv-number">
			<label style="margin-left:30% ;color: #fff;"> PHONE NUM&nbsp;&nbsp;&nbsp;&nbsp;</label>
			<input type="text" class="cvv-number-field" name="phone_num"
					placeholder="" />
			</div>

			<div class="cvv-number">
				<label style="margin-left:30% ;color: #fff;"> Email &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<input type="text" class="cvv-number-field" name="email"
						placeholder="" />
				</div>
		<div class="nameholder-number">
		<label style="margin-left:30% ; color: #fff;">PLACE &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
		<input
			type="text" name="destination"
			class="card-name-field"
			placeholder=""/>
		</div></br></br></br>
		<button type="submit"
				class="submit-now-btn" style="margin-left:30% ;text-decoration: none;"> submit
		</button>
	</form>

	</div>

	</div>
</body>
</html>


<%
    String a = request.getParameter("user");
    String b = request.getParameter("date");
    String c = request.getParameter("exit_time");
    String d = request.getParameter("reg_num");
	String e = request.getParameter("phone_num");
	String f = request.getParameter("destination");
	String g = request.getParameter("Department");
	String h = request.getParameter("email");
    String host= "jdbc:mysql://localhost:3306/gatepass";
    PreparedStatement stmt = null;
    Class.forName("com.mysql.jdbc.Driver");
    if(a!=null && b!=null && c!=null && d!=null && e!=null && f!=null && h!=null ){
        Connection con = DriverManager.getConnection(host,"root","");
		stmt = con.prepareStatement("insert into exitpass (user, date, exit_time, reg_num, phone_num, destination, Department, email) values (?, ?, ?, ?, ?, ?, ?, ?);");
        stmt.setString(1,a);
        stmt.setString(2,b);
        stmt.setString(3,c);
        stmt.setString(4,d);
		stmt.setString(5,e);
		stmt.setString(6,f);
		stmt.setString(7,g);
		stmt.setString(8,h);
        stmt.executeUpdate();
        response.sendRedirect("tq.jsp");
    }
		   
%>

