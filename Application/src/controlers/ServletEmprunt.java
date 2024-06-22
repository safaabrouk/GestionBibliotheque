package controlers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.ServiceEmprunt;
import services.ServiceLivre;
import services.ServiceReservation;


@WebServlet("/emprunt")
public class ServletEmprunt extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ServletEmprunt() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/Pages/PageEmprunt.jsp").include(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		int res;
		try {
			res = ServiceEmprunt.SupprimerEmprunt(Integer.parseInt(request.getParameter("idEmprunt"))); 
			if(res == 1) {
				int rs = ServiceReservation.ChangerEtatReservation(Integer.parseInt(request.getParameter("idReservation")),3);
		    	if(rs == 1) {
		    
		    		int r = ServiceLivre.ModifierNombreExemplaire((Integer.parseInt(request.getParameter("NbrExemplaire"))+1), Integer.parseInt(request.getParameter("idLivre")));
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
			e.printStackTrace();
		}

		 		    
	
	}

}
