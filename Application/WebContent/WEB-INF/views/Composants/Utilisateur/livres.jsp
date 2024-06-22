<%@page import="models.Categorie"%>
<%@page import="services.ServiceCategorie"%>
<%@page import="models.Livre"%>
<%@page import="java.util.ArrayList"%>
<% 
ArrayList<Categorie> ListeCategorie = ServiceCategorie.ConsulterCategories();
 %> 
  
  
                <div class="content__inner">
                    <div class="toolbar">
                        <div class="toolbar__label">
                            Nos livres
                        </div>

                        <div class="actions">
                            <i class="actions__item zmdi zmdi-search" data-sa-action="toolbar-search-open"></i>
                            <div class="dropdown actions__item">
                                <i class="zmdi zmdi-sort" data-toggle="dropdown"></i>

                                <div class="dropdown-menu dropdown-menu-right">
                                    <a href="<%=request.getContextPath()+"/livre"%>" class="dropdown-item">Actualiser</a>
                                </div>
                            </div>
                            
                        </div>

                        <div class="toolbar__search">
                            <input type="text" placeholder="Chercher votre livre ..." id="InputChercher" >
                            <i class="toolbar__search__close zmdi zmdi-long-arrow-left" data-sa-action="toolbar-search-close"></i>
                        </div>
                    </div>
       <!--   CouvertureLivre -->
             <% for(Categorie c :ListeCategorie){ %>  
                    <div class="toolbar">
                        <div class="toolbar__label"><%=c.getNom_categorie() %></div>
                    </div>
                    
                    
                    
                    <div class="row notes">  
                    <% for(Livre l : c.getLivres()){ %> 
                    
          <!-- Design livre -->

                      <div class="col-sm-4 col-md-2 col-6  notes__item" >
                            <a href="#edit-note" data-toggle="modal" data-target="#modal-small<%=l.getId_livre() %>"  style="background-image:url(./Ressources/images/CouvertureLivre/<%=l.getUrl_couverture()%>);background-repeat: no-repeat; background-position: center center; background-size: 100% 100%; ">

                            <!-- Small -->
                            <div class="modal fade" id="modal-small<%=l.getId_livre() %>" tabindex="-1">
                                <div class="modal-dialog modal-sm">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title pull-left TitreLivre"><%=l.getTitre() %></h5>
                                        </div>
                                        <div class="modal-body">
                                            <%=l.getDescription_livre() %>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-link" data-dismiss="modal">Fermer</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            </a>
                            <div class="notes__actions enregistrer" >
                                 <input type="hidden"  value="<%=l.getId_livre()%>" >
                                 <i class="zmdi zmdi-calendar-check "></i>
                            </div>


                        </div>

                      <% } %> 
                    </div>
  <% } %> 

                </div>
