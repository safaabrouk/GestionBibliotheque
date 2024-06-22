package models;

import java.util.ArrayList;


public class Categorie {
	
	  private int id_categorie;
	  private String nom_categorie;
	  private String description_categorie;
	  private String url_couverture;
	  private ArrayList<Livre> livres ;
	  
	  
	

	public Categorie(int id_categorie, String nom_categorie, String description_categorie, String  url_couverture, ArrayList<Livre> livres) {
		this.id_categorie = id_categorie;
		this.nom_categorie = nom_categorie;
		this.description_categorie = description_categorie;
		this.livres = livres;
		this.url_couverture=url_couverture;

	}
	
  /*Constructeur d'ajout ... */
	
	public Categorie( String nom_categorie, String description_categorie,String  url_couverture) {
		this.nom_categorie = nom_categorie;
		this.description_categorie = description_categorie;
		this.url_couverture=url_couverture;

		
	}
	public Categorie(int id_categorie, String nom_categorie, String description_categorie, String  url_couverture) {
		this.id_categorie = id_categorie;
		this.nom_categorie = nom_categorie;
		this.description_categorie = description_categorie;
		this.url_couverture=url_couverture;

	}
	public Categorie( String nom_categorie, String description_categorie,String  url_couverture, ArrayList<Livre> livres) {
		this.nom_categorie = nom_categorie;
		this.description_categorie = description_categorie;
		this.livres = livres;
		this.url_couverture=url_couverture;

		
	}
	
	public Categorie(Categorie C) {
		this.id_categorie = C.id_categorie;
		this.nom_categorie = C.nom_categorie;
		this.description_categorie = C.description_categorie;
		this.livres = C.livres;
		this.url_couverture=C.url_couverture;

	}
	public Categorie() {
		super();
	}

public int getId_categorie() {
	return id_categorie;
}

public void setId_categorie(int id_categorie) {
	this.id_categorie = id_categorie;
}

public String getNom_categorie() {
	return nom_categorie;
}

public void setNom_categorie(String nom_categorie) {
	this.nom_categorie = nom_categorie;
}
public String getDescription_categorie() {
	return description_categorie;
}

public void setDescription_categorie(String description_categorie) {
	this.description_categorie = description_categorie;
}

public ArrayList<Livre> getLivres() {
	return livres;
}

public void setLivres(ArrayList<Livre> livres) {
	this.livres = livres;
}

public String getUrl_couverture() {
	return url_couverture;
}

public void setUrl_couverture(String url_couverture) {
	this.url_couverture = url_couverture;
}
@Override
public String toString() {
	return "Categorie [id_categorie=" + id_categorie + ", nom_categorie=" + nom_categorie + ", description_categorie="
			+ description_categorie + ", url_couverture=" + url_couverture + ", livres=" + livres + "]";
}





	
}
