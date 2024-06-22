<%@page import="com.sun.mail.handlers.message_rfc822"%>
<%@page import="services.ServiceMessage"%>
<%@page import="services.ServicePersonne"%>
<%@page import="models.Message"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tools.Role"%>
<%@page import="models.Personne"%>
 <% 
 Personne MyProf2 = (Personne) session.getAttribute("profil"); 
 ArrayList<Message> listesMessages = ServiceMessage.ConsulterMessagesSansDuplication(MyProf2.getId());
 int id = Integer.parseInt(request.getParameter("id"));
 ArrayList<Message> conv = ServiceMessage.ConsulterMessagesParUtilisateur(id, MyProf2.getId());
 %>  

            <div class="content__inner">
                <header class="content__title">
                    <h1> Mes messages</h1>
                </header>

                <div class="messages">
                    <div class="messages__sidebar">
                        <div class="toolbar toolbar--inner mb-3">
                            <div class="toolbar__label"><%=MyProf2.getNom() %> <%=MyProf2.getPrenom() %></div>

                            <div class="actions toolbar__actions">
                                <a href="<%=request.getContextPath()+"/nouveaumessage"%>" class="actions__item zmdi zmdi-plus"></a>
                            </div>
                        </div>

                        <div class="messages__search">
                            <div class="form-group">
                                <input type="text" id="InputChercherAmi" class="form-control" placeholder="Chercher..."  onkeyup="Chercher()">
                                <i class="form-group__bar"></i>
                            </div>
                        </div>

                        <div class="listview listview--hover">
                       <%for(int i=0;i<listesMessages.size();i++){ %>        
                       
                            <a class="listview__item MesMessage" href="#">
                               <input class="id_envoyer" name="id_envoyer" type="hidden" value="<%=listesMessages.get(i).getPersonne_envoyer().getId() %>">
                                <img src="./Ressources/images/Profil/<%=listesMessages.get(i).getPersonne_envoyer().getProfil().getUrl_image()%>" alt="" class="listview__img">
                                <div class="listview__content">
                                    <div class="listview__heading NomPrenom">
                                     <%=listesMessages.get(i).getPersonne_envoyer().getNom() %> <%=listesMessages.get(i).getPersonne_envoyer().getPrenom() %>
                                     </div>
                                   <%if(listesMessages.get(i).getEtat_message() == -1){ %>
						            <B>  <%=listesMessages.get(i).getSujet_message() %> </B>
						            <% }
						            else { %>
						            <p> <%=listesMessages.get(i).getSujet_message() %></p>
						            <%} %>
						                                
						         </div>
                            </a>
                       <% }%>    
  
                        </div>
                    </div>

                    <div class="messages__body">
                    
                           <%for(Message m : listesMessages ){ 
                        	if(m.getPersonne_envoyer().getId()== id){ %>                 
                        <div class="messages__header">
                            <div class="toolbar toolbar--inner mb-0">
                                <input id="IdEnvoyer" name="IdEnvoyer" type="hidden" value="<%=m.getPersonne_envoyer().getId() %>">
                                <div class="toolbar__label"> <%=m.getPersonne_envoyer().getNom() %> <%=m.getPersonne_envoyer().getPrenom() %> </div>
                                <div class="toolbar__search">
                                    <input type="text" placeholder="Chercher...">
                                    <i class="toolbar__search__close zmdi zmdi-long-arrow-left" data-sa-action="toolbar-search-close"></i>
                                </div>
                            </div>
                        </div>
                        <%}} %>
                        <div class="messages__content" id="AjouterDiv">
                        
                        <%for(Message m : conv ){ 
                        	if(m.getPersonne_envoyer().getId()== MyProf2.getId()){ %>
                             <div class="messages__item messages__item--right">
                                <div class="messages__details">
                                    <p> 
                                    <i style="color:blue;"> Sujet : <%=m.getSujet_message() %></i>
                                     <br> 
                                     <%=m.getContenu_message()%> 
                                     </p>
                                    <small><i class="zmdi zmdi-time"></i><%=m.getDate_envoie()%> </small>
                                </div>
                            </div>
                            <%}else{ %>
                             <div class="messages__item">
                                <img src="./Ressources/images/Profil/<%=m.getPersonne_envoyer().getProfil().getUrl_image()%>" class="messages__avatar" alt="">

                                <div class="messages__details">
                                    <p>  <i style="color:#ef767b;"> Sujet : <%=m.getSujet_message() %></i>
                                     <br>
                                      <%=m.getContenu_message()%> </p>
                                    <small><i class="zmdi zmdi-time"></i><%=m.getDate_envoie()%> </small>
                                </div>
                            </div>
                         <%}}%>
                      </div>

                        <div class="messages__reply">
                            <textarea class="messages__reply__text" placeholder="Typer votre sujet ..." id="VotreSujet"></textarea>
                              <textarea class="messages__reply__text" placeholder="Typer votre message..." id="VotreContent"></textarea>
                            
                            <i class="zmdi zmdi-mail-send zmdi-hc-2x"  id="sendMsg"  style="cursor: pointer; float:right;"  onclick="EnvoyerMessage()"> </i>
                           <br>
                        </div>
                    </div>
                    
                    
                </div>
            </div>