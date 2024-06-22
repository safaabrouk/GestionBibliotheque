            <div class="content__inner ">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Changer mot de passe</h4>
                        <div class="form-group">
                            <input type="password" id="password" class="form-control " placeholder="Ancienne mot de passe" >
                            <i class="form-group__bar"></i>
                        </div>
                        <div class="form-group" id="PasswordInvalide" style="display:none">
                            <p style="color:#ef767b;" align="center"> mot de passe incorrect </p>
                        </div>
                        <div class="form-group">
                            <input type="password" id="passChange1" class="form-control " placeholder="Nouveau mot de passe" >
                            <i class="form-group__bar"></i>
                        </div>
                        <div class="form-group">
                            <input type="password" id="passChange2" class="form-control " placeholder="Confirmer votre mot de passe" >
                            <i class="form-group__bar"></i>
                        </div>
                        <div class="form-group" id="PasswordNonIdentique" style="display:none">
                            <p style="color:#ef767b;" align="center"> les nouveaux mot de passe ne sont pas identiques </p>
                        </div>
                        
                        <br>
                        <div class="form-group">
                            <button id="savepassword" class="btn btn-light btn-block" > Enregistrer </button>
                        </div>
            
                    </div>
                </div>
            </div>