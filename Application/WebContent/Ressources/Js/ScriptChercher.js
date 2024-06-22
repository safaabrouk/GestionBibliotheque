


        function chercher(){
          var valeur = document.getElementById("input").value.toLowerCase();
          var choix = document.getElementsByClassName("titre");
          
        
          for (var i = 0 ; i <choix.length ; i++) {
              var MonDiv =  choix[i].parentElement.parentElement.parentElement;
            if (choix[i].textContent.toLowerCase().includes(valeur)) {

              MonDiv.style.display="";
                 
            }
            else {
              MonDiv.style.display="none";
            }
 
          }
        
          
        }


        window.onload=function(){
          document.getElementById("input").addEventListener("keyup",chercher);

         
        }