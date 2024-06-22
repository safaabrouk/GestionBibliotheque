/* ---- Debut Validation Nouveau Mot de pass ---- */
function validatePassword1(){
   document.getElementById('PasswordInvalide').style.display="none";
   const password =  document.getElementById('passChange1'); 
   var resultat ;

   if (password.value.length>9) {
       password.classList.add("is-valid");
       password.classList.remove("is-invalid");
        resultat = true ; 
   }
   
   else{

   	 password.classList.add("is-invalid");
   	password.classList.remove("is-valid");
   	  resultat = false ; 
   }
   return resultat;

}

function validatePassword2(){
   document.getElementById('PasswordInvalide').style.display="none";
   const password =  document.getElementById('passChange2'); 
   var resultat ;

   if (password.value.length>9) {
       password.classList.add("is-valid");
       password.classList.remove("is-invalid");
        resultat = true ; 
   }
   
   else{

   	 password.classList.add("is-invalid");
   	 password.classList.remove("is-valid");
   	  resultat = false ; 
   }
   return resultat;

}

function validatePassword(){
	   document.getElementById('PasswordInvalide').style.display="none";
	   const password =  document.getElementById('password'); 
	   var resultat ;

	   if (password.value.length>9) {
	       password.classList.add("is-valid");
	       password.classList.remove("is-invalid");
	        resultat = true ; 
	   }
	   
	   else{

	   	 password.classList.add("is-invalid");
	   	 password.classList.remove("is-valid");
	   	  resultat = false ; 
	   }
	   return resultat;

	}


/* ---- Fin Validation Nouveau Mot de pass ---- */

/* ---- Debut Changer Mot de pass ---- */
function ChangerPassword(){
   password1 = document.getElementById('passChange1'); 
   password2 = document.getElementById('passChange2'); 
   document.getElementById('PasswordInvalide').style.display="none";
   document.getElementById('PasswordNonIdentique').style.display="none";
   
 if((validatePassword1() == true ) && (validatePassword2() == true) && (validatePassword() == true ) ){
   var pass         = password1.value;
   var passConfirme = password2.value;
   var password = document.getElementById('password').value;
    if(password1.value == password2.value){
       /*TraitmentBackend*/
    	$.post("password",{"NouveauPassword":pass,"AncienPassword":password},
 				function(data){
    		 if(data == 1){
    			 swal({
	 				  title: "",
	 				  text: "Votre nouveau mot de passe bien enregistrer!",
	 				  icon: "success",
	 				  button: "Ok !",
	 				}).then(function(isConfirm) {
	 					  if (isConfirm) {
	 						 document.location.href = 'http://localhost:8080/readmore/monprofil';
	 						  } else {
	 						    //if no clicked => do something else
	 							 document.location.href = 'http://localhost:8080/readmore/monprofil';
	 						  }
	 						});

    			 
    		 }
    		 else{
    			 document.getElementById('password').classList.add("is-invalid");
    		     document.getElementById('PasswordInvalide').style.display="block";
    		 } 
    	});

      
    }
    else{
      password1.classList.add("is-invalid");
      password2.classList.add("is-invalid");
      document.getElementById('PasswordNonIdentique').style.display="block";

      
    }
 } 
 
else {
  var Tab = [validatePassword1(),validatePassword2(),validatePassword()];
}

}








function RedirectionHref(){
	var id = this.children[0].value ;

	$.post("messages",{"id_envoyer":id,"operation":"changer_etat"},
	 				function(data){
		window.location.href = 'http://localhost:8080/readmore/messages?id='+id;
	    	 });

	
	
}





window.onload=function(){
document
        document.getElementById('password').addEventListener("blur",validatePassword);
        document.getElementById('passChange1').addEventListener("blur",validatePassword1);
        document.getElementById('passChange2').addEventListener("blur",validatePassword2);
        document.getElementById('savepassword').addEventListener("blur",ChangerPassword);

		var entete =document.getElementsByClassName("MesMessage");
		for (var i = 0 ; i <entete.length ; i++) {
			entete[i].addEventListener("click",RedirectionHref);
		}
		

}




function EnvoyerMessage(){
	var Id_Envoyer =  document.getElementById("IdEnvoyer").value;
    var Sujet = document.getElementById("VotreSujet").value;
    var Content = document.getElementById("VotreContent").value;
    if((Content.length != 0) && (Sujet.length == 0)){
        document.getElementById("VotreContent").style.borderBottom = "none";
        document.getElementById("VotreSujet").style.borderBottom = "1px solid  #ef767b";
    }
    else if((Content.length == 0) && (Sujet.length != 0)){
        document.getElementById("VotreSujet").style.borderBottom = "none";
        document.getElementById("VotreContent").style.borderBottom = "1px solid  #ef767b";
    }
    else if((Content.length == 0) && (Sujet.length == 0) ){
       /* aucun traitement */
    }
    else{
        document.getElementById("VotreSujet").style.borderBottom = "none";
        document.getElementById("VotreContent").style.borderBottom = "none";

        $.post("messages",{"operation":"EnvoyerMessage","IdEnvoyer":Id_Envoyer,"SujetMsg":Sujet,"ContentMsg":Content},
				function(data){
        	  /* La creation des elements */ 
            var Div1 = document.createElement("div");
            var Div2 = document.createElement("div");
            
            /* Ajouter les classes */
            Div1.classList.add("messages__item" ,"messages__item--right");
            Div2.classList.add("messages__details");
            var date = new Date();
            Div2.innerHTML = "<p> <i style='color:blue;'> Sujet :"+Sujet+" </i>  <br> "+Content+" </p> <small><i class='zmdi zmdi-time'></i> "+date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds()+".0"+"</small> ";
            Div1.appendChild(Div2);        
            document.getElementById("AjouterDiv").appendChild(Div1);
            document.getElementById("VotreSujet").value = "";
            document.getElementById("VotreContent").value= "";

	 });

    }
     /**/
 
 
 }






