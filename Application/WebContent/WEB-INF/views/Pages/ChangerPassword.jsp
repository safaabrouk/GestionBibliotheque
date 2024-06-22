<%@page import="tools.Role"%>
<%@page import="models.Personne"%>
 <% 
 
 Personne p = (Personne) session.getAttribute("profil"); 
 if((p != null && p.getRole().equals(Role.utilisateur)) || (p != null && p.getRole().equals(Role.bibliothecaire)) || (p != null && p.getRole().equals(Role.admin))  ){

 %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->

    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script type="text/javascript" src="./Ressources/Jquery/jquery.js"></script>
    <link rel="shortcut icon" type="image/x-icon" href="./Ressources/images/Application/LibraryIcon.png" />  
    <title> ReadMore | Changer mot de passe </title>
     <!-- Vendor styles -->
     <link rel="stylesheet" href="./Ressources/vendors/bower_components/material-design-iconic-font/dist/css/material-design-iconic-font.min.css">
     <link rel="stylesheet" href="./Ressources/vendors/bower_components/animate.css/animate.min.css">
     <link rel="stylesheet" href="./Ressources/vendors/bower_components/jquery.scrollbar/jquery.scrollbar.css">

     <!-- App styles -->
     <link rel="stylesheet" href="./Ressources/Css/app.min.css">
</head>
<body  data-sa-theme="5">
   <main class="main">
   	    <div class="page-loader">
            <div class="page-loader__spinner">
                <svg viewBox="25 25 50 50">
                    <circle cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" />
                </svg>
            </div>
        </div>
	   	<header class="header">
	   	       <%@include file="../Headers/HeaderApresAuth.jsp"%>
	   	</header>

	   	       <%@include file="../Contents/ContentChangerPassword.jsp"%>
	   	          <% session.setAttribute("profil", p); %>

   </main>
   
     <!-- Javascript -->
    <!-- Vendors -->

<!-- Javascript -->
        <!-- Vendors -->
        <script src="./Ressources/vendors/bower_components/jquery/dist/jquery.min.js"></script>
        <script src="./Ressources/vendors/bower_components/popper.js/dist/umd/popper.min.js"></script>
        <script src="./Ressources/vendors/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="./Ressources/vendors/bower_components/jquery.scrollbar/jquery.scrollbar.min.js"></script>
        <script src="./Ressources/vendors/bower_components/jquery-scrollLock/jquery-scrollLock.min.js"></script>

        <script src="./Ressources/vendors/bower_components/salvattore/dist/salvattore.min.js"></script>
        <script src="./Ressources/vendors/bower_components/flot/jquery.flot.js"></script>
        <script src="./Ressources/vendors/bower_components/flot/jquery.flot.resize.js"></script>
        <script src="./Ressources/vendors/bower_components/flot.curvedlines/curvedLines.js"></script>
        <script src="./Ressources/vendors/bower_components/jqvmap/dist/jquery.vmap.min.js"></script>
        <script src="./Ressources/vendors/bower_components/jqvmap/dist/maps/jquery.vmap.world.js"></script>
        <script src="./Ressources/vendors/bower_components/jquery.easy-pie-chart/dist/jquery.easypiechart.min.js"></script>
        <script src="./Ressources/vendors/bower_components/peity/jquery.peity.min.js"></script>
        <script src="./Ressources/vendors/bower_components/moment/min/moment.min.js"></script>
        <script src="./Ressources/vendors/bower_components/fullcalendar/dist/fullcalendar.min.js"></script>

        <!-- Charts and maps-->
        <script src="./Ressources/demo/js/flot-charts/curved-line.js"></script>
        <script src="./Ressources/demo/js/flot-charts/line.js"></script>
        <script src="./Ressources/demo/js/flot-charts/chart-tooltips.js"></script>
        <script src="./Ressources/demo/js/other-charts.js"></script>
        <script src="./Ressources/demo/js/jqvmap.js"></script>

        <!-- Fontowsen -->
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <!-- App functions and actions -->
    <script src="./Ressources/Js/app.min.js"></script>
    <script src="./Ressources/Js/changerPassword.js"></script>


</body>
</html>
<%} else {
	
	request.getServletContext().getRequestDispatcher("/authentification").forward(request, response);
 }
%>