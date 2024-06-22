package dao;

import java.sql.SQLException;
import com.mysql.jdbc.ResultSet;
import models.Bibliothecaire;


public class DaoBibliothecaire {


	public static int ChercherBibliothecaireViaEmail(String login_personne) throws ClassNotFoundException, SQLException {
		
		ResultSet res;
		int rs = 0;
		
		connexion.connect();
		res = connexion.Select("select id_bibliothecaire from personne where role=bibliothecaire and login_personne ='"+login_personne+"' ");
		connexion.disconnect();
		if(res.next()) {
			rs = res.getInt(1);
		}
		
		return rs;
	 }
	
	
   public static int ChercherBibliothecaireViaLogin_Password(String login_personne, String password_personne) throws ClassNotFoundException, SQLException {
		
		ResultSet res ;
		int rs = 0;

		connexion.connect();
		res = connexion.Select("select id_bibliothecaire from personne where role=bibliothecaire and login_personne ='"+login_personne+"' and password_personne='"+password_personne+"' ");
		connexion.disconnect();
		if(res.next()) {
			rs = res.getInt(1);
		}
		
		return rs;
	 }


   public static int  ChercherBibliothecaireViaPassword(String password_personne) throws ClassNotFoundException, SQLException {
	
	  ResultSet res ;
	  int rs = 0;

	connexion.connect();
	res = connexion.Select("select id_bibliothecaire from personne where role=bibliothecaire and password_personne='"+password_personne+"' ");
	connexion.disconnect();
	if(res.next()) {
		rs = res.getInt(1);
	}
	
	return rs;
 }


 
 public static Bibliothecaire ChercherBibliothecaireViaId(int id) throws ClassNotFoundException, SQLException {
	 Bibliothecaire b=null;		
		connexion.connect();
		ResultSet res = connexion.Select("select * from personne where  id_personne = "+id+" ");
		connexion.disconnect();
		if(res.next()) {
			b = new Bibliothecaire(res.getInt(1),res.getString(2), res.getString(3), res.getString(4), res.getString(5), res.getString(6), res.getLong(7), DaoProfil.ConsulterProfil(res.getInt(10)));
		}
		
		return b;
	 }
 

}
