<%@page import="tools.Role"%>
<%@page import="models.Personne"%>
 <% 
 
 Personne p = (Personne) session.getAttribute("profil"); 
 if(p == null){

 %>

<!DOCTYPE html>
<html>
<head>
	<title> ReadMore | Inscription </title>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<link rel="shortcut icon" type="image/x-icon" href="./Ressources/images/Application/LibraryIcon.png" />	
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="./Ressources/Css/Inscription_Authentification.css">
    <script type="text/javascript" src="./Ressources/Js/Inscription_Authentification.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript" src="./Ressources/Jquery/jquery.js"></script>
    <link rel="stylesheet" href="./Ressources/fonts/ionicons.min.css">
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body class="content">

	    <%@include file="../Contents/Content_Inscri.jsp"%>
 
  
</body>
</html>
<%} else{
	
	if(p.getRole().equals(Role.utilisateur))
	{
	  request.getServletContext().getRequestDispatcher("/utilisateur").forward(request, response);
	}
	
	else if(p.getRole().equals(Role.bibliothecaire)) {
		request.getServletContext().getRequestDispatcher("/bibliothecaire").forward(request, response);
	}
	
	else {
		request.getServletContext().getRequestDispatcher("/admin").forward(request, response);
	}
} 

%>