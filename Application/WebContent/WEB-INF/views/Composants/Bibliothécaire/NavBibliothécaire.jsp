<%@page import="models.Personne"%>
 <% 
 Personne pr = (Personne) session.getAttribute("profil");  
 %>
                <div class="scrollbar-inner">

                    <div class="user">
                        <div class="user__info" onclick="location.href='http://localhost:8080/readmore/monprofil';" >
                            <img class="user__img" src="./Ressources/images/Profil/<%=pr.getProfil().getUrl_image()%>" alt="">
                            <div>
                                <div class="user__name"><%= pr.getNom()%> <%= pr.getPrenom()%> </div>
                            </div>
                        </div>
                    </div>

                    <ul class="navigation">
                        <li class="navigation__active"><a href="<%=request.getContextPath()+"/bibliothecaire"%>"><i class="zmdi zmdi-home"></i> Statistiques</a></li>

                        <li class="navigation__sub @@variantsactive">
                            <a href="#"><i class="zmdi zmdi-book"></i> Livre </a>

                            <ul>
                                <li class="@@sidebaractive"><a href="<%=request.getContextPath()+"/ajouterlivre"%>">Ajouter livre</a></li>
                                <li class="@@boxedactive"><a href="<%=request.getContextPath()+"/listelivre"%>">Consulter les livres</a></li>
                            </ul>
                        </li>
                         <li class="@@typeactive">
                            <a href="<%=request.getContextPath()+"/categorie"%>"><i class="zmdi zmdi-format-list-bulleted"></i> Catégorie </a>
                        </li>
                        <li class="@@typeactive">
                            <a href="<%=request.getContextPath()+"/reservations"%>"><i class="zmdi zmdi-pocket"></i> Les réservations</a>
                        </li>
                        <li class="@@typeactive">
                            <a href="<%=request.getContextPath()+"/emprunt"%>"><i class="fas fa-calendar-check"></i> Les emprunts</a>
                        </li>
                        <li class="navigation__sub @@samplepagesactive">
                            <a href="#"><i class="zmdi zmdi-settings"></i> Parametrer profil </a>
                            <ul>
                                <li class="@@profileactive"><a href="<%=request.getContextPath()+"/password"%>">Changer mot de passe</a></li>
                                <li class="@@messagesactive"><a href="<%=request.getContextPath()+"/profil"%>"> Modifier coordonnées</a></li>
                            </ul>
                        </li>
                        
                          <li class="@@typeactive">
                            <a href="<%=request.getContextPath()+"/utilisateurs"%>"><i class="zmdi zmdi-accounts"></i> Gérer utilisateurs</a>
                          </li>


                    </ul>
                </div>
