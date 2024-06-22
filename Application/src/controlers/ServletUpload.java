package controlers;

import java.io.File;
import java.io.IOException;
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
import models.Profil;
import services.ServicePersonne;
import services.ServiceProfil;

/**
 * Servlet implementation class ServletUpload
 */
@WebServlet("/upload")
public class ServletUpload extends HttpServlet {
	private final String UPLOAD_DIRECTORY = "C:\\Users\\Asus\\eclipse-workspace\\readmore\\WebContent\\Ressources\\images\\Profil";
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletUpload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/Pages/MonProfil.jsp").include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Personne p = (Personne) session.getAttribute("profil");
		
		String url_img = p.getProfil().getUrl_image();
		 //process only if its multipart content
        if(ServletFileUpload.isMultipartContent(request)){
            try {
                List<FileItem> multiparts = new ServletFileUpload(
                                         new DiskFileItemFactory()).parseRequest(request);

                for(FileItem item : multiparts){
                	   System.out.println(item);
                        String Tab[] = {"bmp","tiff","jpeg","gif","png","jpg"};
                        String name = new File(item.getName()).getName();
                        System.out.println(name);
                        String extension = name.split("\\.")[1];
                       for (int i = 0; i < Tab.length; i++) {						
                    	if(extension.toLowerCase().equals(Tab[i]) ) {
                    	    url_img = "profil"+System.currentTimeMillis()+"."+extension;
                    	    System.out.println(url_img);
                            item.write( new File(UPLOAD_DIRECTORY + File.separator +url_img));
                               }
						}
                       
                       //item.setFieldName("myfile");                  
			            Profil profil = new Profil(p.getProfil().getId_profil(), p.getProfil().getStatut(),url_img);
			            ServiceProfil.ModifierProfil(profil);
			    		 int id_per = p.getId();
						 p = ServicePersonne.ChercherPersonneViaId(id_per);
						 session.setAttribute("profil", p);
						 request.getServletContext().getRequestDispatcher("/monprofil").forward(request, response);

                }
            
               //File uploaded successfully
 
               request.setAttribute("message", "File Uploaded Successfully");

 
            } catch (Exception ex) {
               request.setAttribute("message", "File Upload Failed due to " + ex);
            }          
          
        }else{
            request.setAttribute("message",
                                 "Sorry this Servlet only handles file upload request");
        }
		
	}

}
