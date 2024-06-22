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


@WebServlet("/ajouterbibliothecaire")
public class ServletAjouterBibliothecaire extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ServletAjouterBibliothecaire() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/Pages/PageAjoutBibliothecaire.jsp").include(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
        Personne u = new Personne(request.getParameter("nom"),request.getParameter("prenom"),request.getParameter("login"),request.getParameter("password"),request.getParameter("cin"),Long.parseLong(request.getParameter("tel")),Role.bibliothecaire,null);
	      try {
	    	  
			int resultat = ServicePersonne.AjouterPersonne(u,1);
			out.print(resultat);
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}                                           
	}

}
