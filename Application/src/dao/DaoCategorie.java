package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import com.mysql.jdbc.ResultSet;

import models.Categorie;

public class DaoCategorie {
	public static int AjouterCategorie(Categorie C ) throws ClassNotFoundException, SQLException  {
		int res = 0;
		connexion.connect();
		res = connexion.Maj("INSERT INTO categorie(nom_categorie,description_categorie,url_couverture) VALUES('"+C.getNom_categorie()+"','"+C.getDescription_categorie()+"','"+C.getUrl_couverture()+"')");
		connexion.disconnect();
		return res;
	}
	
	public static int ModifierCategorie(Categorie C) throws ClassNotFoundException, SQLException  {
		int res = 0;
		connexion.connect();
		res = connexion.Maj("UPDATE categorie set nom_categorie='"+C.getNom_categorie()+"' , description_categorie='"+C.getDescription_categorie()+"',url_couverture='"+C.getUrl_couverture()+"' where id_categorie="+C.getId_categorie());
		connexion.disconnect();
		return res;
	}
	
	public static int SupprimerCategorie(int id ) throws ClassNotFoundException, SQLException  {
		int res = 0;
		connexion.connect();
		res = connexion.Maj("DELETE FROM categorie where id_categorie="+id);
		connexion.disconnect();
		return res;
	}
	
	public static ArrayList<Categorie> ConsulterCategories() throws ClassNotFoundException, SQLException {
		ArrayList<Categorie> categories = new ArrayList<Categorie>();
		connexion.connect();
		ResultSet res = connexion.Select("SELECT * FROM categorie");
		connexion.disconnect();
		try {
		   while (res.next()) 
		   {
			   Categorie c= new Categorie(res.getInt(1),res.getString(2),res.getString(3),res.getString(4),DaoLivre.ChercherLivreViaIdCategorie(res.getInt(1)));
			   categories.add(c);			
		   }
		}catch(SQLException e){
			e.printStackTrace();
			
		}
		return categories;
	}
	
	public static Categorie ChercherCategorieViaId(int id) throws ClassNotFoundException, SQLException {
		Categorie c=null;		
		connexion.connect();
		ResultSet res = connexion.Select("select * from categorie where id_categorie ="+id);
		connexion.disconnect();
		if(res.next()) {
		    c= new Categorie(res.getInt(1),res.getString(2),res.getString(3),res.getString(4));
		}
		
		return c;
	 }
   
	public static Categorie ChercherCategorieViaNom(String nom) throws ClassNotFoundException, SQLException {
    	Categorie c=null;		
		connexion.connect();
		ResultSet res = connexion.Select("select * from categorie where nom_categorie ='"+nom+"'");
		connexion.disconnect();
		if(res.next()) {
			c= new Categorie(res.getInt(1),res.getString(2),res.getString(3),res.getString(4));
		}		
		return c;
	 }
}
