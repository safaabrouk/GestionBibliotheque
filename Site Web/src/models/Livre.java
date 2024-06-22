package models;

import java.sql.Timestamp;

public class Livre {
	
              private int id_livre;
              private int nbr_exemplaire;
              private String isbn;
              private String titre;
              private String auteur;
              private String editeur;
              private int date_edition;
              private String description_livre;
              private String url_couverture;
              private Categorie categorie;
              private Timestamp date_ajout;

              
             public Livre(int id_livre) {
            	 this.id_livre = id_livre;
             }
             

			public Livre(int id_livre, int nbr_exemplaire, String isbn, String titre, String auteur, String editeur,
					int date_edition, String description_livre, String url_couverture,Categorie categorie,Timestamp date_ajout) {
				this.id_livre = id_livre;
				this.nbr_exemplaire = nbr_exemplaire;
				this.isbn = isbn;
				this.titre = titre;
				this.auteur = auteur;
				this.editeur = editeur;
				this.date_edition = date_edition;
				this.description_livre = description_livre;
				this.url_couverture = url_couverture;
				this.categorie=categorie;
				this.date_ajout=date_ajout;
			}
			
			
			public Livre( int nbr_exemplaire, String isbn, String titre, String auteur, String editeur,
					int date_edition, String description_livre, String url_couverture, Categorie categorie) {
				this.nbr_exemplaire = nbr_exemplaire;
				this.isbn = isbn;
				this.titre = titre;
				this.auteur = auteur;
				this.editeur = editeur;
				this.date_edition = date_edition;
				this.description_livre = description_livre;
				this.url_couverture = url_couverture;
				this.categorie=categorie;
			}
			
			public Livre(Livre L) {
				this.id_livre = L.id_livre;
				this.nbr_exemplaire =L. nbr_exemplaire;
				this.isbn = L.isbn;
				this.titre = L.titre;
				this.auteur = L.auteur;
				this.editeur = L.editeur;
				this.date_edition = L.date_edition;
				this.description_livre = L.description_livre;
				this.url_couverture = L.url_couverture;
				this.categorie=L.categorie;
				this.date_ajout=L.date_ajout;
			}
			public Livre() {
				super();
			}
			
			public int getId_livre() {
				return id_livre;
			}
			
			public void setId_livre(int id_livre) {
				this.id_livre = id_livre;
			}
			
			public int getNbr_exemplaire() {
				return nbr_exemplaire;
			}
			
			public void setNbr_exemplaire(int nbr_exemplaire) {
				this.nbr_exemplaire = nbr_exemplaire;
			}
			
			public String getIsbn() {
				return isbn;
			}
			
			public void setIsbn(String isbn) {
				this.isbn = isbn;
			}
			
			public String getTitre() {
				return titre;
			}
			
			public void setTitre(String titre) {
				this.titre = titre;
			}
			
			public String getAuteur() {
				return auteur;
			}
			
			public void setAuteur(String auteur) {
				this.auteur = auteur;
			}
			
			public String getEditeur() {
				return editeur;
			}
			
			public void setEditeur(String editeur) {
				this.editeur = editeur;
			}
			
			public int getDate_edition() {
				return date_edition;
			}
			
			public void setDate_edition(int date_edition) {
				this.date_edition = date_edition;
			}
			
			public String getDescription_livre() {
				return description_livre;
			}
			
			public void setDescription_livre(String description_livre) {
				this.description_livre = description_livre;
			}
			
			public String getUrl_couverture() {
				return url_couverture;
			}
			 void setUrl_couverture(String url_couverture) {
				this.url_couverture = url_couverture;
			}
			
			public Categorie getCategorie() {
				return categorie;
			}
			public void setCategorie(Categorie categorie) {
				this.categorie = categorie;
			}
			
			public Timestamp getDate_ajout() {
				return date_ajout;
			}
			
			public void setDate_ajout(Timestamp date_ajout) {
				this.date_ajout = date_ajout;
			}
			
			@Override
			public String toString() {
				return "Livre [id_livre=" + id_livre + ", nbr_exemplaire=" + nbr_exemplaire + ", isbn=" + isbn
						+ ", titre=" + titre + ", auteur=" + auteur + ", editeur=" + editeur + ", date_edition="
						+ date_edition + ", description_livre=" + description_livre + ", url_couverture="
						+ url_couverture + ", categorie=" + categorie + ", date_ajout=" + date_ajout + "]";
			}
			
			
			
              
   
}
