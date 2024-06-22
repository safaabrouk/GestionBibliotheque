package models;

import tools.Role;

public class Utilisateur extends Personne {
	private int id_utilisateur;

	
	public Utilisateur(int id_utilisateur , String nom_personne, String prenom_personne, String login_personne,String password_personne, String cin_personne, long tel_personne) {
		super( nom_personne, prenom_personne, login_personne, password_personne, cin_personne, tel_personne,Role.utilisateur,null);
	    this.id_utilisateur=id_utilisateur;
	}
	
	public Utilisateur(int id_utilisateur , String nom_personne, String prenom_personne, String login_personne,String password_personne, String cin_personne, long tel_personne,Profil profil) {
		super( nom_personne, prenom_personne, login_personne, password_personne, cin_personne, tel_personne,Role.utilisateur,profil);
	    this.id_utilisateur=id_utilisateur;
	}
	
	public Utilisateur( String nom_personne, String prenom_personne, String login_personne,String password_personne, String cin_personne, long tel_personne) {
		super( nom_personne, prenom_personne, login_personne, password_personne, cin_personne, tel_personne,Role.utilisateur,null);
	}
	
	public Utilisateur() {
		super();
	}
	
	public int getId_utilisateur() {
		return id_utilisateur;
	}

	public void setId_utilisateur(int id_utilisateur) {
		this.id_utilisateur = id_utilisateur;
	}
	
	@Override
	public String toString() {
		return "Utilisateur [id_utilisateur=" + id_utilisateur + super.toString()+ "]";
	}

	
	
}
