package services;

import java.sql.SQLException;
import java.util.ArrayList;
import dao.DaoReservation;
import models.Reservation;
import models.Utilisateur;


public class ServiceReservation {
    
	public static int EffectuerReservation(Reservation R) throws ClassNotFoundException, SQLException{
		 int res  = DaoReservation.ChercherReservationViaIdEtUtilisateur(R.getUtilisateur().getId_utilisateur(),R.getLivre().getId_livre());
         int resultat ;
         if(res > 0 ) {
       	  resultat = 0;
    	     
         }
         else {
       	  
       	resultat = DaoReservation.EffectuerReservation(R);
         } 
		
		return resultat;
	}
	
	
	public static int AnnulerReservation(int id) throws ClassNotFoundException, SQLException{
		return DaoReservation.AnnulerReservation(id);
	}
	public static int ModifierReservation(Reservation R) throws ClassNotFoundException, SQLException{
		return DaoReservation.ModifierReservation(R);
	}
	public static ArrayList<Reservation> ConsulterReservations() throws ClassNotFoundException, SQLException{
		return DaoReservation.ConsulterReservations();
	}
	public static ArrayList<Reservation> ConsulterEnregistrementsViaIdUtilisateur(Utilisateur u) throws ClassNotFoundException, SQLException{
		return DaoReservation.ConsulterEnregistrementsViaIdUtilisateur(u);
	}
	
	public static ArrayList<Reservation> ConsulterReservationsViaIdUtilisateur(Utilisateur u) throws ClassNotFoundException, SQLException{
		return DaoReservation.ConsulterReservationViaIdUtilisateur(u);
	}
	
	public static ArrayList<Reservation> VerifierReservationsViaIdUtilisateur(Utilisateur u) throws ClassNotFoundException, SQLException{
		return DaoReservation.VerifierReservationViaIdUtilisateur(u);
	}
	
	public static Reservation ChercherReservationViaEmprunt(int idLivre, int NumeroExemplaire) throws ClassNotFoundException, SQLException {
		return DaoReservation.ChercherReservationViaEmprunt(idLivre, NumeroExemplaire);
	}
	
	public static ArrayList<Reservation> ChercherReservationViaIdLivre(int id) throws ClassNotFoundException, SQLException{
		return DaoReservation.ChercherReservationViaIdLivre(id);
	}
		
	public static Reservation ChercherReservationViaId(int id) throws ClassNotFoundException, SQLException {
		return DaoReservation.ChercherReservationViaId(id);
	}
	public static int ChangerEtatReservation(int id_reservation,int etat_reservation) throws ClassNotFoundException, SQLException {
		return DaoReservation.ChangerEtatReservation(id_reservation,etat_reservation);
	}
}