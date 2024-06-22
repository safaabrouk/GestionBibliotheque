<%@page import="services.ServiceLivre"%>
<%@page import="models.Livre"%>
<% 
 int idLivre = Integer.parseInt(request.getParameter("idLivre"));
Livre l = ServiceLivre.ChercherLivreViaId(idLivre);
 %>  
                              
                <div class="content__inner">

                    <div data-columns>
                        <div class="card">
                            <img class="card-img-top" src="./Ressources/images/CouvertureLivre/<%=l.getUrl_couverture()%>" alt="">
                        </div>
                        <div class="card widget-visitors">
                            <div class="card-body">
                                <h4 class="card-title">Autre détail du livre:</h4>
                            </div>

                            <div class="listview listview--bordered">
                                <div class="listview__item">
                                    <div class="listview__content">
                                        <h4 class="card-title">Titre : </h4>
                                        <h6 style="color: rgba(255,255,255,.7);"><%=l.getTitre()%></h6>
                                    </div>
                                </div>
                                <div class="listview__item">
                                    <div class="listview__content">
                                        <h4 class="card-title">ISBN : </h4>
                                        <p><%=l.getIsbn()%></p>
                                    </div>
                                </div>
                                <div class="listview__item">
                                    <div class="listview__content">
                                        <h4 class="card-title">Catégorie : </h4>
                                        <p><%=l.getCategorie().getNom_categorie()%></p>
                                    </div>
                                </div>
                                <div class="listview__item">
                                    <div class="listview__content">
                                        <h4 class="card-title">Nombre exemplaire : </h4>
                                        <p><%=l.getNbr_exemplaire()%></p>
                                    </div>
                                </div>
                                <div class="listview__item">
                                    <div class="listview__content">
                                        <h4 class="card-title">Auteur : </h4>
                                        <p><%=l.getAuteur()%></p>
                                    </div>
                                </div>
                                <div class="listview__item">
                                    <div class="listview__content">
                                        <h4 class="card-title">Editeur : </h4>
                                        <p><%=l.getEditeur()%></p>
                                    </div>
                                </div>
                                <div class="listview__item">
                                    <div class="listview__content">
                                        <h4 class="card-title">Année d'édition </h4>
                                        <p><%=l.getDate_edition()%></p>
                                    </div>
                                </div>
                                <div class="p-3"></div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Description: </h4>
                                <p><%=l.getDescription_livre()%></p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="toolbar">
                        <div class="toolbar__label">
                          <a href="<%=request.getContextPath()+"/listelivre"%>" class="view-more text-left">Voir Les autres livres du bibliothéque ...</a>
                        </div>
                    </div>

                </div>
