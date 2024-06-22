package models;

import java.sql.Timestamp;


public class Emprunt {
           
	   private int id_emprunt;
	   private Timestamp date_emprunt;
	   private int numero_exemplaire; 
	   private Bibliothecaire bibliothecaire;
	   private Livre livre;


	   
	public Emprunt(int id_emprunt, Timestamp date_emprunt,int numero_exemplaire, Bibliothecaire bibliothecaire, Livre livre) {
		this.id_emprunt = id_emprunt;
		this.date_emprunt = date_emprunt;
		this.numero_exemplaire = numero_exemplaire; 
		this.bibliothecaire=bibliothecaire; 
		this.livre=livre;
	}
	public Emprunt(int numero_exemplaire , Bibliothecaire bibliothecaire, Livre livre) {
		this.numero_exemplaire = numero_exemplaire;
		this.bibliothecaire=bibliothecaire; 
		this.livre=livre;
	}
	public Emprunt(Emprunt E) {
		this.id_emprunt = E.id_emprunt;
		this.date_emprunt = E.date_emprunt;
		this.numero_exemplaire = E.numero_exemplaire;
		this.bibliothecaire=E.bibliothecaire; 
		this.livre=E.livre;
		
	}
	
	public int getId_emprunt() {
		return id_emprunt;
	}
	
	public void setId_emprunt(int id_emprunt) {
		this.id_emprunt = id_emprunt;
	}
	
	public Timestamp getDate_emprunt() {
		return date_emprunt;
	}
	
	public void setDate_emprunt(Timestamp date_emprunt) {
		this.date_emprunt = date_emprunt;
	}
	
	public Bibliothecaire getBibliothecaire() {
		return bibliothecaire;
	}
	
	public void setBibliothecaire(Bibliothecaire bibliothecaire) {
		this.bibliothecaire = bibliothecaire;
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
		return "Emprunt [id_emprunt=" + id_emprunt + ", date_emprunt=" + date_emprunt + ", numero_exemplaire="
				+ numero_exemplaire + ", bibliothecaire=" + bibliothecaire + ", livre=" + livre + "]";
	}
	
   
	 
}
