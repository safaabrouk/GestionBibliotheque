package controlers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.ServicePersonne;
import services.ServiceProfil;


@WebServlet("/bibliothecaires")
public class ServletGestionBibliothecaire extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ServletGestionBibliothecaire() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/Pages/PageListeBibliothecaire.jsp").include(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String operation = request.getParameter("operation");
		PrintWriter out = response.getWriter();
		if(operation.equals("valider")) {
			try {
				int res = ServiceProfil.ChangerEtatProfil(Integer.parseInt(request.getParameter("idProfil")), 1);
				out.print(res);
			} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
					
		
		}
		else if(operation.equals("desactiver")) {
			try {
				int res = ServiceProfil.ChangerEtatProfil(Integer.parseInt(request.getParameter("idProfil")), -1);
				out.print(res);
			} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
					
		}
		else if(operation.equals("activer")){
			try {
				int res = ServiceProfil.ChangerEtatProfil(Integer.parseInt(request.getParameter("idProfil")), 1);
				out.print(res);
			} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
					
		}
		
		else {
			
			try {
				int res = ServicePersonne.SupprimerPersonne(Integer.parseInt(request.getParameter("idPersonne")), Integer.parseInt(request.getParameter("idProfil")));
			    out.print(res);
			} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}

}
