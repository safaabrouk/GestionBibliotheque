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
import services.ServicePersonne;

/**
 * Servlet implementation class ServletPassword
 */
@WebServlet("/password")
public class ServletPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/Pages/ChangerPassword.jsp").include(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		int resultat = 0;
		Personne p = (Personne) session.getAttribute("profil");
		if(p.getPassword().equals(request.getParameter("AncienPassword"))) {
			try {
				resultat = ServicePersonne.ModifierPasswordPersonne(request.getParameter("NouveauPassword"),p.getId());
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(resultat == 1) {
				try {
					int id_per = p.getId();
					p = ServicePersonne.ChercherPersonneViaId(id_per);
					session.setAttribute("profil", p);
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				 
			}
		}
		
		out.print(resultat);
	}

}
