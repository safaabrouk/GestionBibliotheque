package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import com.mysql.jdbc.ResultSet;
import models.Emprunt;

public class DaoEmprunt {
	public static int AjouterEmprunt(Emprunt E ) throws ClassNotFoundException, SQLException  {
		int res = 0;
		connexion.connect();
		res = connexion.Maj("INSERT INTO emprunt(date_emprunt,numero_exemplaire,id_bibliothecaire,id_livre) VALUES(now(),"+E.getNumero_exemplaire()+","+E.getBibliothecaire().getId_bibliothecaire()+","+E.getLivre().getId_livre()+")");
		connexion.disconnect();
		return res;
	}
	
	public static int SupprimerEmprunt(int id ) throws ClassNotFoundException, SQLException  {
		int res = 0;
		connexion.connect();
		res = connexion.Maj("DELETE FROM emprunt where id_emprunt ="+id+" ");
		connexion.disconnect();
		return res;
	}
	
	public static int ModifierEmprunt(Emprunt E) throws ClassNotFoundException, SQLException  {
		int res = 0;
		connexion.connect();
		res = connexion.Maj("UPDATE emprunt set date_emprunt="+E.getDate_emprunt()+", id_bibliothecaire="+E.getBibliothecaire().getId_bibliothecaire()+" ,id_livre="+E.getLivre().getId_livre()+" where id_emprunt="+E.getId_emprunt());
		connexion.disconnect();
		return res;
	}
	
	public static ArrayList<Emprunt> ConsulterEmprunts() throws ClassNotFoundException, SQLException {
		ArrayList<Emprunt> emprunts = new ArrayList<Emprunt>();
		connexion.connect();
		ResultSet res = connexion.Select("SELECT * FROM emprunt");
		connexion.disconnect();
		try {
		   while (res.next()) 
		   {
			   Emprunt e= new Emprunt(res.getInt(1),res.getTimestamp(2),res.getInt(3),DaoBibliothecaire.ChercherBibliothecaireViaId(res.getInt(4)),DaoLivre.ChercherLivreViaId(res.getInt(5)));
			   emprunts.add(e);			
		   }
		}catch(SQLException e){
			e.printStackTrace();
			
		}
		return emprunts;
	}
	
	public static Emprunt ChercherEmpruntViaId(int id) throws ClassNotFoundException, SQLException {
		Emprunt e=null;		
		connexion.connect();
		ResultSet res = connexion.Select("select * from emprunt where id_emprunt ="+id);
		connexion.disconnect();
		if(res.next()) {
			e= new Emprunt(res.getInt(1),res.getTimestamp(2),res.getInt(3),DaoBibliothecaire.ChercherBibliothecaireViaId(res.getInt(4)),DaoLivre.ChercherLivreViaId(res.getInt(5)));		}
		return e;
	 }
	

}
