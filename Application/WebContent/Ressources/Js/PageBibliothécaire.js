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
		   }
		  if(!ree.test(valPrenom)){
			  document.getElementById("inptprenom").style.border = " solid  #ef767b";
		  }
	    
	    }
     else {

		 document.getElementById("h").innerHTML="<span id='link'> <span id='linknom'>"+valNom+"</span> <span id='linkprenom'>"+valPrenom+"</span></span><i class='fas fa-pencil-alt' id ='text' onclick='modifier_text()'></i>";

	 }
	   

	  }

}

function modifier_image(){
	document.getElementById("input").click();
    var url_img = document.getElementById("input").value;
	var nom_img=url_img.split("\\")[2];
	document.getElementById("img").style.backgroundImage= "url('image/"+nom_img+"')";
	
}

window.onload=function(){

$(document).ready(function(){
			$('#sidebarCollapse').on('click',function(){
				$('#sidebar').toggleClass('active');
			});
		});  
		document.getElementById("camera").addEventListener("click",modifier_image);
		document.getElementById("text").addEventListener("click",modifier_text);
		
}