package controlers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DaoPersonne;
import models.Message;
import models.Personne;
import services.ServiceMessage;

/**
 * Servlet implementation class ServletContacter
 */
@WebServlet("/messages")
public class ServletContacter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletContacter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/Pages/ContacterAdmin.jsp").include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String operation = request.getParameter("operation");
		if(operation.equals("changer_etat")) {

			
			try {
				ServiceMessage.ChangerEtatMessage(Integer.parseInt(request.getParameter("id_envoyer")));
			} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}
		else {
			/*"":Sujet,"":Content*/
			HttpSession session = request.getSession();
			 Personne personne_envoyer = (Personne) session.getAttribute("profil");
			 try {
				Message NouveauMsg = new Message(request.getParameter("SujetMsg"), request.getParameter("ContentMsg"),personne_envoyer, DaoPersonne.ChercherPersonneViaId( Integer.parseInt(request.getParameter("IdEnvoyer"))));
			    ServiceMessage.EnvoyerMessage(NouveauMsg);
			 
			 } catch (NumberFormatException | ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
             
		}
		
		
	}

}
