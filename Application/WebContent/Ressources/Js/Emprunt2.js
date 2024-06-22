
function Supprimer(){
	
	var idEmprunt = this.parentElement.parentElement.children[0].textContent;
	var idLivre = this.parentElement.parentElement.children[1].children[0].value;
	var NbrExemplaire = this.parentElement.parentElement.children[1].children[1].value;
	var idReservation = this.parentElement.parentElement.children[1].children[2].value;
	var tr = this.parentElement.parentElement;
	swal({
        text: "Vous etes sure que le livre revenue!",
        buttons: ["Annuler", true],
        dangerMode: true,
      })
      .then((willDelete) => {
        if (willDelete) {
            //backend ici supprimer ....
        	$.post("emprunt",{"idEmprunt":idEmprunt,"idLivre":idLivre,"NbrExemplaire":NbrExemplaire,"idReservation":idReservation},
    				function(data){
              if(data == 1){
            	  tr.remove();           	  
                  swal("Emprunt bien supprimer!", {
                  icon: "success",
                });
                  
                  
              }
              else{
            	  alert("emprunt n'est pas supprimer!");
              }
           
           });
        
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

   function Visulaiser(){
	   var idEmprunt = this.parentElement.parentElement.children[0].textContent;
	   window.location.href = 'http://localhost:8080/readmore/thisemprunt?idEmprunt='+idEmprunt;
	}


window.onload=function(){

		var entete =document.getElementsByClassName("MesMessage");
		for (var i = 0 ; i <entete.length ; i++) {
			entete[i].addEventListener("click",RedirectionHref);;
		}
		var supp =document.getElementsByClassName("delete");
		for (var i = 0 ; i <supp.length ; i++) {
			supp[i].addEventListener("click",Supprimer);;
		}
		var view = document.getElementsByClassName("view");
        for (var i =0 ; i<view.length ; i++) {
      	  view[i].addEventListener("click", Visulaiser);
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