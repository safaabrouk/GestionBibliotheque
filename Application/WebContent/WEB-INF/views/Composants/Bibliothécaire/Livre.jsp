<%@page import="models.Categorie"%>
<%@page import="services.ServiceCategorie"%>
<%@page import="models.Livre"%>
<%@page import="services.ServiceLivre"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Categorie"%>
<%@page import="services.ServiceCategorie"%>
<%@page import="models.Reservation"%>
<%@page import="services.ServiceReservation"%>
<%@page import="java.util.ArrayList"%>
<% 
ArrayList<Categorie> ListeCategorie = ServiceCategorie.ConsulterCategories();
ArrayList<Livre> ListeLivre = ServiceLivre.ConsulterLivres();
 %>

                <header class="content__title">
                    <h1>Tables des livres</h1>

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
                        <div class="table-responsive">
                            <a  class="actions__item  add-new"  href="<%=request.getContextPath()+"/ajouterlivre"%>">
                                <i class="zmdi zmdi-plus zmdi-hc-lg"></i> 
                            </a>
                            <table id="data-table" class="table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Couverture</th>
                                        <th>Titre</th>
                                        <th>Auteur</th>
                                        <th>Editeur</th>
                                        <th>Date</th>
                                        <th>Isbn</th>
                                        <th>Exemplaire</th>
                                        <th>Categorie</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody id="bodyTable">
                      <% for(Livre l :ListeLivre){ %> 
                                <tr>
                                   <td name="Id"><%=l.getId_livre()%></td>
                                    <td name="Couverture" class="lightbox photos">
                                      <input type="hidden" value="<%=l.getUrl_couverture()%>">
                                      <a href="./Ressources/images/CouvertureLivre/<%=l.getUrl_couverture()%>" class="col-md-2 col-4">
                                        <div class="lightbox__item groups__img">
                                               <img src="./Ressources/images/CouvertureLivre/<%=l.getUrl_couverture()%>" alt="" />
                                        </div>
                                      </a>
                                    </td>                                  
                                    <td name="Titre"><%=l.getTitre()%></td>
                                    <td name="Auteur"><%=l.getAuteur()%></td>
                                    <td name="Editeur"><%=l.getEditeur()%></td>                                    
                                    <td name="Date"><%=l.getDate_edition()%></td>
                                    <td name="Isbn"><%=l.getIsbn()%></td>
                                    <td name="Exemplaire"><%=l.getNbr_exemplaire()%></td>
                                    <td name="Categorie"><%=l.getCategorie().getNom_categorie()%></td>
                                    <input type="hidden" class="form-control " value="<%=l.getDescription_livre()%>">
                                    <td > 
                                        <a class="view test" > 
                                            <i class="zmdi zmdi-eye testt"></i>
                                            <br>
                                        </a>                                 
                                        <a class="edit test" data-toggle="modal" data-target="#modal-small"> 
                                            <i class="zmdi zmdi-edit testt"></i>
                                            <br>
                                        </a>                                            
							            <a class="delete test" >
                                            <i class="zmdi zmdi-delete testt"></i>
                                            <br>
                                        </a>
                                    </td>
                                                                          
                                </tr>
          <% } %> 
          
          
          <div class="modal fade" id="modal-small" data-backdrop="static" tabindex="-1">
								<div class="modal-dialog modal-lg">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title pull-left TitreLivre">Modifier livre : <span id="Title"></span></h5>
										</div>
										<div class="modal-body">
											<input type="hidden">
											<div class="form-group">
												<input type="text" class="form-control " name="TitreModel">
											</div>
											<div class="form-group">
												<input type="text" class="form-control " name="AuteurModel">
											</div>
											<div class="form-group">
												<input type="text" class="form-control " name="EditeurModel">
											</div>
											<div class="form-group">
												<input type="text" class="form-control " name="DateModel">
											</div>
											<div class="form-group">
												<input type="text" class="form-control " name="IsbnModel">
											</div>
											<div class="form-group">
												<input type="text" class="form-control" name="ExemplaireModel">
											</div>
											<div class="form-group select2-parent">
												<select class="select2" id="mySelect">
                                                   <% for(Categorie c :ListeCategorie){ %>
                                                      <option  class="CategorieModel" aria-selected="false" value="<%=c.getId_categorie()%>" ><%=c.getNom_categorie()%></option>
                                                   <% } %> 
                                                </select>
											</div>
											<div class="form-group">
											    <textarea class="form-control " name="DescriptionModel" id="DescriptionModel"></textarea>
											</div>
											<form class="form-group" method="POST" action="#"
												enctype="multipart/form-data">
												<input type="file" class="form-control " name="image">
											</form>
											<input type="hidden" name="ImageModel" >
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-link annuler"
												data-dismiss="modal">Fermer</button>
											<button type="button" class="btn btn-link modifier"
												data-dismiss="modal">Modifier</button>
										</div>
									</div>
								</div>
							</div>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

        