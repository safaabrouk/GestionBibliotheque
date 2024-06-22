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

import models.Personne;
import models.Reservation;
import models.Utilisateur;
import services.ServiceLivre;
import services.ServiceReservation;

/**
 * Servlet implementation class livreUtilisateur
 */
@WebServlet("/livre")
public class livreUtilisateur extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public livreUtilisateur() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.getRequestDispatcher("/WEB-INF/views/Pages/Listelivre.jsp").include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		Personne p = (Personne) session.getAttribute("profil");
		Utilisateur u = new Utilisateur(p.getId(), p.getNom(), p.getPrenom(), p.getLogin(), p.getPassword(), p.getCin(), p.getTel());
		try {

			Reservation r = new Reservation(u , ServiceLivre.ChercherLivreViaId(Integer.parseInt(request.getParameter("IdLivre")))) ;
            int res = ServiceReservation.EffectuerReservation(r);
            out.print(res);
		} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}

}
