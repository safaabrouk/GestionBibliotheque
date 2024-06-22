<%@page import="models.Reservation"%>
<%@page import="services.ServiceReservation"%>
<%@page import="java.util.ArrayList"%>
<% 
int idReservation = Integer.parseInt(request.getParameter("idReservation"));
Reservation l = ServiceReservation.ChercherReservationViaId(idReservation);

 %>
 
                 <div class="content__inner">
                 
                    <div class="toolbar">
                        <div class="toolbar__label">
                          Les informations du livre réservé : 
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
                    
                 
	                 <div class="card profile">
	                    <div class="profile__img">
	                        <img src="./Ressources/images/Profil/<%=l.getUtilisateur().getProfil().getUrl_image()%>" alt="">
	
	                    </div>
	
	                    <div class="profile__info">
	                        <h3 align="center">  Les coordonnées d'emprunteur : </h3>
	                        <hr width="100%">
	                        <ul class="icon-list">
	                            <li><i class="zmdi zmdi-account-circle"></i> <%=l.getUtilisateur().getNom()%>  <%=l.getUtilisateur().getPrenom() %> </li>
	                            <li><i class="zmdi zmdi-email"></i> <%=l.getUtilisateur().getLogin() %>  </li>
	                            <li><i class="zmdi zmdi-phone"></i> <%=l.getUtilisateur().getTel() %> </li>
	                            <li><i class="zmdi zmdi-account-box-mail"></i> <%=l.getUtilisateur().getCin() %> </li>
	                        </ul>
	                    </div>
	                </div>
                    
                    
                    <div class="toolbar">
                        <div class="toolbar__label">
                          <a href="<%=request.getContextPath()+"/reservations"%>" class="view-more text-left">Voir Les autres réservation à valider ...</a>
                        </div>
                    </div>

                </div>