/*----------------------------- Début Validation D'inscription  -----------------------------------*/
/*------------------------------------- validateName ----------------------------------------------*/

var ChoixSelect;
var MyData;
var emailCharcher;

function validateNom() {
 	const name     =  document.getElementById("nomInscr"); 
    const re = /^[a-zA-Z]{2,10}$/;
    var resultat ;

    if(!re.test(name.value)){
    name.style.borderBottom = "1px solid  #ef767b";
    resultat = false ;
    } else {
     
    name.style.borderBottom = "1px solid  #a5948d";
     resultat = true; 
    }
    return resultat;
  }

 /*------------------------------------- validatePrenom ----------------------------------------------*/ 

 function validatePrenom() {
    const prenom   =  document.getElementById('prenomIscr');
    const ree = /^[a-zA-Z]{2,10}$/;
    var resultat ;

    if(!ree.test(prenom.value)){  

        prenom.style.borderBottom = "1px solid  #ef767b";
         resultat = false ; 
    
    } else {
      
        prenom.style.borderBottom = "1px solid  #a5948d";
         resultat = true ; 
    }
    return  resultat ; 
  }

 /*------------------------------------- validateEmail ----------------------------------------------*/ 

function validateEmail() {
  const email = document.getElementById('loginIscr');
  var resultat ;
 
  if((user_name(email.value) == true) && (arobace(email.value) == 1) && (alternative(email.value) == true) && (extension(email.value) == true)){

     email.style.borderBottom = "1px solid  #a5948d";
      resultat = true ; 

  } else {
            
    email.style.borderBottom = "1px solid  #ef767b";
     resultat = false ; 
  }

   return resultat; 
}

 function user_name(login){
 	/*L'adresse email il faut commancer par unr lettre*/


var unaa=login.split("@")[0];
var us= unaa.split(".")[0];
var ret;
if ((us[0]>='a' && login[0]<='z') || (us[0]>='A' && login[0]<='Z')  ) {
    ret=true;} 

  return ret;

}

function arobace(login){
	/*l'adresse email doit contient une seule @ */
 var aro = login.split("@").length-1;
return aro; 

}

function alternative(login){
	/* l'adresse doit avoir comme alternative yahoo ou outlook ou hotmail ou bien gmail*/
	var tab=["yahoo","outlook","hotmail", "gmail"];
	var alt=login.split("@")[1];
	var alter=alt.split(".")[0];
	var ret;
for (var i=0; i<tab.length; i++) {
	if (tab[i]== alter) {
		ret=true;}
	}	
return ret ;
 
}

function extension(login){
   /* l'adresse doit avoir comme extension .ma ou .fr ou .met ou .com ou be*/
	var tab=["ma","fr","met","com","be"];
	var ext=login.split(".")[login.split(".").length-1];
	var ret;
for (var i=0; i<tab.length; i++) {
	if (tab[i]== ext) {
		ret=true;}
	}	
return ret ;
 
}

/*------------------------------------- validatePassword ----------------------------------------------*/ 

function validatePassword(){
   
   const password =  document.getElementById('passwordIscr'); 
   var resultat ;

   if (password.value.length>9) {
       password.style.borderBottom = "1px solid  #a5948d";
        resultat = true ; 
   }
   
   else{

   	 password.style.borderBottom = " 1px solid  #ef767b";
   	  resultat = false ; 
   }
   return resultat;

}

/*------------------------------------- validateCin ----------------------------------------------*/ 

function validateCin(){

const  cin =  document.getElementById('cinIscr'); 
var resultat ;

if (cin.value.length == 0) {
 	
     cin.style.borderBottom = "1px solid  #ef767b";
      resultat = false ; 
 }
 else {

 	cin.style.borderBottom = "1px solid  #a5948d";
 	 resultat = true ; 

 }
 return  resultat ; 

}

/*------------------------------------- validateTel ----------------------------------------------*/ 

function validateTel(){

 const tel =  document.getElementById('phoneIscr'); 
 const num = /^[0-9]{8,13}$/;
 var resultat ;


    if(!num.test(tel.value)){  

        tel.style.borderBottom = "1px solid  #ef767b";
         resultat = false ; 
    
    } else {
      
        tel.style.borderBottom = "1px solid  #a5948d";
         resultat = true ; 

    }
    return resultat;

}

function validationInscription(){
	document.getElementById("emailErreur").style.display = "none";
	if ( (validateNom()== true) && (validatePrenom()== true) && (validateEmail()== true) && (validatePassword()==true) && (validateCin()== true) && (validateTel()== true )) {
		
		var a = document.getElementById('nomInscr').value;
		var b = document.getElementById('prenomIscr').value;
		var c = document.getElementById('loginIscr').value;
		var d = document.getElementById('passwordIscr').value; 
		var e = document.getElementById('cinIscr').value; 
		var f = document.getElementById('phoneIscr').value;  
		
		$.post("inscription",{"nom":a,"prenom":b,"login":c,"password":d,"cin":e,"tel":f},
				function(data){
			 if(data == -1){
				 document.getElementById('loginIscr').style.border = "1px solid  #ef767b";
				 document.getElementById("emailErreur").style.display = "block";
			 }
			 else if(data == -2){
				 alert("Erreur en serveur réessayer une autre fois");
			 }
			 else {
				 swal({
					  title: "Inscription reussite!",
					  text: "Connectez vous a votre page!",
					  icon: "success",
					  button: "OK!",
					});
			 }
		  })
		  
	  
	}

    else {
   
    	var tab=[validateNom(),validatePrenom(),validateEmail(),validatePassword(),validateCin(),validateTel()]; 
         
    }

}

/*----------------------------- Fin Validation D'inscription  --------------------------------------*/

/*----------------------------- Début Validation D'Authentification  -------------------------------*/

function validateEmailAuth() {
  const email = document.getElementById('email');
  var resultat ;
 
  if((user_name(email.value) == true) && (arobace(email.value) == 1) && (alternative(email.value) == true) && (extension(email.value) == true)){

     email.style.borderBottom = "1px solid  #a5948d";
      resultat = true ; 

  } else {
            
    email.style.borderBottom = "1px solid  #ef767b";
     resultat = false ; 
  }

   return resultat; 
}

function validatePasswordAuth(){
   
   const password =  document.getElementById('password'); 
   var resultat ;

   if (password.value.length>9) {
       password.style.borderBottom = "1px solid  #a5948d";
        resultat = true ; 
   }
   
   else{

   	 password.style.borderBottom = "1px solid  #ef767b";
   	  resultat = false ; 
   }
   return resultat;

}

function validationAuthetification(){
  
	document.getElementById("l").style.display = "none";
	document.getElementById("p").style.display = "none";

	if ((validateEmailAuth() == true) && ( validatePasswordAuth() == true) ) {
		
		var a = document.getElementById('email').value;
		var b = document.getElementById('password').value;
		
		$.post("authentification",{"login":a,"password":b,"operation":"authentification"},
				function(data){
			if(data == "email"){
				document.getElementById('email').style.borderBottom = "1px solid  #ef767b";
				document.getElementById("l").style.display = "block";
			}
			else if(data == "password"){
				
				document.getElementById('password').style.borderBottom = "1px solid  #ef767b";
				document.getElementById("p").style.display = "block";
			}
			else{
				if(data == "utilisateur"){
					document.location.href = 'http://localhost:8080/readmore/utilisateur';
				}
				else if(data == "bibliothecaire") {
					document.location.href = 'http://localhost:8080/readmore/bibliothecaire';
				}
				else{
					
					document.location.href = 'http://localhost:8080/readmore/admin';
				}
				
			}
		  })

	}

	else{
		if(validateEmailAuth() == true){
			document.getElementById('password').style.borderBottom = "1px solid  #ef767b";
			}
		
		else if(validatePasswordAuth() == true){
			
			document.getElementById('email').style.borderBottom = "1px solid  #ef767b";
		}
		else {
			document.getElementById('password').style.borderBottom = "1px solid  #ef767b";
			document.getElementById('email').style.borderBottom = "1px solid  #ef767b";
		}
		
	}
}

/*----------------------------- Fin Validation D'Authentification --------------------------------------*/

/*------------------ Password Oublié --------------------------------*/

function PasswordOublie(){
   document.getElementById("container").style.display = "none";
   document.body.style.backgroundImage= "url(./Ressources/images/Application/back3.jpg)";
   document.getElementById('selectioner').style.display = "block";
}

function AnuulerTousEtRevenir(){
   window.location.reload();
}

/* ---- debut chercher email ---- */
function ChercherEmail(){
   var email = document.getElementById('emailCherche');
   if((user_name(email.value) == true) && (arobace(email.value) == 1) && (alternative(email.value) == true) && (extension(email.value) == true)){
      
      /*Traitement backend */
      console.log(ChoixSelect);
      emailCharcher = email.value;
      $.post("authentification",{"loginChercher":emailCharcher,"ModeRecuperation":ChoixSelect,"operation":"ChercherLogin"},
	  function(data){
           if(data>0){
        	      document.getElementById('emailChercherNonValide').style.display="none";    
        	      document.getElementById('retrouver').style.display = "none";
        	      document.getElementById('recevoirCode').style.display = "block";   
        	      MyData = data;
           }
           else{
        	     email.style.borderBottom = " 1px solid  #ef767b";
        	     document.getElementById('emailChercherNonValide').style.display="block";
           }
      });


      
      
 
   } else {
             
     email.style.borderBottom = " 1px solid  #ef767b";
     document.getElementById('emailChercherNonValide').style.display="block";

   }

}
/* ---- fin chercher email ---- */

/* ---- Debut de selectionner le choix de recuperation ---- */
function ContinuerRecuperation(){
   document.getElementById('selectioner').style.display = "none";
   document.getElementById('retrouver').style.display= "block";
   if(document.getElementById('choix2').checked){
	   ChoixSelect = " tel ";
   }
   else{
	   ChoixSelect = " email ";
   }
   console.log(ChoixSelect);

}
/* ---- Fin de selectionner le choix de recuperation ---- */


/* ---- Debut D'envoyer le code ---- */
function EnvoyerCode(){

   var code = document.getElementById('codeRecu');

   if(code.value == MyData){
	   
		  document.getElementById('codeNonValide').style.display="none";	  
	      document.getElementById('recevoirCode').style.display= "none";
	      document.getElementById('changerMotdePasse').style.display= "block";
	   
   }
   else{
	   
       code.style.borderBottom = " 1px solid  #ef767b";
       document.getElementById('codeNonValide').style.display="block";
	   
   }
}

/* ---- Fin D'envoyer le code ---- */


/* ---- Debut Validation Nouveau Mot de pass ---- */
function validatePasswordForgot1(){
   document.getElementById('PasswordInvalide').style.display="none";
   const password =  document.getElementById('passChange1'); 
   var resultat ;

   if (password.value.length>9) {
       password.style.borderBottom = "1px solid #434a52";
        resultat = true ; 
   }
   
   else{

   	 password.style.borderBottom = "1px solid  #ef767b";
   	  resultat = false ; 
   }
   return resultat;

}

function validatePasswordForgot2(){
   document.getElementById('PasswordInvalide').style.display="none";
   const password =  document.getElementById('passChange2'); 
   var resultat ;

   if (password.value.length>9) {
       password.style.borderBottom = "1px solid #434a52";
        resultat = true ; 
   }
   
   else{

   	 password.style.borderBottom = "1px solid  #ef767b";
   	  resultat = false ; 
   }
   return resultat;

}

/* ---- Fin Validation Nouveau Mot de pass ---- */

/* ---- Debut Changer Mot de pass ---- */
function ChangerPassword(){
   password1 = document.getElementById('passChange1'); 
   password2 = document.getElementById('passChange2'); 
 if((validatePasswordForgot1() == true ) && (validatePasswordForgot2() == true)){
   var pass         = password1.value;
   var passConfirme = password2.value;
    if(pass == passConfirme){
       /*TraitmentBackend*/
        $.post("authentification",{"loginChercher":emailCharcher,"NouveauPassword":pass,"operation":"RecupererCompte"},
        		  function(data){
        	if(data == "utilisateur"){
				document.location.href = 'http://localhost:8080/readmore/utilisateur';
			}
			else if(data == "bibliothecaire") {
				document.location.href = 'http://localhost:8080/readmore/bibliothecaire';
			}
			else if(data == "admin"){
				
				document.location.href = 'http://localhost:8080/readmore/admin';
			}
        	
			else {
				document.location.href = 'http://localhost:8080/readmore/404';
			}
        	
        	      });

          
    }
    else{
      password1.style.borderBottom = "1px solid  #ef767b";
      password2.style.borderBottom = "1px solid  #ef767b";
      document.getElementById('PasswordInvalide').style.display="block";
      
    }
 } 
 
else {
  var Tab = [validatePasswordForgot1(),validatePasswordForgot2()];
}

}

/* ---- Fin Changer Mot de pass ---- */

/*---------------------------------------------- onload  ----------------------------------------------*/
window.onload=function(){


const signUpButton = document.getElementById("signUp");
const signInButton = document.getElementById("signIn");
const container = document.getElementById("container");
/*------------------------------------- Animation----------------------------------------------*/
signUpButton.addEventListener("click", () => {
	container.classList.add("right-panel-active");
	 
});

signInButton.addEventListener("click", () => {
	container.classList.remove("right-panel-active");
	
});

		document.getElementById('nomInscr').addEventListener('blur', validateNom);
		document.getElementById('prenomIscr').addEventListener('blur', validatePrenom);
		document.getElementById('loginIscr').addEventListener('blur', validateEmail);
		document.getElementById('passwordIscr').addEventListener('blur', validatePassword); 
		document.getElementById('cinIscr').addEventListener('blur', validateCin); 
		document.getElementById('phoneIscr').addEventListener('blur', validateTel); 
		document.getElementById('inscription').addEventListener('click', validationInscription); 
		document.getElementById('authetification').addEventListener('click', validationAuthetification); 
		document.getElementById('email').addEventListener('blur', validateEmailAuth);
		document.getElementById('password').addEventListener('blur', validatePasswordAuth);
		/*------------------------Forgot Password------------------------*/
		document.getElementById('mdpOublie').addEventListener('click',PasswordOublie);
		document.getElementById('revenir').addEventListener('click',AnuulerTousEtRevenir);
		document.getElementById('revenir1').addEventListener('click',AnuulerTousEtRevenir);
		document.getElementById('revenir2').addEventListener('click',AnuulerTousEtRevenir);
		document.getElementById('revenir3').addEventListener('click',AnuulerTousEtRevenir);
		document.getElementById('chercher').addEventListener('click',ChercherEmail);
		document.getElementById('continuer').addEventListener('click',ContinuerRecuperation);
		document.getElementById('continuer2').addEventListener('click',EnvoyerCode);
		document.getElementById('passChange1').addEventListener('blur', validatePasswordForgot1);
		document.getElementById('passChange2').addEventListener('blur', validatePasswordForgot2);
		document.getElementById('validerChangement').addEventListener('click',ChangerPassword);
}