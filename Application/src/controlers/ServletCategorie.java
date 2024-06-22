package controlers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Categorie;
import services.ServiceCategorie;

/**
 * Servlet implementation class ServletCategorie
 */
@WebServlet("/categorie")
public class ServletCategorie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCategorie() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/WEB-INF/views/Pages/PageCategorie.jsp").include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String operation = request.getParameter("operation");
		if(operation.equals("supprimer")) {
		  try {
			int res = ServiceCategorie.SupprimerCategorie(Integer.parseInt(request.getParameter("id_categorie")));
			out.print(res);
		} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		else if(operation.equals("modifier")) {
			Categorie C = new Categorie(Integer.parseInt(request.getParameter("id")), request.getParameter("nom"), request.getParameter("description"), request.getParameter("url_img"));
		  try {
			int resultat = ServiceCategorie.ModifierCategorie(C);
			out.print(resultat);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		
		else {
			Categorie C = new Categorie(request.getParameter("nom"),request.getParameter("description"),request.getParameter("url_img"));
			int res = 0;
			try {
				 res = ServiceCategorie.AjouterCategorie(C);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			out.print(res);
		}
	}

}
