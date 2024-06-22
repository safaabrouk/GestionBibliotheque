<%@page import="models.Personne"%>
 <% 
 Personne pr = (Personne) session.getAttribute("profil");  
 %>
		<!-- Début du Nav --> 
	
                <div class="scrollbar-inner">

                    <div class="user">
                        <div class="user__info" onclick="location.href='http://localhost:8080/readmore/monprofil';">
                            <img class="user__img" src="./Ressources/images/Profil/<%=pr.getProfil().getUrl_image()%>" alt="">
                            <div>
                                <div class="user__name"><%= pr.getNom()%> <%= pr.getPrenom()%></div>
                            </div>
                        </div>
                    </div>

                    <ul class="navigation">
                        <li class="navigation__active"><a href="<%=request.getContextPath()+"/utilisateur"%>"><i class="zmdi zmdi-home"></i> Acceuil</a></li>

                        <li class="@@typeactive">
                            <a href="<%=request.getContextPath()+"/livre"%>"><i class="zmdi zmdi-book"></i> liste Livres </a>

                        </li>
                        <li class="@@typeactive">
                            <a href="<%=request.getContextPath()+"/enregistrement"%>"><i class="zmdi zmdi-bookmark"></i> Mes enregitrements </a>
                        </li>
                        <li class="navigation__sub @@tableactive">
                            <a href="#"><i class="fas fa-calendar-check"></i> Réservation</a>

                            <ul>
                               
                                <li class="@@datatableactive"><a href="<%=request.getContextPath()+"/reservation"%>">Mes réservations</a></li>
                                <li class="@@normaltableactive"><a href="<%=request.getContextPath()+"/verification"%>">Vérifier réservation</a></li>
                                
                            </ul>
                        </li>
                        <li class="navigation__sub @@samplepagesactive">
                            <a href="#"><i class="zmdi zmdi-settings"></i> Parametrer profil </a>
                            <ul>
                                <li class="@@profileactive"><a href="<%=request.getContextPath()+"/password"%>">Changer mot de passe</a></li>
                                <li class="@@messagesactive"><a href="<%=request.getContextPath()+"/profil"%>">Modifier coordonnées</a></li>
                            </ul>
                        </li>

                    </ul>
                </div>

		<!-- fin du Nav --> 