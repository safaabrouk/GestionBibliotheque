package controlers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoCategorie;
import models.Livre;
import services.ServiceLivre;


@WebServlet("/ajouterlivre")
public class ServletAjouterLivre extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public ServletAjouterLivre() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/Pages/PageAjouterLivre.jsp").include(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 PrintWriter out = response.getWriter();                                                                                            //description":desc,"date":date"idCategorie":id_Categorie},
	try {
		Livre l = new Livre(Integer.parseInt(request.getParameter("nbr")),request.getParameter("isbn"),request.getParameter("titre"), request.getParameter("auteur"),request.getParameter("editeur"), Integer.parseInt(request.getParameter("date")), request.getParameter("description"), request.getParameter("url_img"),DaoCategorie.ChercherCategorieViaId( Integer.parseInt(request.getParameter("idCategorie"))));
	    int res = ServiceLivre.AjouterLivre(l);
	    out.print(res);
	} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}

}
