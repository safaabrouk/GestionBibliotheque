<%@page import="models.Personne"%>
 <% 
 Personne pr = (Personne) session.getAttribute("profil");  
 %>
       
	<!-- D�but du Nav --> 
	
                <div class="scrollbar-inner">

                    <div class="user">
                        <div class="user__info" onclick="location.href='http://localhost:8080/readmore/monprofil';">
                            <img class="user__img" src="./Ressources/images/Profil/<%=pr.getProfil().getUrl_image()%>" alt="">
                            <div>
                                <div class="user__name"> <%=pr.getNom() %> <%=pr.getPrenom() %> </div>
                            </div>
                        </div>
                    </div>

                    <ul class="navigation">
                        <li class="navigation__active"><a href="#"><i class="zmdi zmdi-home"></i> Home</a></li>
                         <li class="navigation__sub @@variantsactive">
                            <a href="#"><i class="zmdi zmdi-accounts"></i> G�rer biblioth�caires </a>

                            <ul>
                                <li class="@@sidebaractive"><a href="<%=request.getContextPath()+"/ajouterbibliothecaire"%>">Nouveau biblioth�caires</a></li>
                                <li class="@@boxedactive"><a href="<%=request.getContextPath()+"/bibliothecaires"%>">Listes biblioth�caires</a></li>
                            </ul>
                        </li>
                        <li class="navigation__sub @@samplepagesactive">
                            <a href="#"><i class="zmdi zmdi-settings"></i> Parametrer profil </a>
                            <ul>
                                <li class="@@profileactive"><a href="<%=request.getContextPath()+"/password"%>">Changer mot de passe</a></li>
                                <li class="@@messagesactive"><a href="<%=request.getContextPath()+"/profil"%>">Modifier coordonn�es</a></li>
                            </ul>
                        </li>
                        <li class="@@typeactive">
                            <a href="#"><i class="zmdi zmdi-settings"></i> Parametrer system</a>
                        </li>

                    </ul>
                </div>

		<!-- fin du Nav --> 