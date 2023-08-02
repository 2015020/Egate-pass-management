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

<style>
    * {
margin: 0;
padding: 0;

}

body {
    
font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
font-weight: bold;

}

.container {
height: 900px;
width: 800px;
background-image: url("pur.jpg");
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
/*background-color: #1b9236;*/
border-bottom-left-radius: 90px;
border-bottom-right-radius: 80px;
/*border-top: #1e6b30;*/
}

.text {
text-align: center;
font-size: 300%;
text-decoration: aliceblue;
color: aliceblue;
}

.course {
color: black;
font-size: 25px;
font-weight: bolder;
}

.centre-content {
height: 180px;
margin: -70px 30px 20px;
color: aliceblue;
text-align: center;
font-size: 20px;
border-radius: 25px;
padding-top: 0.5px;
/*background-image: linear-gradient(#1e6b30, #308d46);*/
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
}

.pay-now-btn {
cursor: pointer;
color: #fff;
height: 50px;
width: 290px;
border: none;
margin: 5px 30px;
/*background-color: rgb(71, 177, 61);*/
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
background-color: rgb(171, 45, 171);
}

</style>

	</head>
<body>
    
	<div class="container">
	<div class="main-content">
		<p class="text">GATEPASS</p>
	</div>
	
	<form action="">
	<div class="centre-content">
		<h1 class="price">GATEPASS<span>/-</span></h1>
		<p class="course">
		IN PASS
		</p>
	</div>

	<P style="margin-left:40% ; color: #fff;">FILL THIS!</p></br></br>

		<div class="card-number">
		   <label style="margin-left:30% ;"> NAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
		   <input
			type="text" name="user"
			class="card-number-field"/>
        </div>
        
			
		
		
		<div class="date-number">
		<label style="margin-left:30% ;">  Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
		<input type="text" class="date-number-field" name="date"
				placeholder="DD-MM-YY" />
		</div>
        <div class="date-number">
            <label style="margin-left:30% ;">  IN TIME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
            <input type="text" class="date-number-field" name="in_time"
                    placeholder="00:00" />
            </div>
        


		<div class="cvv-number">
		<label style="margin-left:30% ;"> REG NUM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
		<input type="text" class="cvv-number-field" name="reg_num"
				placeholder="" />
		</div>
		<div class="cvv-number">
			<label style="margin-left:30% ;"> PHONE NUM&nbsp;&nbsp;&nbsp; </label>
			<input type="text" class="cvv-number-field" name="phone_num"
					placeholder="" />
			</div>
		</br></br></br>
		<button type="submit"
				class="submit-now-btn" style="margin-left:30% ;text-decoration: none;">submit
		</button>
	</form>
	</div>
</div>

</body>
</html>

<%
    String a = request.getParameter("user");
    String b = request.getParameter("date");
    String c = request.getParameter("in_time");
    String d = request.getParameter("reg_num");
	String e = request.getParameter("phone_num");
    String host= "jdbc:mysql://localhost:3306/gatepass";
    PreparedStatement stmt = null;
    Class.forName("com.mysql.jdbc.Driver");
    if(a!=null && b!=null && c!=null && d!=null && e!=null ){
		Connection con = DriverManager.getConnection(host,"root","");
		stmt = con.prepareStatement("insert into in_time (user, date, in_time, reg_num, phone_num) values (?, ?, ?, ?, ?);");
        stmt.setString(1,a);
        stmt.setString(2,b);
        stmt.setString(3,c);
        stmt.setString(4,d);
		stmt.setString(5,e);
        stmt.executeUpdate();
        response.sendRedirect("tq.jsp");
    }
%>
