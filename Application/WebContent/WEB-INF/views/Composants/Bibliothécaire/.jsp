<%@page import="models.Reservation"%>
<%@page import="services.ServiceReservation"%>
<%@page import="java.util.ArrayList"%>
<% 
ArrayList<Reservation> reservation = ServiceReservation.ConsulterReservations();

 %>

                <header class="content__title">
                    <h1>Tables des réservation à valider :</h1>

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
                                        <th>Nom et Prenom</th>
                                        <th>Adresse email</th>
                                        <th>Cin</th>
                                        <th>Tél</th>
                                        <th>Date reservation</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody id="bodyTable">
                      <% for(Reservation r : reservation){ %> 
                                <tr>
                                    <td><%=r.getId_reservation()%></td>
                                    <td class="lightbox photos">
                                      <input type="hidden" value="<%=r.getLivre().getId_livre()%>">
                                      <input type="hidden" value="<%=r.getLivre().getNbr_exemplaire()%>">
                                      <a href="./Ressources/images/CouvertureLivre/<%=r.getLivre().getUrl_couverture()%>" class="col-md-2 col-4">
                                        <div class=" groups__img">
                                               <img src="./Ressources/images/CouvertureLivre/<%=r.getLivre().getUrl_couverture()%>" alt="" />
                                        </div>
                                      </a>
                                    </td>
                                    
                                    <td><%=r.getLivre().getTitre()%></td>
                                    <td><%=r.getUtilisateur().getPrenom()%> <%=r.getUtilisateur().getNom()%></td>
                                    <td><%=r.getUtilisateur().getLogin()%></td>                                    
                                    <td><%=r.getUtilisateur().getCin()%></td>
                                    <td><%=r.getUtilisateur().getTel()%></td>
                                    <td><%=r.getDate_reservation()%></td>
                                    <td>
                                        <a class="view test" > 
                                            <i class="zmdi zmdi-eye testt"></i>
                                            <br>
                                        </a>
                                        <a class="statut test">
                                          <i class="zmdi zmdi-spellcheck activer"></i>
                                           <br>
                                        </a>
							            <a class="delete test" >
                                            <i class="zmdi zmdi-delete"></i>
                                             <br>
                                        </a>
                                    </td>                                        
                                </tr>
          <% } %> 
          
          
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
