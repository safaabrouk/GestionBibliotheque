<%@page import="models.Reservation"%>
<%@page import="models.Personne"%>
<%@page import="models.Utilisateur"%>
<%@page import="services.ServiceReservation"%>
<%@page import="models.Livre"%>
<%@page import="java.util.ArrayList"%>
<% 
 Personne pEnregistrer = (Personne) session.getAttribute("profil"); 
 Utilisateur uti = new Utilisateur(pEnregistrer.getId(), pEnregistrer.getNom(), pEnregistrer.getPrenom(), pEnregistrer.getLogin(), pEnregistrer.getPassword(), pEnregistrer.getCin(), pEnregistrer.getTel());
 ArrayList<Reservation> ListeReservationEN = ServiceReservation.ConsulterEnregistrementsViaIdUtilisateur(uti);
 %>


<div class="content__inner">
                    <header class="content__title">
                        <h1>Liste d'enregistrement</h1>

                        <div class="actions">
                            <a href="#" class="actions__item zmdi zmdi-trending-up"></a>
                            <a href="#" class="actions__item zmdi zmdi-check-all"></a>     
                        </div>
                    </header>

                    <div class="toolbar">
                        

                        <div class="actions">
                            <i class="actions__item zmdi zmdi-search" data-sa-action="toolbar-search-open"></i>
                        </div>

                        <div class="toolbar__search">
                            <input type="text" placeholder="Chercher...">

                            <i class="toolbar__search__close zmdi zmdi-long-arrow-left" data-sa-action="toolbar-search-close"></i>
                        </div>
                    </div>
         
                    <div class="contacts row">
                    <% for(Reservation r :ListeReservationEN){ %>     
                        <div class="col-xl-3 col-lg-3 col-sm-4 col-12">
                            <div class="contacts__item">
                                <a href="#" class="contacts__img">
                                    <img src="./Ressources/images/CouvertureLivre/<%=r.getLivre().getUrl_couverture()%>" alt="">
                                </a>
                                   
                                <div class="contacts__info">
                                    <strong><%=r.getLivre().getTitre()%></strong>
                                    <small><%=r.getDate_reservation()%></small>
                                </div> 
                              <div>
                                <input type="hidden" value=<%=r.getId_reservation()%>>
                                <%if(r.getLivre().getNbr_exemplaire() != 0){%>
                                <button class="contacts__btn reserver">Reserver</button>
                                 <% } %> 
                                <button class="contacts__btn annuler">Annuler</button>
                               </div>
                            </div>
                        </div>
                          <% } %> 
                    </div>
        
                </div>