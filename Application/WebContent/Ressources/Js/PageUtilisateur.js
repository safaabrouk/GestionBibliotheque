function modifier_text(){
	
	var nom_user = document.getElementById("h").children[0];
  if (nom_user.getAttribute("id")== "link") {
   var valNom    = document.getElementById("linknom").textContent; 
   var valPrenom = document.getElementById("linkprenom").textContent;
  document.getElementById("h").innerHTML="<input type='text' class='form-control' name='nom' id='inptnom' value='"+valNom+"'/> <input type='text' class='form-control' name='prenom' id='inptprenom' value='"+valPrenom+"'/> <i class='fas fa-pencil-alt' id ='text' onclick='modifier_text()'></i>";
  }
  else{
	  var valNom    = document.getElementById("inptnom").value;
	  var valPrenom = document.getElementById("inptprenom").value; 
	  const ree = /^[a-zA-Z]{2,10}$/;
	  
	  if(!ree.test(valNom) || !ree.test(valPrenom)){  
           if(!ree.test(valNom)){
			   document.getElementById("inptnom").style.border = " solid  #ef767b";
			   document.getElementById("inptprenom").style.border = " solid  #503737";		   
		   }
		  if(!ree.test(valPrenom)){
			  document.getElementById("inptnom").style.border = " solid  #503737";
			  document.getElementById("inptprenom").style.border = " solid  #ef767b";
		  }
		  if(!ree.test(valPrenom) && !ree.test(valNom)){
			  document.getElementById("inptnom").style.border = " solid  #ef767b";
			  document.getElementById("inptprenom").style.border = " solid  #ef767b";
		  }
	    
	    }
     else {
    	 const idPersonne = document.getElementById("idPer").value;
    	$.post("Utilisateur",{"nom":valNom,"prenom":valPrenom,"idPersonne":idPersonne,"operation":"changer_username"},
 				function(data){
    		 
    	 });

		 document.getElementById("h").innerHTML="<span id='link'> <span id='linknom'>"+valNom+"</span> <span id='linkprenom'>"+valPrenom+"</span></span><i class='fas fa-pencil-alt' id ='text' onclick='modifier_text()'></i>";
         
	 }
	   

	  }

}
function modifier_image(){
	document.getElementById("input").click();

}

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

function annuler(){
	swal({
		  title: "etes-vous sur d'annuler vos modifications?",
		  text: "",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
		    swal("vos modifications bien annuler!", {
		      icon: "success",
		    });
		    
		    document.getElementById("Modifier_le_profil").style.display= "none";
		  } else {
		    swal("Alors ... Enregistrer vos modifications :)");
		  }
		});
	}

function EnregistrerCoordonnee(){
	
	 const idPersonne = document.getElementById("idPer").value;
	 var nom    = document.getElementById('nomnew').value;
	 var prenom = document.getElementById('prenomnew').value;
	 var login  = document.getElementById('loginnew').value;
	 var cin    = document.getElementById('cinnew').value; 
	 var tel    = document.getElementById('telnew').value; 
	 var lastLogin =  document.getElementById('lastlogin').value;
	 
 	$.post("Utilisateur",{"idPersonne":idPersonne,"nom":nom,"prenom":prenom,"login":login,"lastLogin":lastLogin,"cin":cin,"tel":tel,"operation":"Modifier_Coordonnee"},
				function(data){
 		if(data == -1){
 			swal({
 				  title: "Erreur d'enregistrement !",
 				  text: "Email utilise deja existe!",
 				  icon: "warning",
 				  button: "Ok!",
 				});
 		}
 		else{
 			swal({
 				  title: "",
 				  text: "Vos modifications bien enregistrer!",
 				  icon: "success",
 				  button: "Ok !",
 				}).then(function(isConfirm) {
 					  if (isConfirm) {
 						    location.reload();
 						  } else {
 						    //if no clicked => do something else
 							 location.reload();
 						  }
 						});
 			

 		}
 	 });

	
}
function Changer_mot_de_passe(){
	document.getElementById("Modifier_le_profil").style.display= "none";
	document.getElementById("Changer_mot_de_passe").style.display = "block";
	
}

function Modifier_le_profil(){
	document.getElementById("Changer_mot_de_passe").style.display = "none";
	document.getElementById("Modifier_le_profil").style.display= "block";
	
	if ((validateNom()== true) && (validatePrenom()== true) && (validateEmail()== true) && (validateCin()== true) && (validateTel()== true )) {
        
		document.getElementById("save").addEventListener("click",EnregistrerCoordonnee);
		document.getElementById("annuler").addEventListener("click",annuler);
	}

   else {
   	
   	var tab=[validateNom(),validatePrenom(),validateEmail(),validateCin(),validateTel()];


   }
	
}

function Afficher_les_livres(){
    document.getElementById("Changer_mot_de_passe").style.display = "none";
	document.getElementById("Modifier_le_profil").style.display= "none";
	/*fghjklm*/
}

function traitement(){
	var elment_click = this.textContent;
	if(elment_click.includes("Changer mot de passe")){
		Changer_mot_de_passe();
		
	}
	else if(elment_click.includes("Modifier le profil")){
		Modifier_le_profil();
	}
	else if(elment_click.includes("Afficher les livres")){
		Afficher_les_livres();
	}


}

window.onload=function(){

$(document).ready(function(){
			$('#sidebarCollapse').on('click',function(){
				$('#sidebar').toggleClass('active');
			});
		});  
		document.getElementById("camera").addEventListener("click",modifier_image);
		document.getElementById("text").addEventListener("click",modifier_text);
		var entete =document.getElementsByClassName("sousItem");
		for (var i = 0 ; i <entete.length ; i++) {
			entete[i].addEventListener("click",traitement);;
		}
		
		document.getElementById('nomnew').addEventListener('blur', validateNom);
		document.getElementById('prenomnew').addEventListener('blur', validatePrenom);
		document.getElementById('loginnew').addEventListener('blur', validateEmail);
		document.getElementById('cinnew').addEventListener('blur', validateCin); 
		document.getElementById('telnew').addEventListener('blur', validateTel); 
}