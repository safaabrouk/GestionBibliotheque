/*------------------------------------- validateName ----------------------------------------------*/


function validateNom() {
    const name     =  document.getElementById("nomnew"); 
   const re = /^[a-zA-Z]{2,10}$/;
   var resultat ;

   if(!re.test(name.value)){
   name.classList.add("is-invalid");
   resultat = false ;
   } else {
        name.classList.remove("is-invalid");
        name.classList.add("is-valid");
    resultat = true; 
   }
   return resultat;
 }

/*------------------------------------- validatePrenom ----------------------------------------------*/ 

function validatePrenom() {
   const prenom   =  document.getElementById('prenomnew');
   const ree = /^[a-zA-Z]{2,10}$/;
   var resultat ;

   if(!ree.test(prenom.value)){  

        prenom.classList.add("is-invalid");
        resultat = false ; 
   
   } else {
        prenom.classList.remove("is-invalid");
        prenom.classList.add("is-valid");
        resultat = true ; 
   }
   return  resultat ; 
 }

/*------------------------------------- validateEmail ----------------------------------------------*/ 

function validateEmail() {
 const email = document.getElementById('loginnew');
 var resultat ;

 if((user_name(email.value) == true) && (arobace(email.value) == 1) && (alternative(email.value) == true) && (extension(email.value) == true)){
     email.classList.remove("is-invalid");
     email.classList.add("is-valid");
     resultat = true ; 

 } else {
           
     email.classList.add("is-invalid");
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




/*------------------------------------- validateCin ----------------------------------------------*/ 

function validateCin(){

const  cin =  document.getElementById('cinnew'); 
var resultat ;

if (cin.value.length == 0) {
    
     cin.classList.add("is-invalid");
     resultat = false ; 
}
else {
    cin.classList.remove("is-invalid");
    cin.classList.add("is-valid");
     resultat = true ; 

}
return  resultat ; 

}

/*------------------------------------- validateTel ----------------------------------------------*/ 

function validateTel(){

const tel =  document.getElementById('telnew'); 
const num = /^[0-9]{8,13}$/;
var resultat ;


   if(!num.test(tel.value)){  

        tel.classList.add("is-invalid");
        resultat = false ; 
   
   } else {
       tel.classList.remove("is-invalid");
       tel.classList.add("is-valid");
        resultat = true ; 

   }
   return resultat;

}


/*------------------------------------- validatePassword ----------------------------------------------*/ 

function validatePassword(){
   
   const password =  document.getElementById('password'); 
   var resultat ;

   if (password.value.length>9) {
           password.classList.remove("is-invalid");
       password.classList.add("is-valid");
        resultat = true ;
        
   }
   
   else{

    password.classList.add("is-invalid");
        resultat = false ;

     
   }
   return resultat;

}
/*--------------------- Enregistrert les nouveaux coordonnées ----------------------*/ 

function Enregistrer(){
if ((validateNom()== true) && (validatePrenom()== true) && (validateEmail()== true) && (validateCin()== true) && (validateTel()== true ) && ( validatePassword()== true) )  {

	 var nom      = document.getElementById('nomnew').value;
	 var prenom   = document.getElementById('prenomnew').value;
	 var login    = document.getElementById('loginnew').value;
	 var cin      = document.getElementById('cinnew').value; 
	 var tel      = document.getElementById('telnew').value; 
	 var password = document.getElementById('password').value;
 	$.post("ajouterbibliothecaire",{"nom":nom,"prenom":prenom,"login":login,"cin":cin,"tel":tel,"password":password,"operation":"Ajouter"},
				function(data){
        	if(data == 1){
        		 //document.location.href = 'http://localhost:8080/readmore/ajouterbibliothecaire';
        		alert(data);
        	}

    });
}
}
/*--------------------- Annuler les nouveaux coordonnées ----------------------*/ 
function Annuler(){
	swal({
        text: "Vous voulez vraiment annule l' ajout de ce bibliothecaire!",
        buttons: true,
        dangerMode: true,
      })
      .then((willDelete) => {
        if (willDelete) {
          swal("Ajout du bibliothecaire est annuler", {
            icon: "success",
          });
          
          document.location.href = 'http://localhost:8080/readmore/admin';
        } 
      });
}



function RedirectionHref(){
	var id = this.children[0].value ;

	$.post("messages",{"id_envoyer":id,"operation":"changer_etat"},
	 				function(data){
		window.location.href = 'http://localhost:8080/readmore/messages?id='+id;
	    	 });

	
	
}


window.onload=function(){
	
	var entete =document.getElementsByClassName("MesMessage");
	for (var i = 0 ; i <entete.length ; i++) {
		entete[i].addEventListener("click",RedirectionHref);;
	}
	

    document.getElementById('nomnew').addEventListener('blur', validateNom);
    document.getElementById('prenomnew').addEventListener('blur', validatePrenom);
    document.getElementById('loginnew').addEventListener('blur', validateEmail);
    document.getElementById('cinnew').addEventListener('blur', validateCin); 
    document.getElementById('telnew').addEventListener('blur', validateTel); 
    document.getElementById('password').addEventListener('blur', validatePassword); 
    document.getElementById('submit').addEventListener('click',Enregistrer);
    document.getElementById('annuler').addEventListener('click',Annuler);

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



