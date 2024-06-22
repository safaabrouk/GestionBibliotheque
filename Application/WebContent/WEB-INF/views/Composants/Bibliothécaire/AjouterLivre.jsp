<%@page import="models.Categorie"%>
<%@page import="services.ServiceCategorie"%>
<%@page import="java.util.ArrayList"%>
<% 
ArrayList<Categorie> ListeCategorie = ServiceCategorie.ConsulterCategories();
 %> 


<div class="content__inner">
                <div class="card">
                    <div class="card-body">
                        <h3 class="card-body__title">Ajouter un nouveau livre</h3>
                        <br>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Titre du livre</label>
                                    <input type="text" class="form-control " id="titre" >
                                    <i class="form-group__bar"></i>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Code ISBN</label>
                                    <input type="text" class="form-control " id="isbn" >
                                    <i class="form-group__bar"></i>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Auteur </label>
                                    <input type="text" class="form-control " id="auteur" >
                                    <i class="form-group__bar"></i>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Editeur</label>
                                    <input type="text" class="form-control " id="editeur" >
                                    <i class="form-group__bar"></i>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label> Description </label>
                                    <input type="text" class="form-control " id="desc" >
                                    <i class="form-group__bar"></i>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Date d'édition</label>
                                    <input type="text" class="form-control " id="date" >
                                    <i class="form-group__bar"></i>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Nombre d'exemlaire</label>
                                    <input type="text" class="form-control " id="nbr" >
                                    <i class="form-group__bar"></i>
                                </div>
                            </div>
                            <div class="col-sm-6 ">
                                <div class="form-group">
                                    <label>Catégorie</label>

                                    <select id="select" class="select2">
                                     <% for(Categorie c :ListeCategorie){ %> 
                                        <option value="<%=c.getId_categorie()%>"><%=c.getNom_categorie()%></option>
                                         <% } %> 

                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <form class="form-group" method="POST" action="#" enctype="multipart/form-data" id="form">
                                    <label>Couverture du livre</label>
                                    <input type="file" class="form-control " name="image">
                                </form>
                            </div>
                            <div class="col-sm-12" align="right">
                                   <br>
                                   <button class="btn btn-light" id="submit">Enregistrer</button>
                                   <button class="btn btn-light" id="annuler">Annuler</button>
                            </div>

                        </div>
    
                    </div>  
                </div>
        	</div>