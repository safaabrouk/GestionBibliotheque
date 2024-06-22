<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>ReadMore | 2020</title>
	<link rel="stylesheet" type="text/css" href="./Ressources/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="./Ressources/Css/footer_styles.css" />
    <link rel="stylesheet" type="text/css" href="./Ressources/Css/header_styles.css" />
    <link rel="stylesheet" type="text/css" href="./Ressources/Css/courses.css">
    <link rel="stylesheet" type="text/css" href="./Ressources/Css/courses_responsive.css">
    <link rel="stylesheet" type="text/css" href="./Ressources/Css/responsive.css">
    <link rel="stylesheet" type="text/css" href="./Ressources/bootstrap4/bootstrap.min.css">
    <link rel="shortcut icon" type="image/x-icon" href="./Ressources/images/Application/LibraryIcon.png" />  
    <link href="./Ressources/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="./Ressources/Jquery/jquery-3.2.1.min.js"></script>
    <script src="./Ressources/Jquery/jquery.js"></script>
    <script src="./Ressources/Js/courses.js"></script>
    <script type="text/javascript" src="./Ressources/Js/jquery.mkinfinite.js"></script>
    <script src="./Ressources/Js/header.js"></script>

    
    
</head>
<body>
   <div class="container-fluid">
	  <div class="header row">
	      <%@include file="../Headers/HeaderavantAuth2.jsp" %>
	  </div>
	  <br><br><br><br>
	  <div class="content row">
	     <%@include file="../Contents/ContentNouveaute.jsp" %>
	  </div>
	  <br><br><br>	
	  <div class="footer">
	       <%@include file="../Footers/FooterAvantAuth.jsp" %>
	  </div>
  </div>
</body>
</html>