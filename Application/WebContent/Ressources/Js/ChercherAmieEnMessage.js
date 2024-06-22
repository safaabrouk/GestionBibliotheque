

        function Chercher(){
          var valeur = document.getElementById("InputChercherAmi").value.toLowerCase();
          var choix = document.getElementsByClassName("NomPrenom");
          
        
          for (var i = 0 ; i <choix.length ; i++) {
              var MonDiv =  choix[i].parentElement.parentElement;
            if (choix[i].textContent.toLowerCase().includes(valeur)) {

              MonDiv.style.display="";
                 
            }
            else {
              MonDiv.style.display="none";
            }
 
          }
        
          
        }

