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
    <link rel="shortcut icon" type="image/x-icon" href="./Ressources/images/Application/LibraryIcon.png" />  
    <title> ReadMore | Emprunt </title>
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

	   	       <%@include file="../Contents/ContentThisEmprunt.jsp"%>

   </main>
   

<!-- Javascript -->
        <!-- Vendors -->
        <script src="./Ressources/vendors/bower_components/jquery/dist/jquery.min.js"></script>
        <script src="./Ressources/vendors/bower_components/popper.js/dist/umd/popper.min.js"></script>
        <script src="./Ressources/vendors/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="./Ressources/vendors/bower_components/jquery.scrollbar/jquery.scrollbar.min.js"></script>
        <script src="./Ressources/vendors/bower_components/jquery-scrollLock/jquery-scrollLock.min.js"></script>

        <script src="./Ressources/vendors/bower_components/salvattore/dist/salvattore.min.js"></script>

        <!-- Fontowsen -->
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	    <!-- App functions and actions -->
	    <script src="./Ressources/Js/app.min.js"></script>
	    
</body>

</html>

<%} else {
	
	request.getServletContext().getRequestDispatcher("/authentification").forward(request, response);
 }
%>