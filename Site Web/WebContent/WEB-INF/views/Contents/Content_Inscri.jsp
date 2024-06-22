<div class=" container right-panel-active" id="container">
	<div class=" form-container sign-up-container">
			<div class="form">
				<br>
				<h2>Crèer votre compte</h2>
				<div class="social-container">
					<a href="#" class="social facebook"><i class="fab fa-facebook-f"></i></a>
					<a href="#" class="social google  "><i class="fab fa-google-plus-g"></i></a>
					<a href="#" class="social linkedin"><i class="fab fa-linkedin-in"></i></a>
				</div>
				<span>ou utilisez vos coordonnées </span>
				<input type="text" id="nomInscr" name="nomIscr" placeholder="Nom" />
				<input type="text" id="prenomIscr" name="prenomIscr" placeholder="Prenom" />
				<input type="email" id="loginIscr" name="loginIscr" placeholder="Email" />
				<p class="erreur" id ="emailErreur"> Votre email déja existe </p>
				<input type="password" id="passwordIscr" name="passwordIscr" placeholder="Password (Au moins 10 caractéres)" />
				<input type="text" id="cinIscr" name="cinIscr" placeholder="Cin" />
				<input type="tel" id="phoneIscr" name="phoneIscr" placeholder="Tele" />
				<button id="inscription" >s'inscrire</button>
			</div>
		</div>
		<div class=" form-container sign-in-container" >
			<div class="form">
				<br><br><br>
				<h1> Connectez vous !</h1>
				<div class="social-container">
					<a href="#" class="social facebook"><i class="fab fa-facebook-f"></i></a>
					<a href="#" class="social google  "><i class="fab fa-google-plus-g"></i></a>
					<a href="#" class="social linkedin"><i class="fab fa-linkedin-in"></i></a>
				</div>
				<span>ou utilisez votre compte</span>
				<input type="email" id="email"  placeholder="Email" />
				<p class="erreur" id="l"> Votre email n'existe pas </p>
				<input type="password" id="password" placeholder="Password" />
				<p class="erreur" id="p"> Mot de passe incorrect </p>
				<button id="authetification">se connecter</button>
				<a href="#" id="mdpOublie">Mot de passe oublié?</a>
				
	            
			</div>
		</div>
		<div class="overlay-container">
			<div class="overlay">
				<div class="citation2 overlay-panel overlay-left">
					<h1>Bienvenue!</h1>
					<p>Pour acceder à notre bibliothèque , veuillez vous insérer vos informations personnelles</p>
					<button class="ghost" id="signIn">se connecter</button>
				</div>
				<div class="citation1 overlay-panel overlay-right">
					<h1>lire c'est rêver les yeux ouverts!</h1>
					<p>Entrez vos coordonnées et commencez votre rêve avec nous</p>
					<button class="ghost" id="signUp">S'inscrire</button>
				</div>
			</div>
	</div>
 </div>
 
 <!-- Forgat Password -->
 
 <div class="login-dark" id="retrouver">
	<div  class="form2">
		<div class="illustration">
			<i class="icon ion-ios-locked-outline"></i>
		</div>
		<div class="form-group" align="center">
			<p> Retrouvez votre compte </p>
		</div>
		<div class="form-group">
			<input class="form-control" type="email" name="email" id="emailCherche" placeholder="Saisir votre email">
		    <p id="emailChercherNonValide" class="PNonValide"> Votre email invalide</p>
		</div>		
		<div class="form-group" align="center">
			<br>
			<button id="chercher" >Chercher</button>
		</div>
		<a class="forgot" id ="revenir" href="#">Annuler et revenir à la page d'inscription. </a>
	</div>
</div>

<div class="login-dark" id="selectioner">
	<div  class="form2">
		<div class="illustration">
			<i class="icon ion-ios-locked-outline"></i>
		</div>
		<div class="form-group">
			<p class="textForgot" > Comment voulez-vous recevoir votre code de réinitialisation du mot de passe ? </p>
		</div>
		<div class="check">
			<input type="radio" name="choix" value="email" id="choix1" checked="checked"> 
			<label> Adresse email </label> 
		</div>
		<div class="check">
			<input type="radio" name="choix" value="tel" id="choix2">
			<label> Numero de Tél </label>
		</div>		
		<div class="form-group" align="center">
			<br>
			<button id="continuer" >Continuer</button>
		</div>	
		<a class="forgot" id ="revenir1" href="#">Annuler et revenir à la page d'inscription. </a>
	</div>
</div>

<div class="login-dark" id="recevoirCode">
	<div  class="form2">
		<div class="illustration">
			<i class="icon ion-ios-locked-outline"></i>
		</div>
		<div class="form-group" align="center">
			<p class="textForgot"> 
				Merci de saisir le code de sécurité que vous avez reçu.
			</p>
		</div>
		<div class="form-group">
			<input class="form-control"  name="codeRecu" id="codeRecu" placeholder="Entrer le code">
		    <p id="codeNonValide" class="PNonValide"> Votre code invalide</p>
		</div>		
		<div class="form-group" align="center">
			<br>
			<button id="continuer2" >Continuer</button>
		</div>
		<a class="forgot" id ="revenir2" href="#">Annuler et revenir à la page d'inscription. </a>
	</div>
</div>
<div class="login-dark" id="changerMotdePasse">
	<div  class="form2">
		<div class="illustration">
			<i class="icon ion-ios-locked-outline"></i>
		</div>
		<div class="form-group" align="center">
			<p class="textForgot"> 
				Merci de saisir votre nouveau mot de passe.
			</p>
		</div>
		<div class="form-group">
			<input class="form-control" type="password" name="passChange" id="passChange1" placeholder="Password (Au moins 10 caractéres)">
		</div>
		<br>
		<div class="form-group">
			<input class="form-control" type="password" name="passChange" id="passChange2" placeholder="Confirmer votre mot de passe">
		</div>
		<br>	
		<p id="PasswordInvalide" class="PNonValide"> Ne sont pas identique! </p>	
		<div class="form-group" align="center">
			<br>
			<button id="validerChangement" >Continuer</button>
		</div>
		<a class="forgot" id ="revenir3" href="#">Annuler et revenir à la page d'inscription. </a>
	</div>
</div>