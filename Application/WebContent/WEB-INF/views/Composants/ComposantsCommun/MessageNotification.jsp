<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="services.ServiceMessage"%>
<%@page import="services.ServicePersonne"%>
<%@page import="models.Message"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tools.Role"%>
<%@page import="models.Personne"%>
 <% 
 
 Personne MyProf = (Personne) session.getAttribute("profil"); 
 if(MyProf != null){
 ArrayList<Message> listesMessages = ServiceMessage.ConsulterMessagesSansDuplication(MyProf.getId());
 int nbr = listesMessages.size()<5 ? listesMessages.size() : 5;
 Date d = new Date();
 SimpleDateFormat s ;
 %>  

  <%for(int i=0;i<nbr;i++){ %>  
 

<a href="#" class="listview__item message MesMessage">
      <input class="id_envoyer" name="id_envoyer" type="hidden" value="<%=listesMessages.get(i).getPersonne_envoyer().getId() %>">
     <img src="./Ressources/images/Profil/<%=listesMessages.get(i).getPersonne_envoyer().getProfil().getUrl_image() %>" class="listview__img" alt="">
        <div class="listview__content">
            <div class="listview__heading">
	              <%=listesMessages.get(i).getPersonne_envoyer().getNom() %>  <%=listesMessages.get(i).getPersonne_envoyer().getPrenom() %>
	              <% d.setTime(listesMessages.get(i).getDate_envoie().getTime()); 
	              String date = new SimpleDateFormat("dd/MM/yyyy").format(d);
	              String time = new SimpleDateFormat("hh:mm:ss").format(d);
	              %> 
	             
	              <small><%=date %></small>
	              <br>
	              <small><%=time %></small>           
            </div>
            <%if(listesMessages.get(i).getEtat_message() == -1){ %>
            <B>  <%=listesMessages.get(i).getSujet_message() %> </B>
            <% }
            else { %>
            <p> <%=listesMessages.get(i).getSujet_message() %></p>
            <%} %>
        </div>
</a>
  <% }%>    
  
  <% }%>