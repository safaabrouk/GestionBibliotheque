<%@page import="models.Personne"%>
 <% 
 Personne prHeader = (Personne) session.getAttribute("profil");  
 %>
                <div class="navigation-trigger" data-sa-action="aside-open" data-sa-target=".sidebar">
                    <i class="zmdi zmdi-menu"></i>
                </div>

                <div class="logo hidden-sm-down">
                <h1>
					 <%  if( prHeader.getRole().equals(Role.utilisateur)){%>	
					  <a href="<%=request.getContextPath()+"/utilisateur"%>">
		                   <i class="zmdi zmdi-library zmdi-hc-lg"></i>
		                   <span > ReadMore  </span>
	                  </a>
					<%} else if( prHeader.getRole().equals(Role.bibliothecaire)) {  %>
			          <a href="<%=request.getContextPath()+"/bibliothecaire"%>">
		                   <i class="zmdi zmdi-library zmdi-hc-lg"></i>
		                   <span> ReadMore  </span>
	                  </a>
						
					<%} else{%>	
					  <a href="<%=request.getContextPath()+"/admin"%>">
		                   <i class="zmdi zmdi-library zmdi-hc-lg"></i>
		                   <span > ReadMore  </span>
	                  </a>
						
					  
					<% } %>
                </h1>
                </div>

                <form class="search">
                    <div class="search__inner">
                        <input type="text" class="search__text" placeholder="Search for people, files, documents...">
                        <i class="zmdi zmdi-search search__helper" data-sa-action="search-close"></i>
                    </div>
                </form>

                <ul class="top-nav">
                    <li class="hidden-xl-up"><a href="#" data-sa-action="search-open"><i class="zmdi zmdi-search"></i></a></li>

	               <li class="dropdown">
	                    <a href="#" data-toggle="dropdown" class="top-nav__notify">
	                      <i class="zmdi zmdi-email"></i>
	                    </a>
	                    <div class="dropdown-menu dropdown-menu-right dropdown-menu--block">
	                        <div class="dropdown-header">
	                            Messages
	
	                            <div class="actions">
	                                <a href="#" class="actions__item zmdi zmdi-plus"></a>
	                            </div>
	                        </div>
	
	                        <div class="listview listview--hover">
	                                     
	                            <%@include file="../Composants/ComposantsCommun/MessageNotification.jsp" %>
	                                   
	
	                            <a href="#" class="view-more">Voir tous les messages</a>
	                        </div>
	                    </div>
	               </li>

	              <li class="dropdown top-nav__notifications">
	                    <a href="#" data-toggle="dropdown" class="top-nav__notify">
	                        <i class="zmdi zmdi-notifications"></i>
	                    </a>
	                    <div class="dropdown-menu dropdown-menu-right dropdown-menu--block">
	                        <div class="dropdown-header">
	                            Notifications
	
	                            <div class="actions">
	                                <a href="#" class="actions__item zmdi zmdi-check-all" data-sa-action="notifications-clear"></a>
	                            </div>
	                        </div>
	
	                        <div class="listview listview--hover">
	                            <div class="listview__scroll scrollbar-inner">
	                            <%@include file="../Composants/ComposantsCommun/Notification.jsp" %>
	                            </div>
	
	                            <div class="p-1"></div>
	                        </div>
	                    </div>
	                </li>

	               <li class="dropdown hidden-xs-down">
	                    <a href="#" data-toggle="dropdown"><i class="zmdi zmdi-apps"></i></a>
	
	                    <div class="dropdown-menu dropdown-menu-right dropdown-menu--block" role="menu">
	                        <div class="row app-shortcuts">
	                            <a class="col-4 app-shortcuts__item" href="<%=request.getContextPath()+"/monprofil"%>">
	                                <i class="zmdi zmdi-account"></i>
	                                <small class="">Mon Profil</small>
	                            </a>
	                            <a class="col-4 app-shortcuts__item" href="#">
	                                <i class="zmdi zmdi-help-outline"></i>
	                                <small class="">Aide et assistance</small>
	                            </a>
	                            <a class="col-4 app-shortcuts__item" href="<%=request.getContextPath()+"/deconection"%>">
	                                <i class="fas fa-sign-out-alt"></i>
	                                <small class="">Deconnexion</small>
	                            </a>
	                        </div>
	                    </div>
	                </li>

                    <li class="dropdown hidden-xs-down">
                        <a href="#" data-toggle="dropdown"><i class="zmdi zmdi-more-vert"></i></a>

                        <div class="dropdown-menu dropdown-menu-right">
                            <div class="dropdown-item theme-switch">
                                Theme Switch

                                <div class="btn-group btn-group--colors mt-2 d-block" data-toggle="buttons">
                                    <label class="btn active border-0" style="background-color: #772036"><input type="radio" value="1" autocomplete="off" checked></label>
                                    <label class="btn border-0" style="background-color: #273C5B"><input type="radio" value="2" autocomplete="off"></label>
                                    <label class="btn border-0" style="background-color: #174042"><input type="radio" value="3" autocomplete="off"></label>
                                    <label class="btn border-0" style="background-color: #383844"><input type="radio" value="4" autocomplete="off"></label>
                                    <label class="btn border-0" style="background-color: #49423F"><input type="radio" value="5" autocomplete="off"></label>

                                    <br>

                                    <label class="btn border-0" style="background-color: #5e3d22"><input type="radio" value="6" autocomplete="off"></label>
                                    <label class="btn border-0" style="background-color: #234d6d"><input type="radio" value="7" autocomplete="off"></label>
                                    <label class="btn border-0" style="background-color: #3b5e5e"><input type="radio" value="8" autocomplete="off"></label>
                                    <label class="btn border-0" style="background-color: #0a4c3e"><input type="radio" value="9" autocomplete="off"></label>
                                    <label class="btn border-0" style="background-color: #7b3d54"><input type="radio" value="10" autocomplete="off"></label>
                                </div>
                            </div>
                            <a href="#" class="dropdown-item" data-sa-action="fullscreen">Fullscreen</a>
                            <a href="#" class="dropdown-item">Clear Local Storage</a>
                        </div>
                    </li>
                </ul>

                <div class="clock hidden-md-down">
                    <div class="time">
                        <span class="hours"></span>
                        <span class="min"></span>
                        <span class="sec"></span>
                    </div>
                </div>
            