package controlers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Personne;
import services.ServicePersonne;
import tools.Role;

/**
 * Servlet implementation class ServletInscription
 */
@WebServlet("/inscription")
public class ServletInscription extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public ServletInscription() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/Pages/Inscription.jsp").include(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 	
		PrintWriter out = response.getWriter();
        Personne u = new Personne(request.getParameter("nom"),request.getParameter("prenom"),request.getParameter("login"),request.getParameter("password"),request.getParameter("cin"),Long.parseLong(request.getParameter("tel")),Role.utilisateur,null);
	      try {
	    	  
			int resultat = ServicePersonne.AjouterPersonne(u,0);
			out.print(resultat);
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}                                           
	}

}
