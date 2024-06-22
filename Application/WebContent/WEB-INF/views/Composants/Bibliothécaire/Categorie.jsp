<%@page import="models.Categorie"%>
<%@page import="services.ServiceCategorie"%>
<%@page import="models.Livre"%>
<%@page import="java.util.ArrayList"%>
<% 
ArrayList<Categorie> ListeCategorie = ServiceCategorie.ConsulterCategories();
 %> 
                <header class="content__title">
                    <h1>Tables des catégories</h1>

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

                            <a  class="actions__item  add-new" data-toggle="modal" data-target="#modal-large">
                                <i class="zmdi zmdi-plus zmdi-hc-lg"></i> 
                            </a>

                            <!-- Large -->
                            <div class="modal fade" id="modal-large" data-backdrop="static" tabindex="-1">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title pull-left">Ajouter nouvelle catégorie</h5>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <input type="text"  class="form-control " placeholder="nom catégorie ">
                                            </div>
                                            <div class="form-group">
                                                <input type="text"  class="form-control " placeholder="Description catégorie">
                                            </div>
                                            <form class="form-group" method="POST" action="#" enctype="multipart/form-data">
                                                 <input type="file" class="form-control " name="image">
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-link save" data-dismiss="modal">Enregistrer</button>
                                            <button type="button" class="btn btn-link" data-dismiss="modal">Annuler</button>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <table id="data-table" class="table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Nom catégorie</th>
                                        <th>Description</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody id="bodyTable">
          <% for(Categorie c :ListeCategorie){ %> 
                                <tr>
                                    <td><%=c.getId_categorie()%></td>
                                    <td><%=c.getNom_categorie()%></td>
                                    <td><%=c.getDescription_categorie()%></td>
                                    <td>
                                        <a class="edit" data-toggle="modal" data-target="#modal-small<%=c.getId_categorie()%>"> 
                                            <i class="zmdi zmdi-edit"></i>
                                        </a>                                            
                                        <!-- Small -->
                                        <div class="modal fade" id="modal-small<%=c.getId_categorie()%>" data-backdrop="static" tabindex="-1">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title pull-left TitreLivre">Modifier categorie</h5>
                                                    </div>
                                                    <div class="modal-body">
                                                        <input type="hidden" value="<%=c.getId_categorie()%>" >
                                                        <div class="form-group">
                                                            <input type="text"  class="form-control " value="<%=c.getNom_categorie()%>">
                                                        </div>
                                                        <div class="form-group">
                                                            <input type="text"  class="form-control " value="<%=c.getDescription_categorie()%>" >
                                                        </div>
                                                        <form class="form-group" method="POST" action="#" enctype="multipart/form-data">
                                                                 <input type="file" class="form-control " name="image">
                                                        </form>
                                                        <input type="hidden" value="<%=c.getUrl_couverture()%>" >
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-link annuler" data-dismiss="modal">Fermer</button>
                                                        <button type="button" class="btn btn-link modifier" data-dismiss="modal">Modifier</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <a class="delete" >
                                            <input type="hidden" value="<%=c.getLivres().size()%>">
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

        