function Supprimer(){
	  var idLivre = this.parentElement.parentElement.children[0].textContent;
	  var supp = this;
	  
	  swal({
	      icon: "error",
		  text: "Vous voulez vraiment supprimer ce livre!",
		  buttons: ["Non",true],
		  dangerMode: true,
		})
		.then((willDelete) => {
        if (willDelete) {
            // backend ici supprimer ....
           $.post("listelivre",{"id_livre":idLivre,"operation":"supprimer"},function(data){
              if(data == 1){
            	  supp.parentElement.parentElement.remove();
            	  
                  swal("Le livre bien supprimer!", {
                  icon: "success",
                });
                  
                  
              }
              else{
            	  swal("Livre deja reserver ou emprunter !", {
            	      icon: "warning",
            	    });            
            	  }
           
           });
        
        } 
      });
}            

	  


function Modifier(){
    var id  =     this.parentElement.parentElement.children[1].children[0].value;
    var titre=    this.parentElement.parentElement.children[1].children[1].children[0].value;
    var auteur=   this.parentElement.parentElement.children[1].children[2].children[0].value;
    var editeur=  this.parentElement.parentElement.children[1].children[3].children[0].value;
    var date=     this.parentElement.parentElement.children[1].children[4].children[0].value;
    var isbn=     this.parentElement.parentElement.children[1].children[5].children[0].value;
    var exemplaire= this.parentElement.parentElement.children[1].children[6].children[0].value;
    var categorie= this.parentElement.parentElement.children[1].children[7].children[0].value;
    var description= this.parentElement.parentElement.children[1].children[8].children[0].value;
    var id_Categorie = document.getElementById('mySelect').options[document.getElementById('mySelect').selectedIndex].value;
    var ImageLivre = this.parentElement.parentElement.children[1].children[10].value;
    console.log(ImageLivre+" "+id_Categorie);
    var form = this.parentElement.parentElement.children[1].children[9];
    var div = this;
    // traitement backend ...
  // Nom servlet
    var url = "UploadImageLivre";
	// formulaire qui a le id = ..
    var urlimage = new FormData(form);
    
    
    /*
	 * var data = {}; data['key1'] = 'value1'; data['key2'] = 'value2';
	 */
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
                console.log(response);
                $.post("listelivre",{"id":id,"titre":titre,"auteur":auteur,"editeur":editeur,"date":date,"isbn":isbn,"exemplaire":exemplaire,"categorie":id_Categorie,"description":description,"url_img":ImageLivre ,"operation":"modifier"},
         				function(data){
                	alert(data);
                	if(data == 1){
                        div.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.children[1].innerText = titre ;
                        div.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.children[2].innerText = auteur ;
                        div.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.children[3].innerText = editeur ;
                        div.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.children[4].innerText = date ;
                        div.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.children[5].innerText = isbn ;
                        div.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.children[6].innerText = exemplaire ;
                        div.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.children[7].innerText = categorie ;
                        div.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.children[8].innerText = description ;
                        form.children[0].value="";
                	}
            	 });

            } else if (response == "Nom") {
                alert("essayer de modifier cette image une autre fois.");
            }
            else {
            	console.log("File has been uploaded successfully");
                $.post("listelivre",{"id":id,"titre":titre,"auteur":auteur,"editeur":editeur,"date":date,"isbn":isbn,"exemplaire":exemplaire,"categorie":id_Categorie,"description":description,"url_img":response ,"operation":"modifier"},
         				function(data){  
                	if(data == 1){
                		div.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.children[1].innerText = titre ;
                        div.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.children[2].innerText = auteur ;
                        div.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.children[3].innerText = editeur ;
                        div.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.children[4].innerText = date ;
                        div.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.children[5].innerText = isbn ;
                        div.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.children[6].innerText = exemplaire ;
                        div.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.children[7].innerText = categorie ;
                        div.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.children[8].innerText = description ;
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
	var id  =     this.parentElement.parentElement.children[1].children[0].value;
    var titre=    this.parentElement.parentElement.children[1].children[1].children[0].value;
    var auteur=   this.parentElement.parentElement.children[1].children[2].children[0].value;
    var editeur=  this.parentElement.parentElement.children[1].children[3].children[0].value;
    var date=     this.parentElement.parentElement.children[1].children[4].children[0].value;
    var isbn=     this.parentElement.parentElement.children[1].children[5].children[0].value;
    var exemplaire= this.parentElement.parentElement.children[1].children[6].children[0].value;
    var categorie= this.parentElement.parentElement.children[1].children[7].children[0].value;
    var description= this.parentElement.parentElement.children[1].children[8].children[0].value;

    var div = this;
    
 swal({
  text: "Vous voulez vraiment annuler ces modofications !",
  buttons: ["Non",true],
  dangerMode: true,
})
.then((willDelete) => {
  if (willDelete) {
    swal("vos modofications sont bien annuler!", {
      icon: "success",
    });    
  }
  else{
      // traitement backend
      console.log(div+" "+id+"  "+titre+"  "+auteur+"  "+editeur+"  "+date+"  "+isbn+"  "+exemplaire+"  "+categorie+"  "+description);
    /*
	 * $.post("enregistrement",{"id_reservation":id,"operation":"supp"},function(data){
	 * });
	 */
   
  } 
});
    
    

}



function Afficher(){
	var titreM = document.querySelector("input[name='TitreModel']");
	var auteurM = document.querySelector("input[name='AuteurModel']");
	var editeurM = document.querySelector("input[name='EditeurModel']");
	var dateM = document.querySelector("input[name='DateModel']");
	var isbnM = document.querySelector("input[name='IsbnModel']");
	var exemplaireM = document.querySelector("input[name='ExemplaireModel']");
	var categorieM = document.getElementById("mySelect").children;
	var descriptionM= document.getElementById("DescriptionModel");
	var urlImageM = document.querySelector("input[name='ImageModel']");
	var div = this;
	
	
	
    var titre=    div.parentElement.parentElement.children[2].textContent;
    var auteur=  div.parentElement.parentElement.children[3].textContent;
    var editeur= div.parentElement.parentElement.children[4].textContent;
    var date=     div.parentElement.parentElement.children[5].textContent;
    var isbn=     div.parentElement.parentElement.children[6].textContent;
    var exemplaire= div.parentElement.parentElement.children[7].textContent;
    var categorie= div.parentElement.parentElement.children[8].textContent;
    var description= div.parentElement.parentElement.children[9].value;
    var urlImage = div.parentElement.parentElement.children[1].children[0].value;
    var title = document.getElementById("Title");
    title.innerText=titre;
	
    titreM.value=titre;
    auteurM.value=auteur;
    editeurM.value=editeur;
    dateM.value=date;
    isbnM.value=isbn;
    exemplaireM.value=exemplaire;
    urlImageM.value = urlImage;
    
   for (var i = 0; i < categorieM.length; i++) {
	  if(categorieM[i].textContent == categorie){
		  categorieM[i].setAttribute("selected", "selected");

	  }
   }
    
    descriptionM.innerText=description;

}



function Visulaiser(){
   var idLivre = this.parentElement.parentElement.children[0].textContent;
   window.location.href = 'http://localhost:8080/readmore/thislivre?idLivre='+idLivre;
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
    var aff =document.getElementsByClassName("edit");
	var view = document.getElementsByClassName("view");
	var entete =document.getElementsByClassName("MesMessage");
	
	      for (var i = 0 ; i <entete.length ; i++) {
			 entete[i].addEventListener("click",RedirectionHref);;
		  }
					
          for (var i =0 ; i<res.length ; i++) {
          	res[i].addEventListener("click", Modifier);
          }
          for (var i =0 ; i<view.length ; i++) {
        	  view[i].addEventListener("click", Visulaiser);
            }          
          for (var i =0 ; i<ann.length ; i++) {
        	  ann[i].addEventListener("click", Annuler);
            }

            for (var i =0 ; i<sup.length ; i++) {
                sup[i].addEventListener("click", Supprimer);
              }
            for (var i =0 ; i<aff.length ; i++) {
                aff[i].addEventListener("click", Afficher);
              }

            
         
		
}
