

        function chercher(){
          var valeur = document.getElementById("InputChercher").value.toLowerCase();
          var choix = document.getElementsByClassName("TitreLivre");
          
        
          for (var i = 0 ; i <choix.length ; i++) {
              var MonDiv =  choix[i].parentElement.parentElement.parentElement.parentElement.parentElement.parentElement;
            if (choix[i].textContent.toLowerCase().includes(valeur)) {

              MonDiv.style.display="";
                 
            }
            else {
              MonDiv.style.display="none";
            }
 
          }
        
          
        }

        
        function EnregistrerLivre(){
        	
        	var IdLivre = this.children[0].value;
        	$.post("livre",{"IdLivre":IdLivre},
        	 				function(data){

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

        		document.getElementById("InputChercher").addEventListener("keyup",chercher);
        		var entete =document.getElementsByClassName("MesMessage");
        		for (var i = 0 ; i <entete.length ; i++) {
        			entete[i].addEventListener("click",RedirectionHref);
        		}
        		
        		var entete =document.getElementsByClassName("enregistrer");
        		for (var i = 0 ; i <entete.length ; i++) {
        			entete[i].addEventListener("click",EnregistrerLivre);
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



