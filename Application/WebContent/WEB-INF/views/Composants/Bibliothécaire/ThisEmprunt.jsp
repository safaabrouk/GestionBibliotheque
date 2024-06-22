<%@page import="services.ServiceReservation"%>
<%@page import="models.Reservation"%>
<%@page import="models.Emprunt"%>
<%@page import="services.ServiceEmprunt"%>
<%@page import="java.util.ArrayList"%>
<% 
int idEmprunt = Integer.parseInt(request.getParameter("idEmprunt"));
Emprunt l = ServiceEmprunt.ChercherEmpruntViaId(idEmprunt);

 %>
 
                 <div class="content__inner">
                 
                    <div class="toolbar">
                        <div class="toolbar__label">
                          Les informations du livre emprunté : 
                        </div>
                    </div>

                    <div data-columns>
                        <div class="card">
                            <img class="card-img-top" src="./Ressources/images/CouvertureLivre/<%=l.getLivre().getUrl_couverture()%>" alt="">
                        </div>
                        <div class="card widget-visitors">
                            <div class="listview listview--bordered">
                                <div class="listview__item">
                                    <div class="listview__content">
                                        <h4 class="card-title">Titre : </h4>
                                        <h6 style="color: rgba(255,255,255,.7);"><%=l.getLivre().getTitre()%></h6>
                                    </div>
                                </div>
                                <div class="listview__item">
                                    <div class="listview__content">
                                        <h4 class="card-title">ISBN : </h4>
                                        <p><%=l.getLivre().getIsbn()%></p>
                                    </div>
                                </div>
                                <div class="listview__item">
                                    <div class="listview__content">
                                        <h4 class="card-title">Catégorie : </h4>
                                        <p><%=l.getLivre().getCategorie().getNom_categorie()%></p>
                                    </div>
                                </div>
                                <div class="listview__item">
                                    <div class="listview__content">
                                        <h4 class="card-title">Nombre exemplaire : </h4>
                                        <p><%=l.getLivre().getNbr_exemplaire()%></p>
                                    </div>
                                </div>
                                <div class="listview__item">
                                    <div class="listview__content">
                                        <h4 class="card-title">Auteur : </h4>
                                        <p><%=l.getLivre().getAuteur()%></p>
                                    </div>
                                </div>
                                <div class="listview__item">
                                    <div class="listview__content">
                                        <h4 class="card-title">Editeur : </h4>
                                        <p><%=l.getLivre().getEditeur()%></p>
                                    </div>
                                </div>
                                <div class="listview__item">
                                    <div class="listview__content">
                                        <h4 class="card-title">Année d'édition </h4>
                                        <p><%=l.getLivre().getDate_edition()%></p>
                                    </div>
                                </div>
                                <div class="p-3"></div>
                            </div>
                        </div>

                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Description: </h4>
                                <p><%=l.getLivre().getDescription_livre()%></p>
                            </div>
                        </div>

                    </div>
                      <% 
                    	  Reservation r = ServiceReservation.ChercherReservationViaEmprunt(l.getLivre().getId_livre(),l.getNumero_exemplaire());
                      %>
                 
	                 <div class="card profile">
	                    <div class="profile__img">
	                        <img src="./Ressources/images/Profil/<%=r.getUtilisateur().getProfil().getUrl_image()%>" alt="">
	
	                    </div>
	
	                    <div class="profile__info">
	                        <h3 align="center">  Les coordonnées d'emprunteur : </h3>
	                        <hr width="100%">
	                        <ul class="icon-list">
	                            <li><i class="zmdi zmdi-account-circle"></i> <%=r.getUtilisateur().getNom()%>  <%=r.getUtilisateur().getPrenom() %> </li>
	                            <li><i class="zmdi zmdi-email"></i> <%=r.getUtilisateur().getLogin() %>  </li>
	                            <li><i class="zmdi zmdi-phone"></i> <%=r.getUtilisateur().getTel() %> </li>
	                            <li><i class="zmdi zmdi-account-box-mail"></i> <%=r.getUtilisateur().getCin() %> </li>
	                        </ul>
	                    </div>
	                </div>
	                
	                <div class="card profile">
	                    <div class="profile__img">
	                        <img src="./Ressources/images/Profil/<%=l.getBibliothecaire().getProfil().getUrl_image()%>" alt="">
	
	                    </div>
	
	                    <div class="profile__info">
	                        <h3 align="center">  Cette emprunt valider par : </h3>
	                        <hr width="100%">
	                        <ul class="icon-list">
	                            <li><i class="zmdi zmdi-account-circle"></i> <%=l.getBibliothecaire().getNom()%>  <%=r.getUtilisateur().getPrenom() %> </li>
	                            <li><i class="zmdi zmdi-email"></i> <%=l.getBibliothecaire().getLogin() %>  </li>
	                            <li><i class="zmdi zmdi-phone"></i> <%=l.getBibliothecaire().getTel() %> </li>
	                            <li><i class="zmdi zmdi-account-box-mail"></i> <%=l.getBibliothecaire().getCin() %> </li>
	                        </ul>
	                    </div>
	                </div>
                    
                    
                    <div class="toolbar">
                        <div class="toolbar__label">
                          <a href="<%=request.getContextPath()+"/emprunt"%>" class="view-more text-left">Voir Les autres emprunts ...</a>
                        </div>
                    </div>

                </div>