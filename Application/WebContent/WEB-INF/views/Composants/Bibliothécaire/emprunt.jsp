<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="models.Emprunt"%>
<%@page import="services.ServiceEmprunt"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Reservation"%>
<%@page import="services.ServiceReservation"%>
<% 
ArrayList<Emprunt> emprunt = ServiceEmprunt.ConsulterEmprunts();
Date d = new Date();
Date dF = new Date();
 %>

                <header class="content__title">
                    <h1>Tables des emprunts :</h1>

                    <div class="actions">
                            <a href="#" class="actions__item zmdi zmdi-trending-up"></a>
                            <a href="#" class="actions__item zmdi zmdi-check-all"></a>

                            <div class="dropdown actions__item">
                                <i data-toggle="dropdown" class="zmdi zmdi-more-vert"></i>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a href="#" class="dropdown-item">Refresh</a>
                                    <a href="#" class="dropdown-item">Manage Widgets</a>
                                    <a href="#" class="dropdown-item">Settings</a>
                                </div>
                            </div>
                        </div>
                </header>
                
                 <div class="card">
                    <div class="card-body">
                        <div  class="table-responsive">
                        <a  class="actions__item  add-new" data-toggle="modal" data-target="#modal-large">
                            </a>
                            <table id="data-table" class="table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Livre</th>
                                        <th>Nom livre</th>
                                        <th>Emprunteur</th>
                                        <th>Emeil emprunteur</th>
                                        <th>Date emprunt</th>
                                        <th>Date de retour</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody id="bodyTable">
                      <% for(Emprunt r : emprunt){ 
                    	  Reservation l = ServiceReservation.ChercherReservationViaEmprunt(r.getLivre().getId_livre(),r.getNumero_exemplaire());
                      %>
                      <% d.setTime(r.getDate_emprunt().getTime()); 
		                 String date = new SimpleDateFormat("dd/MM/yyyy").format(d);
		                 dF.setTime(r.getDate_emprunt().getTime()+604800000); 
		                 String dateRetour = new SimpleDateFormat("dd/MM/yyyy").format(dF);
		                 
		              %>                           
                                <tr>
                                    <td><%=r.getId_emprunt()%></td>
                                    <td class="lightbox photos">
                                      <input type="hidden" value="<%=r.getLivre().getId_livre()%>">
                                      <input type="hidden" value="<%=r.getLivre().getNbr_exemplaire()%>">
                                      <input type="hidden" value="<%=l.getId_reservation()%>">
                                      <a href="./Ressources/images/CouvertureLivre/<%=r.getLivre().getUrl_couverture()%>" class="col-md-2 col-4">
                                        <div class=" groups__img">
                                               <img src="./Ressources/images/CouvertureLivre/<%=r.getLivre().getUrl_couverture()%>" alt="" />
                                        </div>
                                      </a>
                                    </td>
                                    
                                    <td><%=r.getLivre().getTitre()%></td>
                                    <td><%=l.getUtilisateur().getPrenom()%> <%=l.getUtilisateur().getNom()%></td>
                                    <td><%=l.getUtilisateur().getLogin()%></td>                                    
                                    <td><%=date%></td>
                                    <td><%=dateRetour%></td>

                                    <td>
                                        <a class="view test" > 
                                            <i class="zmdi zmdi-eye testt"></i>
                                        </a>
							            <a class="delete test" >
                                            <i class="zmdi zmdi-delete"></i>
                                        </a>
                                    </td>                                        
                                </tr>
          <% } %> 
          
          
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
