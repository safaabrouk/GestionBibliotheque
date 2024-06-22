package models;

import java.sql.Timestamp;


public class Reservation {
            private int id_reservation;
            private int etat_reservation;
            private Timestamp date_reservation;
            private int numero_exemplaire; 
            private Utilisateur utilisateur;
            private Livre livre;
           

           
			public Reservation(int id_reservation, int etat_reservation, Timestamp date_reservation,
					int numero_exemplaire ,Utilisateur utilisateur, Livre livre) {
				this.id_reservation = id_reservation;
				this.etat_reservation = etat_reservation;
				this.date_reservation = date_reservation;
				this.numero_exemplaire = numero_exemplaire;
				this.utilisateur=utilisateur;
				this.livre=livre;
			}
			public Reservation( int etat_reservation,
					Utilisateur utilisateur, Livre livre) {
				this.etat_reservation = etat_reservation;
				this.utilisateur = utilisateur;
				this.livre = livre;
			}
			public Reservation( 
					Utilisateur utilisateur, Livre livre) {
				this.utilisateur = utilisateur;
				this.livre = livre;
			}
			public Reservation(Reservation R) {
				this.id_reservation = R.id_reservation;
				this.etat_reservation = R.etat_reservation;
				this.date_reservation = R.date_reservation;
				this.numero_exemplaire = R.numero_exemplaire;
				this.utilisateur = R.utilisateur;
				this.livre = R.livre;
			}
			public Reservation() {
				super();
			}
			
			public int getId_reservation() {
				return id_reservation;
			}
			
			public void setId_reservation(int id_reservation) {
				this.id_reservation = id_reservation;
			}
			
			public int getEtat_reservation() {
				return etat_reservation;
			}
			
			public void setEtat_reservation(int etat_reservation) {
				this.etat_reservation = etat_reservation;
			}
			
			public Timestamp getDate_reservation() {
				return date_reservation;
			}
			
			public void setDate_reservation(Timestamp date_reservation) {
				this.date_reservation = date_reservation;
			}
			
			public Utilisateur getUtilisateur() {
				return utilisateur;
			}
			
			public void setUtilisateur(Utilisateur utilisateur) {
				this.utilisateur = utilisateur;
			}
			
			public Livre getLivre() {
				return livre;
			}
			
			public void setLivre(Livre livre) {
				this.livre = livre;
			}
			
			public int getNumero_exemplaire() {
				return numero_exemplaire;
			}
			public void setNumero_exemplaire(int numero_exemplaire) {
				this.numero_exemplaire = numero_exemplaire;
			}
			
			@Override
			public String toString() {
				return "Reservation [id_reservation=" + id_reservation + ", etat_reservation=" + etat_reservation
						+ ", date_reservation=" + date_reservation + ", numero_exemplaire=" + numero_exemplaire
						+ ", utilisateur=" + utilisateur + ", livre=" + livre + "]";
			}
			
			
			
            
			
         
        
		
       
}
