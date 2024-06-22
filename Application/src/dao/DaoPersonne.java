package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import com.mysql.jdbc.ResultSet;
import models.Personne;
import models.Utilisateur;
import tools.Role;


public class DaoPersonne {

	public static int AjouterPersonne(Personne u, int id_profil) throws ClassNotFoundException, SQLException {
		
		int resultat = 0 ;
		String sql = " INSERT INTO personne(nom_personne,prenom_personne,login_personne,password_personne,cin_personne,tel_personne,role_personne,date_inscr_personne,id_profil) VALUES ('"+u.getNom()+"','"+u.getPrenom()+"','"+u.getLogin()+"','"+u.getPassword()+"','"+u.getCin()+"',"+u.getTel()+",'"+u.getRole()+"',now(),"+id_profil+")";
		connexion.connect();
		resultat = connexion.Maj(sql);		
		connexion.disconnect();
		
		return resultat;		
	}
	
  public static int VérifierEmail(String login) throws ClassNotFoundException, SQLException {
		
		ResultSet res;
		int rs = 0;
		
		connexion.connect();
		res = connexion.Select("select id_personne from personne WHERE Login_personne  ='"+login+"' ");
		connexion.disconnect();
		if(res.next()) {
			rs = res.getInt(1);
		}
		
		return rs;
	 }
  
  public static int VérifierEmail_Password(String login, String password) throws ClassNotFoundException, SQLException {
		
		ResultSet res;
		int rs = 0;
		
		connexion.connect();
		res = connexion.Select("select id_personne from personne WHERE Login_personne  ='"+login+"' and Password_personne  ='"+password+"' ");
		connexion.disconnect();
		if(res.next()) {
			rs = res.getInt(1);
		}
		
		return rs;
	 }

  public static ArrayList<Personne> ConsulterPersonne() throws SQLException, ClassNotFoundException {

	  ArrayList<Personne> resultat = new ArrayList<Personne>();
	  
	  connexion.connect();
		ResultSet res = connexion.Select("select * from personne ");
		connexion.disconnect();
		Role role;
		while (res.next()) {
			if(res.getString(8).equals("utilisateur")) {
				role = Role.utilisateur;
			}
			else if(res.getString(8).equals("bibliothecaire")) {
				role = Role.bibliothecaire;
			}
			else {
				role = Role.admin;
			}
			
			Personne personne = new Personne(res.getInt(1),res.getString(2), res.getString(3), res.getString(4),res.getString(5), res.getString(6), res.getInt(7), role ,DaoProfil.ConsulterProfil(res.getInt(10)));
			resultat.add(personne);
		}
		
	  return resultat;
  }

  
  public static int modifierPersonne(Personne p) throws ClassNotFoundException, SQLException {
		 int rs ;
		                                          
		 connexion.connect();
		 rs = connexion.Maj( "update personne set nom_personne ='"+p.getNom()+"',prenom_personne ='"+p.getPrenom()+"', login_personne = '"+p.getLogin()+"',cin_personne = '"+p.getCin()+"',tel_personne ="+p.getTel()+" WHERE id_personne = "+p.getId()+" ");
		 connexion.disconnect();
		 return rs;
	 }
  
    
	public static Personne ChercherPersonneViaId(int id_personne) throws SQLException, ClassNotFoundException {
		 
		  Personne resultat = null ;
		  
		  connexion.connect();
			ResultSet res = connexion.Select("select * from personne where id_personne ='"+id_personne+"' ");
			connexion.disconnect();
			Role role;
			if(res.next()) {
				if(res.getString(8).equals("utilisateur")) {
					role = Role.utilisateur;
				}
				else if(res.getString(8).equals("bibliothecaire")) {
					role = Role.bibliothecaire;
				}
				else {
					role = Role.admin;
				}
				
			
				resultat = new Personne(res.getInt(1),res.getString(2), res.getString(3), res.getString(4),res.getString(5), res.getString(6), res.getInt(7), role ,DaoProfil.ConsulterProfil(res.getInt(10)));

			
	}
   return resultat;
 }
  
  
	
	
	public static Utilisateur ChercherUtilisateurViaId(int id_personne) throws SQLException, ClassNotFoundException {
		 
		Utilisateur resultat = null ;
		  
		  connexion.connect();
			ResultSet res = connexion.Select("SELECT * FROM personne where id_personne = "+id_personne+" and role_personne = 'utilisateur' " );
			connexion.disconnect();
			if(res.next()) {
				resultat = new Utilisateur(res.getInt(1), res.getString(2), res.getString(3), res.getString(4), res.getString(5), res.getString(6), res.getInt(7),DaoProfil.ConsulterProfil(res.getInt(10)));
	                       }
             return resultat;
}
	 
	  public static int modifierPasswordPersonne(String password,int id_per) throws ClassNotFoundException, SQLException {
			 int rs ;
			                                          
			 connexion.connect();
			 rs = connexion.Maj( "update personne set password_personne = '"+password+"' WHERE id_personne = "+id_per+" ");
			 connexion.disconnect();
			 return rs;
		 }
	  
	
	  public static ArrayList<Personne> ConsulterListesUtilisateurs() throws SQLException, ClassNotFoundException {

		  ArrayList<Personne> resultat = new ArrayList<Personne>();
		  
		  connexion.connect();
			ResultSet res = connexion.Select("select * from personne where role_personne = 'utilisateur'");
			connexion.disconnect();
			while (res.next()) {				
				Personne personne = new Personne(res.getInt(1),res.getString(2), res.getString(3), res.getString(4),res.getString(5), res.getString(6), res.getInt(7), Role.utilisateur ,DaoProfil.ConsulterProfil(res.getInt(10)));
			    resultat.add(personne);
			}
			
		  return resultat;
	  }
	
	
	public static int SupprimerPersonne(int idPersonne) throws ClassNotFoundException, SQLException {
		
		 connexion.connect();
		 int res = connexion.Maj("DELETE FROM personne WHERE id_personne = "+idPersonne+" ");		
		 connexion.disconnect();
		 return res;
		
	}
	
	
	  public static ArrayList<Personne> ConsulterListesBibliothecaires() throws SQLException, ClassNotFoundException {

		  ArrayList<Personne> resultat = new ArrayList<Personne>();
		  
		  connexion.connect();
			ResultSet res = connexion.Select("select * from personne where role_personne = 'bibliothecaire'");
			connexion.disconnect();
			while (res.next()) {				
				Personne personne = new Personne(res.getInt(1),res.getString(2), res.getString(3), res.getString(4),res.getString(5), res.getString(6), res.getInt(7), Role.utilisateur ,DaoProfil.ConsulterProfil(res.getInt(10)));
			    resultat.add(personne);
			}
			
		  return resultat;
	  }
	
	
	
}
