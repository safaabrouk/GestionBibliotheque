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
import dao.DaoPersonne;
import models.Personne;
import services.ServicePersonne;
import tools.CodeSMS;
import tools.CodeTwilio;
import tools.Role;
import tools.SendMail;




@WebServlet("/authentification")
public class ServletAuthentification extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public ServletAuthentification() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/Pages/Authentification.jsp").include(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String operation = request.getParameter("operation");
		if(operation.equals("authentification")) {
					
			String login_Auth    = request.getParameter("login");
			String password_Auth = request.getParameter("password");
			
			try {
				int resultat = ServicePersonne.AuthentificationPersonne(login_Auth, password_Auth);
				String data = null ;
				if(resultat>0) {				
					HttpSession session = request.getSession();
						
						Personne p = ServicePersonne.ChercherPersonneViaId(resultat);
						if(p.getRole().equals(Role.utilisateur))
						{
						  session.setAttribute("profil", p);
						  data = "utilisateur";
						}
						else if(p.getRole().equals(Role.bibliothecaire))
						{
							  session.setAttribute("profil", p);
							  data = "bibliothecaire";
							}
						else {
							session.setAttribute("profil", p);
						}
						
						
				} else if(resultat == -2) {
					data = "email";
				}
				else {
					data="password";
				}
				
				out.print(data);
				
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
		}
		else if(operation.equals("ChercherLogin")) {
			try {
				String ModeRecuperation = request.getParameter("ModeRecuperation");
				int res = DaoPersonne.VérifierEmail(request.getParameter("loginChercher"));
				if(res > 0) {
					if(ModeRecuperation.equals("tel")) {
						   String code = CodeSMS.generateSMSCode();
						   CodeTwilio.EnvoyerSMS(code);
					       out.print(code);
					}
					else {
						String code=CodeSMS.generateSMSCode();
						SendMail.sendCode(request.getParameter("loginChercher"),code);
						out.print(code);
					}
				}
				else {
					out.print(res);
				}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		else {
			String data = null;
			try {
				int id_personne = DaoPersonne.VérifierEmail(request.getParameter("loginChercher"));
				ServicePersonne.ModifierPasswordPersonne(request.getParameter("NouveauPassword"),id_personne);
				HttpSession session = request.getSession();
				
					Personne p = ServicePersonne.ChercherPersonneViaId(id_personne);
					if(p.getRole().equals(Role.utilisateur))
					{
					  session.setAttribute("profil", p);
					  data = "utilisateur";
					}
					else if(p.getRole().equals(Role.bibliothecaire))
					{
						  session.setAttribute("profil", p);
						  data = "bibliothecaire";
						}
					else  if(p.getRole().equals(Role.admin)) {
						session.setAttribute("profil", p);
						 data = "admin";
					}
					else {
						data = "erreuuuuuuur";
					}
					
			
				
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
          out.print(data);
		}
		
	}

}
