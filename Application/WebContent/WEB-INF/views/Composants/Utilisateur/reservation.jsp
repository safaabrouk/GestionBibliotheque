  <%@page import="models.Reservation"%>
<%@page import="models.Personne"%>
<%@page import="models.Utilisateur"%>
<%@page import="services.ServiceReservation"%>
<%@page import="models.Livre"%>
<%@page import="java.util.ArrayList"%>
<% 
Personne pEnregistrer = (Personne) session.getAttribute("profil"); 
Utilisateur uti = new Utilisateur(pEnregistrer.getId(), pEnregistrer.getNom(), pEnregistrer.getPrenom(), pEnregistrer.getLogin(), pEnregistrer.getPassword(), pEnregistrer.getCin(), pEnregistrer.getTel());
 ArrayList<Reservation> ListeReservation = ServiceReservation.ConsulterReservationsViaIdUtilisateur(uti);
 %>
        
        
        
        
        <div class="content__inner">
        		    <div class="toolbar">
                        <div class="toolbar__label">
                            <span class="hidden-xs-down">Mes réservations</span> 
                        </div>
                    </div>

                    <div class="row notes">
                     <% for(Reservation r :ListeReservation){ %>   
                    	<div class="col-sm-4 col-md-2 col-6  notes__item" >
                            <a href="#edit-note" style="background-image:url(./Ressources/images/CouvertureLivre/<%=r.getLivre().getUrl_couverture()%>);background-repeat: no-repeat; background-position: center center; background-size: 100% 100%; ">
                            </a>
                            <div class="notes__actions supprimer" >
                                 <input type="hidden"  value="<%=r.getId_reservation()%>" >
                                 <i class="zmdi zmdi-delete "></i>
                            </div>


                        </div>
                          <% } %> 
                    </div>  
        	</div>