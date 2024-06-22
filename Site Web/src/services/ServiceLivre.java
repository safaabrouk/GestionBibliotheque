package services;

import java.sql.SQLException;
import java.util.ArrayList;
import dao.DaoLivre;
import models.Livre;


public class ServiceLivre {
	public static int AjouterLivre(Livre L) throws ClassNotFoundException, SQLException{
		return DaoLivre.AjouterLivre(L);
	}
	public static int SupprimerLivre(int id) throws ClassNotFoundException, SQLException{
		return DaoLivre.SupprimerLivre(id);
	}
	public static int ModifierLivre(Livre L) throws ClassNotFoundException, SQLException{
		return DaoLivre.ModifierLivre(L);
	}
	public static ArrayList<Livre> ConsulterLivres() throws ClassNotFoundException, SQLException{
		return DaoLivre.ConsulterLivres();
	}
	
	public static ArrayList<Livre> ConsulterNouveauLivres() throws ClassNotFoundException, SQLException{
		return DaoLivre. ConsulterNouveauLivres();
	}
	
	public static Livre ChercherCategorieViaTitre(String titre) throws ClassNotFoundException, SQLException {
		return DaoLivre.ChercherLivreViaTitre(titre);
	}
	public static Livre ChercherCategorieViaAuteur(String auteur) throws ClassNotFoundException, SQLException {
		return DaoLivre.ChercherLivreViaAuteur(auteur);
	}
	public static Livre ChercherLivreViaId(int id) throws ClassNotFoundException, SQLException {
		return DaoLivre.ChercherLivreViaId(id);
	}
    public static int ModifierNombreExemplaire(int nbr,int idLivre) throws ClassNotFoundException, SQLException {
    	return DaoLivre.ModifierNombreExemplaire(nbr, idLivre);
    } 

}
