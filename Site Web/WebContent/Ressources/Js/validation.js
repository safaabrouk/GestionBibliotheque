
/*------------------------------------- validateName ----------------------------------------------*/


function validateNom() {
  const name     =  document.getElementById("name"); 
   const re = /^[a-zA-Z]{2,10}$/;
   var resultat ;

   if(!re.test(name.value)){
   name.style.border = " solid 1px red";
   resultat = false ;
   } else {
    
   name.style.border = " solid 1px green";
    resultat = true; 
   }
   return resultat;
 }


 /*------------------------------------- validateEmail ----------------------------------------------*/ 

 function validateEmail() {
  const email = document.getElementById('email');
  var resultat ;
 
  if((user_name(email.value) == true) && (arobace(email.value) == 1) && (alternative(email.value) == true) && (extension(email.value) == true)){

     email.style.border = " solid  1px green";
     document.getElementById("small").style.display='none';
      resultat = true ; 

  } else {
            
    email.style.border = " solid  1px red";
    document.getElementById("small").style.display='block';
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

/*..................... VALIDATION MESSAGE ..............*/

function validateMessage(){
 
  const  cin =  document.getElementById('message'); 
var resultat ;

if (cin.value.length == 0) {
 	
     cin.style.border = " solid  1px red";
      resultat = false ; 
 }
 else {

 	cin.style.border = " solid  1px green";
 	 resultat = true ; 

 }
 return  resultat ; 


}
        
        $(document).ready(function(){
          $("#send").click(function(){
            var name = document.getElementById("name").value;
            var email = document.getElementById("email").value;
            var msg = document.getElementById("message").value;
if ( (validateNom()== true) && (validateEmail()== true) && (validateMessage()== true)) {
         
         alert("Good");
	}

    else {
    	
    	var tab=[validateNom(),validateEmail(),validateMessage()];


    }
          });
        });


        window.onload=function(){

          document.getElementById('name').addEventListener('blur', validateNom);
          document.getElementById('message').addEventListener('blur', validateMessage);
          document.getElementById('email').addEventListener('blur', validateEmail);
        }