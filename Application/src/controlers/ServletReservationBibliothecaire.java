package controlers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Bibliothecaire;
import models.Emprunt;
import models.Livre;
import models.Personne;
import models.Reservation;
import services.ServiceEmprunt;
import services.ServiceLivre;
import services.ServiceReservation;

/**
 * Servlet implementation class ServletReservationBibliothecaire
 */
@WebServlet("/reservations")
public class ServletReservationBibliothecaire extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ServletReservationBibliothecaire() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//
		request.getRequestDispatcher("/WEB-INF/views/Pages/PageReservationBibliothecaire.jsp").include(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		String operation = request.getParameter("operation");
		if(operation.equals("supprimer")) {
			try {
				int res = ServiceReservation.ChangerEtatReservation(Integer.parseInt(request.getParameter("idReservation")),-1);
			    out.print(res);
			} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			try {
				Reservation R = new Reservation(Integer.parseInt(request.getParameter("idReservation")), 1, null,Integer.parseInt(request.getParameter("NbrExemplaire")), null, null);
				int res = ServiceReservation.ModifierReservation(R);
				 if(res == 1) {
				    	HttpSession session = request.getSession();
				    	Personne p = (Personne) session.getAttribute("profil");
				    	Bibliothecaire b = new Bibliothecaire(p.getId());
				    	Livre l = new Livre(Integer.parseInt(request.getParameter("idLivre")));
				    	Emprunt E = new Emprunt(Integer.parseInt(request.getParameter("NbrExemplaire")),b,l);
				    	int rs = ServiceEmprunt.AjouterEmprunt(E);
				    	if(rs == 1) {
				    
				    		int r = ServiceLivre.ModifierNombreExemplaire((Integer.parseInt(request.getParameter("NbrExemplaire"))-1), Integer.parseInt(request.getParameter("idLivre")));
				    	    out.print(r);
				    	}
				    	else {
				    		 out.print(rs);
				    	}
				    	
				    }
				    else {
				    	out.print(res);
				    }
				    
			} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	
	}

}
