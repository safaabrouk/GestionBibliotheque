
function validateNom(){
const titre =  document.getElementById('titre'); 
var resultat ;

    if(titre.value.length == 0){  

        titre.classList.add("is-invalid");
        resultat = false ; 
   
   } else {
        titre.classList.remove("is-invalid");
        titre.classList.add("is-valid");
        resultat = true ; 
   }
    return resultat;
}

function validateisbn(){
    const isbn =  document.getElementById('isbn'); 
    var resultat ;
    
        if(isbn.value.length == 0){  
    
            isbn.classList.add("is-invalid");
            resultat = false ; 
       
       } else {
            isbn.classList.remove("is-invalid");
            isbn.classList.add("is-valid");
            resultat = true ; 
       }
        return resultat;
}

function validateAuteur(){
    const auteur   =  document.getElementById('auteur');
    const ree = /^[a-zA-Z]{2,10}$/;
    var resultat ;
 
    if(!ree.test(auteur.value)){  
 
        auteur.classList.add("is-invalid");
        resultat = false ; 
    
    } else {
        auteur.classList.remove("is-invalid");
        auteur.classList.add("is-valid");
        resultat = true ; 
    }
    return  resultat ; 

}

function validateEditeur(){
    const editeur   =  document.getElementById('editeur');
    const ree = /^[a-zA-Z]{2,10}$/;
    var resultat ;
 
    if(!ree.test(editeur.value)){  
 
        editeur.classList.add("is-invalid");
        resultat = false ; 
    
    } else {
        editeur.classList.remove("is-invalid");
        editeur.classList.add("is-valid");
        resultat = true ; 
    }
    return  resultat ; 
}

function validateDescription(){
    const desc =  document.getElementById('desc'); 
    var resultat ;
    
        if(desc.value.length == 0){  
    
            desc.classList.add("is-invalid");
            resultat = false ; 
       
       } else {
        desc.classList.remove("is-invalid");
        desc.classList.add("is-valid");
        resultat = true ; 
       }
        return resultat;
}

function validateDate(){
     
 const nbr =  document.getElementById('date'); 
 const num = /^[0-9]{4,100}$/;
 var resultat ;

    if(!num.test(nbr.value)){  

        nbr.classList.add("is-invalid");
        resultat = false ; 
   
   } else {
        nbr.classList.remove("is-invalid");
        nbr.classList.add("is-valid");
        resultat = true ; 
   }
    return resultat;
}

function validateNbrExemplaire(){
    
 const nbr =  document.getElementById('nbr'); 
 const num = /^[0-9]{1,100}$/;
 var resultat ;

    if(!num.test(nbr.value)){  

        nbr.classList.add("is-invalid");
        resultat = false ; 
   
   } else {
        nbr.classList.remove("is-invalid");
        nbr.classList.add("is-valid");
        resultat = true ; 
   }
    return resultat;
}

function Enregistrer(){
    if((validateNom()== true) && (validateisbn() == true) && (validateAuteur() == true) && (validateEditeur() == true) && (validateDescription() == true) && (validateDate() == true) && (validateNbrExemplaire() == true)){
        var titre    = document.getElementById('titre').value;
        var isbn     = document.getElementById('isbn').value;
        var auteur   = document.getElementById('auteur').value;
        var editeur  = document.getElementById('editeur').value; 
        var desc     = document.getElementById('desc').value; 
        var date     = document.getElementById('date').value;
        var nbr      = document.getElementById('nbr').value;
        var id_Categorie = document.getElementById('select').options[document.getElementById('select').selectedIndex].value;
        
        var form     = document.getElementById('form');
        //traitement backend ...
    	  //Nom servlet
    	    var url = "UploadImageLivre";
    		//formulaire qui a le id = ..
    	    var urlimage = new FormData(form);
    	    $.ajax({
    	        type : "POST",
    	        encType : "multipart/form-data",
    	        url : url,
    	        cache : false,
    	        processData : false,
    	        contentType : false,
    	        data : urlimage , 
    	        success : function(msg) {
    	            var response = msg;
    	          
                    if (response == "Nom") {
    	                alert("essayer d'importer cette image une autre fois.");
    	            }
    	            else {
    	            	console.log("File has been uploaded successfully");
    	                $.post("ajouterlivre",{"titre":titre,"isbn":isbn,"auteur":auteur,"editeur":editeur,"description":desc,"date":date,"nbr":nbr,"url_img":response ,"idCategorie":id_Categorie},
    	         				function(data){
    	                	if(data == 1){
    	                		 document.location.href = 'http://localhost:8080/readmore/listelivre';
    	                		alert(data);
    	                	}

    	                });
    	            }
    	            
    	        },
    	        error : function(msg) {
    	            alert("Il ya un probleme au serveur");
    	        }
    	    });
   
   
    }
    else{
        var tab=[validateNom(),validateisbn(),validateAuteur(),validateEditeur(),validateDescription(),validateDate(),validateNbrExemplaire()];
    }
}

function AnnulerTous(){
    swal({
        text: "Vous voulez vraiment annule ce nouveau livre!",
        buttons: true,
        dangerMode: true,
      })
      .then((willDelete) => {
        if (willDelete) {
          swal("Le livre bien annuler", {
            icon: "success",
          });
          
          document.location.href = 'http://localhost:8080/readmore/listelivre';
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
	document.getElementById('titre').addEventListener('blur', validateNom);
	document.getElementById('isbn').addEventListener('blur', validateisbn);
	document.getElementById('auteur').addEventListener('blur', validateAuteur);
	document.getElementById('editeur').addEventListener('blur', validateEditeur); 
	document.getElementById('desc').addEventListener('blur', validateDescription); 
	document.getElementById('date').addEventListener('blur', validateDate); 
	document.getElementById('nbr').addEventListener('click', validateNbrExemplaire); 


	document.getElementById('submit').addEventListener('click',Enregistrer);
    document.getElementById('annuler').addEventListener('click',AnnulerTous);
    
    
		var entete =document.getElementsByClassName("MesMessage");
		for (var i = 0 ; i <entete.length ; i++) {
			entete[i].addEventListener("click",RedirectionHref);;
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

