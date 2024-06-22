package controlers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Livre;
import models.Reservation;
import services.ServiceCategorie;
import services.ServiceLivre;
import services.ServiceReservation;


/**
 * Servlet implementation class ServletBibliothecaireLivre
 */
@WebServlet("/listelivre")
public class ServletBibliothecaireLivre extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletBibliothecaireLivre() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("WEB-INF/views/Pages/PageLivreBibilothecaire.jsp").include(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String operation = request.getParameter("operation");
		if(operation.equals("supprimer")) {
		  try {
			  ArrayList<Reservation> R = ServiceReservation.ChercherReservationViaIdLivre(Integer.parseInt(request.getParameter("id_livre")));
			  if (R.isEmpty()) {
				  int res = ServiceLivre.SupprimerLivre(Integer.parseInt(request.getParameter("id_livre")));
					out.print(res);
			}
			
		} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		}
		else if(operation.equals("modifier")) {
			Livre L=null;
			try {
				L = new Livre(Integer.parseInt(request.getParameter("exemplaire")),request.getParameter("isbn"), request.getParameter("titre"), request.getParameter("auteur"), request.getParameter("editeur"), Integer.parseInt(request.getParameter("date")), request.getParameter("description"), request.getParameter("url_img"),ServiceCategorie.ChercherCategorieViaId(Integer.parseInt(request.getParameter("id_Categorie"))));
			} catch (NumberFormatException | ClassNotFoundException | SQLException e1) {
				e1.printStackTrace();
			}
			  try {
				int resultat = ServiceLivre.ModifierLivre(L);
				out.print(resultat);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

}
