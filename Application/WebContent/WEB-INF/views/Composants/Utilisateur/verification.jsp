  <%@page import="models.Reservation"%>
<%@page import="models.Personne"%>
<%@page import="models.Utilisateur"%>
<%@page import="services.ServiceReservation"%>
<%@page import="models.Livre"%>
<%@page import="java.util.ArrayList"%>
<% 
 Personne PReservation = (Personne) session.getAttribute("profil"); 
 Utilisateur uti = new Utilisateur(PReservation.getId(), PReservation.getNom(), PReservation.getPrenom(), PReservation.getLogin(), PReservation.getPassword(), PReservation.getCin(), PReservation.getTel());
 ArrayList<Reservation> ListeReservationver = ServiceReservation.VerifierReservationsViaIdUtilisateur(uti);
 
 %>
     
                   
                    
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">V�rifier votre r�servation</h4>
                       
                        </div>
          <% for(Reservation r :ListeReservationver){ %>   
                        <div class="listview listview--hover">
                            <a class="listview__item">
                                <img src="./Ressources/images/CouvertureLivre/<%=r.getLivre().getUrl_couverture()%>" class="listview__img" alt="">
                                <div class="listview__content">
                                    <div class="listview__heading"><%=r.getLivre().getTitre()%></div>
                                     <% if(r.getEtat_reservation()==0){ %>  
                                    <p> Votre r�servation est en cours de traitement ... </p>
                                     <% } else if(r.getEtat_reservation()== 1){ %>  
                                    <p> Votre r�servation est bien valider vous pouvez venir pour emprunter votre livre.</p>
                                     <% } else if(r.getEtat_reservation()== -1) { %>
                                    <p>Nous nous excusons car votre demande a �t� rejet�e, Mais vous pouvez r�essayer une autre r�servation.</p>
                                     <% } %>    
                                </div>
                            </a>
                        </div>
                   <% } %>     
                    </div>