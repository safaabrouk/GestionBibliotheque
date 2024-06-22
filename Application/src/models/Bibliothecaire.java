package models;

import java.util.Date;

import tools.Role;

public class Bibliothecaire extends Personne {
                 
	private int id_bibliothecaire;

	
	public Bibliothecaire(int id_bibliothecaire) {
		this.id_bibliothecaire = id_bibliothecaire;
	}

	public Bibliothecaire(int id_bibliothecaire , String nom_personne, String prenom_personne, String login_personne,
			String password_personne, String cin_personne, long tel_personne ,Profil profil) {
		super( id_bibliothecaire, nom_personne, prenom_personne, login_personne, password_personne, cin_personne, tel_personne,
				Role.bibliothecaire,profil);
	}
	public Bibliothecaire( String nom_personne, String prenom_personne, String login_personne,
			String password_personne, String cin_personne, long tel_personne, String role_personne,
			Date date_inscr_personne) {
		super( nom_personne, prenom_personne, login_personne, password_personne, cin_personne, tel_personne,
				Role.bibliothecaire,null);
	}
	public Bibliothecaire() {
		super();
	}

	public int getId_bibliothecaire() {
		return id_bibliothecaire;
	}

	public void setId_bibliothecaire(int id_bibliothecaire) {
		this.id_bibliothecaire = id_bibliothecaire;
	}
	@Override
	public String toString() {
		return "Bibliothecaire [id_bibliothecaire=" + id_bibliothecaire + super.toString()+ "]";
	}
	
	
	
}
