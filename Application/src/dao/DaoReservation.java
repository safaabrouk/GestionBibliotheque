package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import com.mysql.jdbc.ResultSet;

import models.Reservation;
import models.Utilisateur;

public class DaoReservation {
	public static int EffectuerReservation(Reservation R ) throws ClassNotFoundException, SQLException  {
		int res = 0;
		connexion.connect();
		res = connexion.Maj("INSERT into reservation( etat_reservation, id_utilisateur, id_livre) VALUES  (2,"+R.getUtilisateur().getId_utilisateur()+","+R.getLivre().getId_livre()+")");
		connexion.disconnect();
		return res;
	}
	
	public static int AnnulerReservation(int id ) throws ClassNotFoundException, SQLException  {
		int res = 0;
		connexion.connect();
		res = connexion.Maj("DELETE FROM reservation where id_reservation="+id);
		connexion.disconnect();
		return res;
	}
	
	public static int ModifierReservation(Reservation R) throws ClassNotFoundException, SQLException  {
		int res = 0;
		connexion.connect();
		res = connexion.Maj("UPDATE reservation set etat_reservation="+R.getEtat_reservation()+",numero_exemplaire="+R.getNumero_exemplaire()+" where id_reservation="+R.getId_reservation());
		connexion.disconnect();
		return res;
	}
	
	public static ArrayList<Reservation> ConsulterReservations() throws ClassNotFoundException, SQLException {
		ArrayList<Reservation> reservations = new ArrayList<Reservation>();
		connexion.connect();
		ResultSet res = connexion.Select("SELECT * FROM reservation where etat_reservation = 0");
		connexion.disconnect();
		try {
		   while (res.next()) 
		   {
			   Reservation r= new Reservation(res.getInt(1),res.getInt(2),res.getTimestamp(3),res.getInt(4),DaoPersonne.ChercherUtilisateurViaId(res.getInt(5)),DaoLivre.ChercherLivreViaId(res.getInt(6)));
			   reservations.add(r);			
		   }
		}catch(SQLException e){
			e.printStackTrace();
			
		}
		return reservations;
	}
	
	public static ArrayList<Reservation> ConsulterEnregistrementsViaIdUtilisateur(Utilisateur u) throws ClassNotFoundException, SQLException {
		ArrayList<Reservation> enregistrements = new ArrayList<Reservation>();
		connexion.connect();
		ResultSet res = connexion.Select("SELECT * FROM reservation where id_utilisateur="+u.getId_utilisateur()+" and etat_reservation=2");
		connexion.disconnect();
		try {
		   while (res.next()) 
		   {
			   Reservation r= new Reservation(res.getInt(1),res.getInt(2),res.getTimestamp(3),res.getInt(4),u,DaoLivre.ChercherLivreViaId(res.getInt(6)));
			   enregistrements.add(r);			
		   }
		}catch(SQLException e){
			e.printStackTrace();
			
		}
		return  enregistrements;
	}
	
	public static ArrayList<Reservation> ConsulterReservationViaIdUtilisateur(Utilisateur u) throws ClassNotFoundException, SQLException {
		ArrayList<Reservation> MesResrvation = new ArrayList<Reservation>();
		connexion.connect();
		ResultSet res = connexion.Select("SELECT * FROM reservation where id_utilisateur="+u.getId_utilisateur()+" and etat_reservation=0");
		connexion.disconnect();
		try {
		   while (res.next()) 
		   {
			   Reservation r= new Reservation(res.getInt(1),res.getInt(2),res.getTimestamp(3),res.getInt(4),u,DaoLivre.ChercherLivreViaId(res.getInt(6)));
			   MesResrvation.add(r);			
		   }
		}catch(SQLException e){
			e.printStackTrace();
			
		}
		return  MesResrvation;
	}
	
	public static ArrayList<Reservation> VerifierReservationViaIdUtilisateur(Utilisateur u) throws ClassNotFoundException, SQLException {
		ArrayList<Reservation> MesResrvation = new ArrayList<Reservation>();
		connexion.connect();
		ResultSet res = connexion.Select("SELECT * FROM reservation where id_utilisateur="+u.getId_utilisateur()+" and etat_reservation in(1,0,-1)");
		connexion.disconnect();
		try {
		   while (res.next()) 
		   {
			   Reservation r= new Reservation(res.getInt(1),res.getInt(2),res.getTimestamp(3),res.getInt(4),u,DaoLivre.ChercherLivreViaId(res.getInt(6)));
			   MesResrvation.add(r);			
		   }
		}catch(SQLException e){
			e.printStackTrace();
			
		}
		return  MesResrvation;
	}
	
	public static Reservation ChercherReservationViaId(int id) throws ClassNotFoundException, SQLException {
		Reservation r=null;		
		connexion.connect();
		ResultSet res = connexion.Select("select * from reservation where id_reservation ="+id);
		connexion.disconnect();
		if(res.next()) {
			    r= new Reservation(res.getInt(1),res.getInt(2),res.getTimestamp(3),res.getInt(4),DaoPersonne.ChercherUtilisateurViaId(res.getInt(5)),DaoLivre.ChercherLivreViaId(res.getInt(6)));
		}
		
		return r;
	 }
	

	public static int ChercherReservationViaIdEtUtilisateur(int id_utilisateur , int id_Livre ) throws ClassNotFoundException, SQLException {
		int r = 0;
		connexion.connect();
		ResultSet res = connexion.Select("select id_reservation from reservation where id_utilisateur ="+id_utilisateur+" and id_livre ="+id_Livre+" ");
		connexion.disconnect();
		if(res.next()) {
			    r= res.getInt(1);
		}
		
		return r;
	 }
    
	public static ArrayList<Reservation> ChercherReservationViaIdLivre(int id) throws ClassNotFoundException, SQLException {
		ArrayList<Reservation> R = new ArrayList<Reservation>();
		connexion.connect();
		ResultSet res = connexion.Select("SELECT * FROM reservation where id_livre="+id);
		try {
		   while (res.next()) 
		   {
			   Reservation r= new Reservation(res.getInt(1),res.getInt(2),res.getTimestamp(3),res.getInt(4),DaoPersonne.ChercherUtilisateurViaId(res.getInt(5)),DaoLivre.ChercherLivreViaId(res.getInt(6)));
			   R.add(r);			
		   }
		}catch(SQLException e){
			e.printStackTrace();
			
		}
		return  R;
	}
	
	public static Reservation ChercherReservationViaEmprunt(int idLivre, int NumeroExemplaire) throws ClassNotFoundException, SQLException {
    	Reservation r =null;		
		connexion.connect();
		ResultSet res = connexion.Select("SELECT * FROM reservation WHERE etat_reservation = 1 and id_livre = "+idLivre+" and numero_exemplaire = "+NumeroExemplaire+" ");
		connexion.disconnect();
		if(res.next()) {
		    r= new Reservation(res.getInt(1),res.getInt(2),res.getTimestamp(3),res.getInt(4),DaoPersonne.ChercherUtilisateurViaId(res.getInt(5)),DaoLivre.ChercherLivreViaId(res.getInt(6)));
		}
		return r;
	 }

	
    
    public static int ChangerEtatReservation(int id_reservation,int etat_reservation) throws ClassNotFoundException, SQLException {
		 int res = 0; 
		 connexion.connect();
		 res = connexion.Maj("UPDATE reservation SET etat_reservation = '"+etat_reservation+"' WHERE id_reservation = "+id_reservation);
		 connexion.disconnect();
	     return res;
	 }
}
