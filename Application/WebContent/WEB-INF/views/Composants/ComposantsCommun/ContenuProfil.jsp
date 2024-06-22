<%@page import="models.Personne"%>
 <%  
 Personne CoordonneProfil = (Personne) session.getAttribute("profil"); 

 %>
            <div class="content__inner content__inner--sm">
            
                <div class="card profile ">
                
                
                    <div class="profile__img">
                        <img src="./Ressources/images/Profil/<%=CoordonneProfil.getProfil().getUrl_image()%>" alt="">

                        <a href="#" class="zmdi zmdi-camera profile__img__edit" id="photo">
                       
                        </a>
                        <div class="profile__info">
                              <div class="form-group" style="display:none" id="buttonimg" >
                                   <form action="upload" method="post" enctype="multipart/form-data">
                                        <input type="file" name="profil" style="display:none" id="input" multiple >
                                        <button id="saveimg" type="submit"  class="btn btn-light btn-block" > Enregister</button>
                                   </form>
                                   <button id="annulerimg" class="btn btn-light btn-block"> Annuler</button>
                               </div>
                        </div>
                    </div>
                    
                    

                </div>

                <div class="card">
                    <div class="card-body">
                        <div class="row" >
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Nom</label>
                                    <input type="text" id="nomnew" class="form-control" value="<%= CoordonneProfil.getNom() %>">
                                    <i class="form-group__bar"></i>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Prenom</label>
                                    <input type="text" id="prenomnew" class="form-control" value="<%= CoordonneProfil.getPrenom() %>">
                                    <i class="form-group__bar"></i>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Telephone</label>
                                    <input type="text" id="telnew" class="form-control " value="<%= CoordonneProfil.getTel() %>">
                                    <i class="form-group__bar"></i>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Cin</label>
                                    <input id="cinnew" type="text" class="form-control "value="<%= CoordonneProfil.getCin() %>">
                                    <i class="form-group__bar"></i>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label>Email Address</label>
                                    <input id="loginnew" type="email" class="form-control " value="<%= CoordonneProfil.getLogin() %>">
                                    <i class="form-group__bar"></i>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label>Password</label>
                                    <input id="password" type="password" class="form-control " >
                                    <i class="form-group__bar"></i>
                                </div>
                            </div>
                            <div class="col-sm-6" align="center">
                                <div class="form-group">
                                   <button id="save" class="btn btn-light"> Enregister</button>
                                </div>
                            </div>
                            <div class="col-sm-6"  align="center">
                                <div class="form-group">
                                    <button id="annuler" class="btn btn-light"> Annuler </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
