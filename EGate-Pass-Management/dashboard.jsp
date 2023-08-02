<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
       body {
  background-image: linear-gradient(135deg, #FAB2FF 10%, #0a0634 100%);
  
}
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 550px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #eaadd2;
      height: 100%;
    }
        
    /* On small screens, set height to 'auto' for the grid */
    @media screen and (max-width: 767px) {
      .row.content {height: auto;} 
    }
  </style>
</head>
<body>

<nav class="navbar navbar-inverse visible-xs">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Dashboard</a></li>
        <li><a href="in.jsp">IN</a></li>
        <li><a href="#">OUT</a></li>
     
      </ul>
    </div>
  </div>
</nav>

<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-3 sidenav hidden-xs">
      <h2>GATE PASS</h2>
      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="#section1">Dashboard</a></li>
        <li><a href="in.jsp">IN PASS</a></li>
        <li><a href="exit.jsp">EXIT PASS</a></li>
       
      </ul><br>
    </div>
    <br>
    
    <div class="col-sm-9">
      <a href="dashboard.jsp"><div class="well" style=" background-image: linear-gradient(135deg, #FAB2FF 10%, #1c0fb0 100%);">
        <h4>Dashboard</h4>
        
      </div></a>
      <div class="row">
        <div class="col-sm-12" >
          <a href="in.jsp"><div class="well" style=" background-image: linear-gradient(135deg, #FAB2FF 10%, #1c0fb0 100%);">
            <h4>STUDENT</h4>
            <p style="font-family:Verdana, Geneva, Tahoma, sans-serif ;font-size:300%;">IN ENTRY</p> 
            <img src="in.jpg" alt="Italian Trulli" style="margin-left:70%;margin-top: -5%;">
          </div></a>
        </div>

        <div class="col-sm-12">
          <a href="exit.jsp"><div class="well" style=" background-image: linear-gradient(135deg, #FAB2FF 10%, #1c0fb0 100%);">
            <h4></h4>
            <p style="font-family:Verdana, Geneva, Tahoma, sans-serif ;font-size:300%;">OUT ENTRY</p> 
            <img src="out.jpg" alt="Italian Trulli" style="margin-left:70%;margin-top: -5%;">
          </div></a>
        </div>
        
        
      </div>
      
        
      
    </div>
  </div>
</div>

</body>
</html>
