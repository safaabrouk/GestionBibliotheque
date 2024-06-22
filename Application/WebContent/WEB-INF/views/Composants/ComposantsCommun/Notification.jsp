<%@page import="tools.Role"%>
<%@page import="models.Reservation"%>
<%@page import="models.Personne"%>
<%@page import="models.Utilisateur"%>
<%@page import="services.ServiceReservation"%>
<%@page import="models.Livre"%>
<%@page import="java.util.ArrayList"%>
<% 
 Personne pEnre = (Personne) session.getAttribute("profil"); 
 Utilisateur u = new Utilisateur(pEnre.getId(), pEnre.getNom(), pEnre.getPrenom(), pEnre.getLogin(), pEnre.getPassword(), pEnre.getCin(), pEnre.getTel());
 %>
    
 <% 
if(pEnre.getRole().equals(Role.utilisateur)){
ArrayList<Reservation> ListeReservation = ServiceReservation.VerifierReservationsViaIdUtilisateur(u);

 %>
  <% for(Reservation r :ListeReservation){ %>
       <% if(r.getEtat_reservation()==1){ %>    
		<a href="<%=request.getContextPath()+"/verification"%>" class="listview__item">
		    <img src="./Ressources/images/CouvertureLivre/<%=r.getLivre().getUrl_couverture()%>" class="listview__img" alt="">
		
		   <div class="listview__content">
		        <div class="listview__heading"><%=r.getLivre().getTitre()%></div>
		       <p>Votre réservation bien validé</p>
		   </div>
		</a>
		<% } %>
 <% } %>   
<% }else if(pEnre.getRole().equals(Role.bibliothecaire)){
	ArrayList<Reservation> reservations = ServiceReservation.ConsulterReservations();
	for(Reservation r :reservations){
 %>   
        <a href="<%=request.getContextPath()+"/reservations"%>" class="listview__item">
		    <img src="./Ressources/images/Profil/<%=r.getUtilisateur().getProfil().getUrl_image()%>" class="listview__img" alt="">
		
		   <div class="listview__content">
		        <div class="listview__heading"><%=r.getLivre().getTitre()%></div>
		       <p>réserver par : <%=r.getUtilisateur().getPrenom()%> <%=r.getUtilisateur().getNom()%></p>
		   </div>
		</a>
 
 <%}
	}else { %> 
   
  <% } %>
 
 