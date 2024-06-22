package controlers;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import models.Personne;
import services.ServicePersonne;

/**
 * Servlet implementation class ServletProfil
 */
@WebServlet("/profil")
public class ServletProfil extends HttpServlet {
	 private final String UPLOAD_DIRECTORY = "C:\\Users\\Asus\\eclipse-workspace\\readmore\\WebContent\\Ressources\\images\\Profil";
	 private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletProfil() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/Pages/profil.jsp").include(request, response);

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		int resultat = 0;
		String operation = request.getParameter("operation"); 
		if(operation.equals("Modifier_Coordonnee")) {
			Personne p = (Personne) session.getAttribute("profil");
			if(p.getPassword().equals(request.getParameter("password"))) {
				Personne NouveauPersonne = new Personne(p.getId(), request.getParameter("nom"), request.getParameter("prenom"), request.getParameter("login"), p.getPassword(), request.getParameter("cin"), Long.parseLong(request.getParameter("tel")),p.getRole() ,p.getProfil());
			    try {
					resultat = ServicePersonne.ModifierCoordonnéePersonne(NouveauPersonne, p.getLogin());
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
			else {
				resultat = -2;
			}
		
		}
        
		else {
			//traitement photo
			try {
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
               System.out.println(multiparts);
                for(FileItem item : multiparts){
                	    System.out.println(item);
                        String Tab[] = {"bmp","tiff","jpeg","gif","png","jpg"};
                        String name = new File(item.getName()).getName();
                        String extension = name.split("\\.")[1];
                       for (int i = 0; i < Tab.length; i++) {						
                    	if(extension.toLowerCase().equals(Tab[i]) ) {
                            item.write( new File(UPLOAD_DIRECTORY + File.separator + "name."+extension));
                               }
							
						}
                       // item.setFieldName("myfile");
                }
                out.print("bienuplowd");
               //File uploaded successfully
               request.setAttribute("message", "File Uploaded Successfully");
            } catch (Exception ex) {
               request.setAttribute("message", "File Upload Failed due to " + ex);
            }          
          
        
			 
			 
			 
		}

		
		
		out.print(resultat);
	}

}
