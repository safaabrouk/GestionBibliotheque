package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import com.mysql.jdbc.ResultSet;

import models.Livre;


public class DaoLivre {
	
	public static int AjouterLivre(Livre L ) throws ClassNotFoundException, SQLException  {
		int res = 0;
		connexion.connect();
		res = connexion.Maj(" INSERT INTO livre(nbr_exemplaire,isbn,titre,auteur,editeur,date_edition,description_livre,url_couverture,id_categorie,date_ajout) VALUES("+L.getNbr_exemplaire()+",'"+L.getIsbn()+"','"+L.getTitre()+"','"+L.getAuteur()+"','"+L.getEditeur()+"',"+L.getDate_edition()+",'"+L.getDescription_livre()+"','"+L.getUrl_couverture()+"',"+L.getCategorie().getId_categorie()+",now())");
		connexion.disconnect();
		return res;
	}
	
	public static int ModifierLivre(Livre L) throws ClassNotFoundException, SQLException  {
		int res = 0;
		connexion.connect();
		res = connexion.Maj("UPDATE livre SET nbr_exemplaire="+L.getNbr_exemplaire()+",isbn='"+L.getIsbn()+"',titre='"+L.getTitre()+"',auteur='"+L.getAuteur()+"',editeur='"+L.getEditeur()+"',date_edition="+L.getDate_edition()+",description_livre='"+L.getDescription_livre()+"',url_couverture='"+L.getUrl_couverture()+"',id_categorie='"+L.getCategorie().getId_categorie()+"' WHERE id_livre="+L.getId_livre()+"" + "");
		connexion.disconnect();
		return res;
	}
	
	public static int SupprimerLivre(int id ) throws ClassNotFoundException, SQLException  {
		int res = 0;
		connexion.connect();
		res = connexion.Maj("DELETE FROM livre where id_livre="+id);
		connexion.disconnect();
		return res;
	}
	
	public static ArrayList<Livre> ConsulterLivres() throws ClassNotFoundException, SQLException {
		ArrayList<Livre> livres = new ArrayList<Livre>();
		connexion.connect();
		ResultSet res = connexion.Select("SELECT * FROM livre");
		connexion.disconnect();
		try {
		   while (res.next()) 
		   {
			  Livre l= new Livre(res.getInt(1),res.getInt(2),res.getString(3),res.getString(4),res.getString(5),res.getString(6),res.getInt(7),res.getString(8),res.getString(9),DaoCategorie.ChercherCategorieViaId(res.getInt(10)),res.getTimestamp(11));
			  livres.add(l);			
		   }
		}catch(SQLException e){
			e.printStackTrace();
			
		}
		return livres;
	}
	
	public static ArrayList<Livre> ConsulterNouveauLivres() throws ClassNotFoundException, SQLException {
		ArrayList<Livre> livres = new ArrayList<Livre>();
		connexion.connect();
		ResultSet res = connexion.Select("SELECT * FROM livre ORDER BY id_livre DESC");
		connexion.disconnect();
		try {
		   while (res.next()) 
		   {
			  Livre l= new Livre(res.getInt(1),res.getInt(2),res.getString(3),res.getString(4),res.getString(5),res.getString(6),res.getInt(7),res.getString(8),res.getString(9),DaoCategorie.ChercherCategorieViaId(res.getInt(10)),res.getTimestamp(11));
			  livres.add(l);			
		   }
		}catch(SQLException e){
			e.printStackTrace();
			
		}
		return livres;
	}
	
	public static Livre ChercherLivreViaId(int id) throws ClassNotFoundException, SQLException {
		Livre l=null;		
		connexion.connect();
		ResultSet res = connexion.Select("select * from livre where id_livre ="+id);
		connexion.disconnect();
		if(res.next()) {
			  l= new Livre(res.getInt(1),res.getInt(2),res.getString(3),res.getString(4),res.getString(5),res.getString(6),res.getInt(7),res.getString(8),res.getString(9),DaoCategorie.ChercherCategorieViaId(res.getInt(10)),res.getTimestamp(11));
		}
		return l;
	 }
	
	public static ArrayList<Livre> ChercherLivreViaIdCategorie(int id) throws ClassNotFoundException, SQLException {
		ArrayList<Livre> livres = new ArrayList<Livre>();
		connexion.connect();
		ResultSet res = connexion.Select("select * from livre where id_categorie ="+id);
		connexion.disconnect();
		try {
			   while (res.next()) 
			   {
				  Livre l= new Livre(res.getInt(1),res.getInt(2),res.getString(3),res.getString(4),res.getString(5),res.getString(6),res.getInt(7),res.getString(8),res.getString(9),DaoCategorie.ChercherCategorieViaId(res.getInt(10)),res.getTimestamp(11));
				  livres.add(l);			
			   }
			}catch(SQLException e){
				e.printStackTrace();
				
			}
		return livres;
	 }
    
	public static Livre ChercherLivreViaTitre(String titre) throws ClassNotFoundException, SQLException {
    	Livre l=null;		
		connexion.connect();
		ResultSet res = connexion.Select("select * from livre where  titre ='"+titre+"'");
		connexion.disconnect();
		if(res.next()) {
			  l= new Livre(res.getInt(1),res.getInt(2),res.getString(3),res.getString(4),res.getString(5),res.getString(6),res.getInt(7),res.getString(8),res.getString(9),DaoCategorie.ChercherCategorieViaId(res.getInt(10)),res.getTimestamp(11));
		   }
		return l;
	 }
    
	public static Livre ChercherLivreViaAuteur(String auteur) throws ClassNotFoundException, SQLException {
    	Livre l=null;		
		connexion.connect();
		ResultSet res = connexion.Select("select * from livre where  auteur='"+auteur+"'");
		connexion.disconnect();
		if(res.next()) {
			  l= new Livre(res.getInt(1),res.getInt(2),res.getString(3),res.getString(4),res.getString(5),res.getString(6),res.getInt(7),res.getString(8),res.getString(9),DaoCategorie.ChercherCategorieViaId(res.getInt(10)),res.getTimestamp(11));
		   }
		return l;
	 }
	
	public static int ModifierNombreExemplaire(int nbr, int idLivre) throws ClassNotFoundException, SQLException {
		int res = 0;
		connexion.connect();
		res = connexion.Maj("UPDATE livre SET nbr_exemplaire = "+nbr+" WHERE id_livre = "+idLivre+"");
		connexion.disconnect();
		
		return res;
	}
}
