

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" type="text/css" href="adm.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap');

        :root{
    --violet:#ca00fd;
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
        <h1 class="logo">e gatepass</h1>
        <ul class="nav">
            <li class="active"><a href="#"><i class="fa fa-windows"></i> Dashboard</a></li>
            <li><a href="adminin.jsp"><i class="fa fa-sign-in"></i> in</a></li>
            <li><a href="adminout.jsp"><i class="fa fa-sign-out"></i>out</a></li>
            <li><a href="#"><i class="fa fa-meh-o"></i>waiting</a></li>
            <li><a href="#"><i class="fa fa-smile-o"></i>accepted</a></li>
            <li><a href="#"><i class="fa fa-frown-o"></i> rejected</a></li>

        </ul>
    </div>
    <div class="main">
        
        <div class="head-section">
            <div class="col-6">
                <h2>Admin</h2>
                <p>30 gatepass</p>
            </div>

            <div class="col-6" style="text-align: right;">
                <i class="fa fa-bell-o hicon"></i>
                <input type="text" class="search">
                <i class="fa fa-search hicon sicon"></i>

                <img src="lgl.jpg" class="user">

                <div class="profile-div">
                    <p><i class="fa fa-user"></i>   Profile</p>
                    <p><i class="fa fa-cog"></i>   Settings</p>
                    <p><i class="fa fa-power-off"></i>   Log Out</p>
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
            <p>All gatepass</p><br><br>

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
    
</script>
</body>
</html>