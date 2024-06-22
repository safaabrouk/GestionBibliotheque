package services;

import java.sql.SQLException;
import java.util.ArrayList;
import dao.DaoCategorie;
import models.Categorie;

public class ServiceCategorie {

	public static int AjouterCategorie(Categorie C) throws ClassNotFoundException, SQLException{
		return DaoCategorie.AjouterCategorie(C);
	}
	public static int SupprimerCategorie(int id) throws ClassNotFoundException, SQLException{
		return DaoCategorie.SupprimerCategorie(id);
	}
	public static int ModifierCategorie(Categorie C) throws ClassNotFoundException, SQLException{
		return DaoCategorie.ModifierCategorie(C);
	}
	public static ArrayList<Categorie> ConsulterCategories() throws ClassNotFoundException, SQLException{
		return DaoCategorie.ConsulterCategories();
	}
	public static Categorie ChercherCategorieViaNom(String nom) throws ClassNotFoundException, SQLException {
		return DaoCategorie.ChercherCategorieViaNom(nom);
	}
	public static Categorie ChercherCategorieViaId(int id) throws ClassNotFoundException, SQLException {
		return DaoCategorie.ChercherCategorieViaId(id);
	}
	
}
