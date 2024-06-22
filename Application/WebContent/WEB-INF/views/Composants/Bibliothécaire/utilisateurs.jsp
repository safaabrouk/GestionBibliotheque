<%@page import="java.util.ArrayList"%>
<%@page import="models.Personne"%>
<%@page import="services.ServicePersonne"%>

<% 
ArrayList<Personne> users = ServicePersonne.ConsulterListesUtilisateurs();

 %>

                <header class="content__title">
                    <h1>Tables des utilisateurs</h1>

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
                                        <th>Profil</th>
                                        <th>Nom</th>
                                        <th>Prénom</th>
                                        <th>Adresse email</th>
                                        <th>Cin</th>
                                        <th>Tél</th>
                                        <th>Statut</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody id="bodyTable">
                      <% for(Personne l :users){ %> 
                                <tr>
                                    <td><%=l.getId()%></td>
                                    <td class="lightbox photos">
                                      <a href="./Ressources/images/Profil/<%=l.getProfil().getUrl_image()%>" class="col-md-2 col-4">
                                        <div class=" groups__img">
                                               <img src="./Ressources/images/Profil/<%=l.getProfil().getUrl_image()%>" alt="" />
                                        </div>
                                      </a>
                                    </td>
                                    
                                    <td><%=l.getNom()%></td>
                                    <td><%=l.getPrenom()%></td>
                                    <td><%=l.getLogin()%></td>                                    
                                    <td><%=l.getCin()%></td>
                                    <td><%=l.getTel()%></td>
                                    <td>
                                      <% if(l.getProfil().getStatut()==0){ %>
                                      Non valide
                                      <%} else if(l.getProfil().getStatut()==1){ %>
                                       Activé
                                       <%}else{%>
                                        Désactivé
                                       <%}%>
                                    </td>
                                    <td>
                                      <% if(l.getProfil().getStatut()==0){ %>
                                       <a class="statut"> 
                                          <i class="zmdi zmdi-check-circle valide"></i>
                                          <input type="hidden" value="<%=l.getProfil().getId_profil()%>">
                                       </a> 
                                      <%} else if(l.getProfil().getStatut()==1){ %>
                                        <a class="statut"> 
                                            <i class="zmdi zmdi-block desactiver"></i>
                                            <input type="hidden" value="<%=l.getProfil().getId_profil()%>">
                                        </a> 
                                       <%}else{%>
                                        <a class="statut">
                                          <i class="zmdi zmdi-spellcheck activer"></i>
                                          <input type="hidden" value="<%=l.getProfil().getId_profil()%>">
                                        </a>
                                       <%}%>                                      
                                           
							            <a class="delete" >
                                            <i class="zmdi zmdi-delete"></i>
                                            <input type="hidden" value="<%=l.getProfil().getId_profil()%>">
                                        </a>
                                    </td>                                        
                                </tr>
          <% } %> 
          
          
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

       