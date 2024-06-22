<%@page import="java.util.ArrayList"%>
<%@page import="models.Livre"%>
<%@page import="dao.connexion"%>
<%@page import="dao.DaoLivre"%>
<%@page import="services.ServiceLivre"%>

<%
ArrayList<Livre> Livres = ServiceLivre.ConsulterNouveauLivres(); 
int nbr = Livres.size()<12 ? Livres.size() : 12;
%>
    

	<!-- Courses -->
	    	       <%for(int i=0; i<nbr; i++){ %>
<div class="col-lg-3   col-sm-4 cop">	
<div class="purchase text-center"> 
        <div>
          <div class="d-flex flex-row justify-content-center flex-wrap">

    
        
            <div class="Box">
              <div class="imgBox">
                <img src="./Ressources/images/CouvertureLivre/<%= Livres.get(i).getUrl_couverture() %>"> 
              </div>
              
              <div class="content">
                <h5 class="titre"><%= Livres.get(i).getTitre() %></h5>
                <p>  <%= Livres.get(i).getDescription_livre() %> </p>
              </div>
            </div>
                 
            
          </div>
        </div>
      </div>
 </div>

  
   <% }%>