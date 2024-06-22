<%@page import="tools.Role"%>
<%@page import="models.Personne"%>
 <% 
 
 Personne p = (Personne) session.getAttribute("profil"); 
 if(p != null && p.getRole().equals(Role.bibliothecaire) ){

 %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <meta charset="ISO-8859-1">
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script type="text/javascript" src="./Ressources/Jquery/jquery.js"></script>
    <link rel="shortcut icon" type="image/x-icon" href="./Ressources/images/Application/LibraryIcon.png" />  
    <title> ReadMore | Bibliothécaire </title>
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

	   	       <%@include file="../Contents/ContentBibliotecaire.jsp"%>

   </main>
   
     <!-- Javascript -->
    <!-- Vendors -->

<!-- Javascript -->
        <!-- Javascript -->
        <!-- Vendors -->
        <script src="./Ressources/vendors/bower_components/jquery/dist/jquery.min.js"></script>
        <script src="./Ressources/vendors/bower_components/popper.js/dist/umd/popper.min.js"></script>
        <script src="./Ressources/vendors/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="./Ressources/vendors/bower_components/jquery.scrollbar/jquery.scrollbar.min.js"></script>
        <script src="./Ressources/vendors/bower_components/jquery-scrollLock/jquery-scrollLock.min.js"></script>

        <script src="./Ressources/vendors/bower_components/flot/jquery.flot.js"></script>
        <script src="./Ressources/vendors/bower_components/flot/jquery.flot.pie.js"></script>
        <script src="./Ressources/vendors/bower_components/flot/jquery.flot.resize.js"></script>
        <script src="./Ressources/vendors/bower_components/flot.curvedlines/curvedLines.js"></script>
        <script src="./Ressources/vendors/bower_components/flot.orderbars/js/jquery.flot.orderBars.js"></script>

        <!-- Demo -->
        
        <script src="./Ressources/demo/js/flot-charts/line.js"></script>
        <script src="./Ressources/demo/js/flot-charts/dynamic.js"></script>
        <script src="./Ressources/demo/js/flot-charts/pie.js"></script>

        <!-- Fontowsen -->
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>

    <!-- App functions and actions -->
    <script src="./Ressources/Js/contacter.js"></script>
    <script src="./Ressources/Js/app.min.js"></script>
</body>

</html>

<%} else {
	
	request.getServletContext().getRequestDispatcher("/authentification").forward(request, response);
 }
%>