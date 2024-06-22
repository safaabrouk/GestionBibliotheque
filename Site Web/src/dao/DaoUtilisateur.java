package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.ResultSet;
import models.Utilisateur;


public class DaoUtilisateur {
public static int ChercherUtilisateurViaEmail(String e_mail) throws ClassNotFoundException, SQLException {
		
		ResultSet res;
		int rs = 0;
		
		connexion.connect();
		res = connexion.Select("select id_utilisateur from utilisateur where e_mail ='"+e_mail+"' ");
		connexion.disconnect();
		if(res.next()) {
			rs = res.getInt(1);
		}
		
		return rs;
	 }
	
	
   public static int ChercherUtilisateurViaEmail_MotDePasse(String e_mail, String mot_de_passe) throws ClassNotFoundException, SQLException {
		
		ResultSet res ;
		int rs = 0;

		connexion.connect();
		res = connexion.Select("select id_utilisateur from utilisateur where e_mail ='"+e_mail+"' and mot_de_passe='"+mot_de_passe+"' ");
		connexion.disconnect();
		if(res.next()) {
			rs = res.getInt(1);
		}
		
		return rs;
	 }


   public static int  ChercherUtilisateurViaMotDePasse(String mot_de_passe) throws ClassNotFoundException, SQLException {
	
	  ResultSet res ;
	  int rs = 0;

	connexion.connect();
	res = connexion.Select("select id_utilisateur from utilisateur where mot_de_passe='"+mot_de_passe+"' ");
	connexion.disconnect();
	if(res.next()) {
		rs = res.getInt(1);
	}
	
	return rs;
 }
   
   
   public static Utilisateur  testAuthentificationUtilisateur(String e_mail, String mot_de_passe) throws ClassNotFoundException, SQLException {
		
		  ResultSet res ;
		  Utilisateur u=null;

		connexion.connect();
		res = connexion.Select("select * from utilisateur where where e_mail ='"+e_mail+"' and mot_de_passe='"+mot_de_passe+"' ");
		if(res.next()) {
		
		}
		
		return u;
	 }
	
   
   public static int AjouterUtilisateur(Utilisateur U ) throws ClassNotFoundException, SQLException  {
		int res = 0;
		connexion.connect();
		res = connexion.Maj("INSERT INTO `readmore`.`utilisateur` VALUES  (null,'"+U.getNom()+"')");
		connexion.disconnect();
		return res;
	}
	public static int SupprimerUtilisateur(int id ) throws ClassNotFoundException, SQLException  {
		int res = 0;
		connexion.connect();
		res = connexion.Maj("DELETE FROM `readmore`.`utilisateur` id_message="+id);
		connexion.disconnect();
		return res;
	}
	public static int SupprimerTousUtilisateur(int[] ids) throws ClassNotFoundException, SQLException {
		connexion.connect();
		int res=1;
		String sql = "DELETE FROM `readmore`.`utilisateur` WHERE id_utilisateur=";
		
		for(int i=0; i<ids.length; i++) {
			if(res == 1) {
				res = connexion.Maj(sql+ids[i]);
			}	
		}
		connexion.disconnect();
		return res;
	}

	public static List<Utilisateur> ConsulterUtilisateur() throws ClassNotFoundException, SQLException {
		List<Utilisateur> utilisateurs = new ArrayList<Utilisateur>();
		connexion.connect();
		ResultSet res = connexion.Select("SELECT * FROM `readmore`.`utilisateur");
		try {
		   while (res.next()) 
		   {
			   Utilisateur m= new Utilisateur();
			   utilisateurs.add(m);			
		   }
		}catch(SQLException e){
			e.printStackTrace();
			
		}
		return utilisateurs;
	}



}
