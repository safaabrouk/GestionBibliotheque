<%@page import="tools.Role"%>
<%@page import="models.Personne"%>
 <% 
 
 Personne ContentProfil = (Personne) session.getAttribute("profil"); 
 if(ContentProfil!= null && ContentProfil.getRole().equals(Role.utilisateur)){

 %>
	
	<aside class="sidebar">
	   	<%@include file="../Composants/Utilisateur/NavUtilisateur.jsp"%>
    </aside>

<%} else if(ContentProfil!= null && ContentProfil.getRole().equals(Role.bibliothecaire)) {  %>
	
	
   <aside class="sidebar">
   	<%@include file="../Composants/Bibliothécaire/NavBibliothécaire.jsp"%>
   </aside>
  
	
<%} else {%>
   <aside class="sidebar">
   	<%@include file="../Composants/Admin/NavAdmin.jsp"%>
   </aside>
<%}%>
<% %>
 <section class="content">
	<%@include file="../Composants/ComposantsCommun/NouveauMessage.jsp"%>	
	<%@include file="../Footers/FooterApresAhuth.jsp"%>		
</section>