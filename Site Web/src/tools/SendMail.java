package tools;

import java.util.Properties;


import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {

	public static void sendCode(String login, String code) {
		
		final String username = "biblio.readmore2020@gmail.com";
		final String password = "mimisofisafaa1999";
      Properties props = new Properties();
      props.put("mail.smtp.host", "smtp.gmail.com");    
      props.put("mail.smtp.port", "465");    
      props.put("mail.smtp.auth", "true");    
      props.put("mail.smtp.socketFactory.port", "465");    
      props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");     
      
      Session session = Session.getInstance(props,
    		  new javax.mail.Authenticator(){
    	   protected PasswordAuthentication getPasswordAuthentication() {
    		   return new PasswordAuthentication(username,password);
    	   }
      });
   
     try {
    	 
    	 Message message = new MimeMessage(session);
    	 message.setFrom(new InternetAddress("from@gmail.com"));
    	 message.setRecipients(
    			 Message.RecipientType.TO,
    			 InternetAddress.parse(login)
    			 );
    	 message.setSubject("Recuperer votre mot de passe ");
    	 message.setText("Nous avons re�u une demande de r�initialisation de votre mot de passe \n" + 
    	 		"Entrez le code de r�initialisation du mot de passe suivant : \n"+code);
    	  Transport.send(message);
		
	} catch (MessagingException e) {
		
		e.printStackTrace();
		
	}
     
     
	}
	
}



