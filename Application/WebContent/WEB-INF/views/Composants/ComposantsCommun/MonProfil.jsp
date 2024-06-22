 <%@page import="tools.Role"%>
<%@page import="models.Personne"%>
 <% 
 
 Personne MyProfil = (Personne) session.getAttribute("profil"); 


 %>           

            <div class="content__inner content__inner--sm">

                <div class="card profile">
                    <div class="profile__img">
                        <img src="./Ressources/images/Profil/<%=MyProfil.getProfil().getUrl_image()%>" alt="">

                    </div>

                    <div class="profile__info">
                        <h3 align="center">  Mes coordonnées : </h3>
                        <hr width="100%">
                        <ul class="icon-list">
                            <li><i class="zmdi zmdi-account-circle"></i> <%=MyProfil.getNom()%>  <%=MyProfil.getPrenom() %> </li>
                            <li><i class="zmdi zmdi-email"></i> <%=MyProfil.getLogin() %>  </li>
                            <li><i class="zmdi zmdi-phone"></i> <%=MyProfil.getTel() %> </li>
                            <li><i class="zmdi zmdi-account-box-mail"></i> <%=MyProfil.getCin() %> </li>
                        </ul>
                    </div>
                </div>

            </div>