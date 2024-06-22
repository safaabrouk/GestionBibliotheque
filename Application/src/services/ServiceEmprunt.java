package services;

import java.sql.SQLException;
import java.util.ArrayList;
import dao.DaoEmprunt;
import models.Emprunt;


public class ServiceEmprunt {

	
	public static int AjouterEmprunt(Emprunt E) throws ClassNotFoundException, SQLException{
		return DaoEmprunt.AjouterEmprunt(E);
	}
	public static int SupprimerEmprunt(int id) throws ClassNotFoundException, SQLException{
		return DaoEmprunt.SupprimerEmprunt(id);
	}
	public static int ModifieEmprunt(Emprunt E) throws ClassNotFoundException, SQLException{
		return DaoEmprunt.ModifierEmprunt(E);
	}
	public static ArrayList<Emprunt> ConsulterEmprunts() throws ClassNotFoundException, SQLException{
		return DaoEmprunt.ConsulterEmprunts();
	}

	public static Emprunt ChercherEmpruntViaId(int id) throws ClassNotFoundException, SQLException {
		return DaoEmprunt.ChercherEmpruntViaId(id);
	}
}
