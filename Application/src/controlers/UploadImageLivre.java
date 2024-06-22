package controlers;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class UploadImageLivre
 */
@WebServlet("/UploadImageLivre")
public class UploadImageLivre extends HttpServlet {
	private final String UPLOAD_DIRECTORY = "C:\\Users\\Asus\\eclipse-workspace\\readmore\\WebContent\\Ressources\\images\\CouvertureLivre";
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadImageLivre() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		

		 PrintWriter out = response.getWriter();
		 String url_img = "pasImage";
		 
		if(ServletFileUpload.isMultipartContent(request)){
           try {
               List<FileItem> multiparts = new ServletFileUpload(
                                        new DiskFileItemFactory()).parseRequest(request);
               for(FileItem item : multiparts){
                   /*if(!item.isFormField()){
                       File fileSaveDir = new File(UPLOAD_DIRECTORY);
                       if (!fileSaveDir.exists()) {
                           fileSaveDir.mkdir();
                       } }*/                   	
               	 String Tab[] = {"bmp","tiff","jpeg","gif","png","jpg"};
                    String name = new File(item.getName()).getName();
                    System.out.println(name);
                    String extension = name.split("\\.")[1];
                   for (int i = 0; i < Tab.length; i++) {						
                	if(extension.toLowerCase().equals(Tab[i]) ) {
                	     url_img = "Livre"+System.currentTimeMillis()+"."+extension;
                	    System.out.println(url_img);
                        item.write( new File(UPLOAD_DIRECTORY + File.separator +url_img));
                           }
						}
                  
               }
           } catch (Exception e) {
               // exception handling
           }

           out.print(url_img);
       }
		else {
			out.print("Nom");
		}
	
	
	}

}
