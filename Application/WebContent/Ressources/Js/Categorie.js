
function Supprimer(){
	  var idCategorie = this.parentElement.parentElement.children[0].textContent;
	  var nbrLivre = this.children[0].value;
	  var supp = this;
	  if(nbrLivre != 0){
		  swal("Vous pouvez pas supprimer cette categorie car elle contient des livres!", {
			  icon: "warning",
	          }); 
	  }
	  else{
		    swal({
        text: "vous voulez vraiment supprimer cette categorie!",
        buttons: ["Annuler", true],
        dangerMode: true,
      })
      .then((willDelete) => {
        if (willDelete) {
            //backend ici supprimer ....
           $.post("categorie",{"id_categorie":idCategorie,"operation":"supprimer"},function(data){
              if(data == 1){
            	  supp.parentElement.parentElement.remove();
            	  
                  swal("La categorie bien supprimer!", {
                  icon: "success",
                });
                  
                  
              }
              else{
            	  alert("la categorie n'est pas supprimer!");
              }
           
           });
        
        } 
      });
	  }
  
}

function Modifier(){
    var id  = this.parentElement.parentElement.children[1].children[0].value;
    var non = this.parentElement.parentElement.children[1].children[1].children[0].value;
    var description =  this.parentElement.parentElement.children[1].children[2].children[0].value;
    var ImageCategorie = this.parentElement.parentElement.children[1].children[4].value;
    var form = this.parentElement.parentElement.children[1].children[3];
    var div = this;
    //traitement backend ...
  //Nom servlet
    var url = "UploadImageCategorie";
	//formulaire qui a le id = ..
    var urlimage = new FormData(form);
    /* var data = {};
    data['key1'] = 'value1';
    data['key2'] = 'value2'; */
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
          
            if (response == "pasImage") {
                console.log("File has been uploaded successfully");
                $.post("categorie",{"id":id,"nom":non,"description":description,"url_img":ImageCategorie ,"operation":"modifier"},
         				function(data){
                	if(data == 1){
                        div.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.children[1].innerText = non ;
                        div.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.children[2].innerText = description ;
                        form.children[0].value="";
                	}
            	 });

            } else if (response == "Nom") {
                alert("essayer de modifier cette image une autre fois.");
            }
            else {
            	console.log("File has been uploaded successfully");
                $.post("categorie",{"id":id,"nom":non,"description":description,"url_img":response ,"operation":"modifier"},
         				function(data){  
                	if(data == 1){
                        div.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.children[1].innerText = non ;
                        div.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.children[2].innerText = description ;
                        form.children[0].value="";
                	}

                });
            }
            
        },
        error : function(msg) {
            alert("Il ya un probleme au serveur");
        }
    });


   
}



function Annuler(){
    var id  = this.parentElement.parentElement.children[1].children[0].value;
    var non = this.parentElement.parentElement.children[1].children[1].children[0].value;
    var description =  this.parentElement.parentElement.children[1].children[2].children[0].value;

 swal({
  text: "Vous voulez vraiment annuler ces modofications !",
  buttons: ["Non",true],
  dangerMode: true,
})
.then((willDelete) => {
  if (willDelete) {
    swal("vos modofications bien annuler!", {
      icon: "success",
    });    
  }
  else{
      //traitement backend
      console.log(id+"  "+non+"  "+description);
    /*$.post("enregistrement",{"id_reservation":id,"operation":"supp"},function(data){
    });*/
   
  } 
});
    
    

}


function Enregistrer(){
    var lastIdString = document.getElementById("bodyTable").lastChild.children[0].textContent;
    var lastId =parseInt(lastIdString);
    var nom = this.parentElement.parentElement.children[1].children[0].children[0].value; 
    var description =  this.parentElement.parentElement.children[1].children[1].children[0].value;
    var form = this.parentElement.parentElement.children[1].children[2]; 
    var div = this;
    
    if(nom.length != 0 && description.length != 0 && form.children[0].value.length != 0){
        //backend ...
    	   
    	    //traitement backend ...
    	  //Nom servlet
    	    var url = "UploadImageCategorie";
    		//formulaire qui a le id = ..
    	    var urlimage = new FormData(form);
    	    /* var data = {};
    	    data['key1'] = 'value1';
    	    data['key2'] = 'value2'; */
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
    	                alert("essayer de modifier cette image une autre fois.");
    	            }
    	            else {
    	            	console.log("File has been uploaded successfully");
    	                $.post("categorie",{"nom":nom,"description":description,"url_img":response ,"operation":"ajouter"},
    	         				function(data){  
    	                	if(data == 1){
    	                        form.children[0].value="";
    	                        div.parentElement.parentElement.children[1].children[0].children[0].value="";
    	                        div.parentElement.parentElement.children[1].children[1].children[0].value="";
    	                        
    	                        // ajouter nouveau ligne ...
    	                    	
    	                        var tr = document.createElement("tr");
    	                        tr.setAttribute("role","row");
    	                        tr.classList.add('odd');
    	                        tr.innerHTML = '<td class="sorting_1">'+(lastId+1)+'</td>'+
    	                                      '<td >'+nom+'</td>'+
    	                                      '<td >'+description+'</td>'+                 
    	                        '<td>'+
    	                        '<a class="edit" data-toggle="modal" data-target="#modal-small'+(lastId+1)+'">'+ 
    	                            '<i class="zmdi zmdi-edit"></i>'+
    	                        '</a>'+                                           
    	                        '<div class="modal fade" id="modal-small'+(lastId+1)+'" data-backdrop="static" tabindex="-1">'+
    	                            '<div class="modal-dialog modal-sm">'+
    	                                '<div class="modal-content">'+
    	                                    '<div class="modal-header">'+
    	                                        '<h5 class="modal-title pull-left TitreLivre">Modifier categorie</h5>'+
    	                                    '</div>'+
    	                                    '<div class="modal-body">'+
    	                                        '<input type="hidden" value="1">'+
    	                                        '<div class="form-group">'+
    	                                            '<input type="text"  class="form-control " value="'+nom+'">'+
    	                                        '</div>'+
    	                                        '<div class="form-group">'+
    	                                            '<input type="text"  class="form-control " value="'+description+'" >'+
    	                                        '</div>'+
    	                                        '<input type="hidden" value="'+response+'" >'+
    	                                    '</div>'+
    	                                    '<div class="modal-footer">'+
    	                                        '<button type="button" class="btn btn-link annuler" data-dismiss="modal">Fermer</button>'+
    	                                        '<button type="button" class="btn btn-link modifier" data-dismiss="modal">Modifier</button>'+
    	                                    '</div>'+
    	                                '</div>'+
    	                            '</div>'+
    	                        '</div>'+
    	                        '<a class="delete" >'+
    	                        '<input type="hidden" value="<%=c.getLivres().size()%>">'+
    	                            '<i class="zmdi zmdi-delete"></i>'+
    	                        '</a>'+
    	                    '</td>';
    	                        document.getElementById("bodyTable").appendChild(tr);
    	                	}

    	                });
    	            }
    	            
    	        },
    	        error : function(msg) {
    	            alert("Il ya un probleme au serveur");
    	        }
    	    });
   
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
	var res =document.getElementsByClassName("modifier");
	var ann =document.getElementsByClassName("annuler");
    var sup =document.getElementsByClassName("delete");
    var sav =document.getElementsByClassName("save");
	var entete =document.getElementsByClassName("MesMessage");
	
		for (var i = 0 ; i <entete.length ; i++) {
			entete[i].addEventListener("click",RedirectionHref);;
		}
		
          for (var i =0 ; i<res.length ; i++) {
          	res[i].addEventListener("click", Modifier);
          }

          for (var i =0 ; i<ann.length ; i++) {
        	  ann[i].addEventListener("click", Annuler);
            }

            for (var i =0 ; i<sup.length ; i++) {
                sup[i].addEventListener("click", Supprimer);
              }

            for (var i =0 ; i<sav.length ; i++) {
                sav[i].addEventListener("click",Enregistrer);
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



