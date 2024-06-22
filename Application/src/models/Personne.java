package models;

import tools.Role;

public class Personne {
	
	   protected int id;
       protected String nom;
       protected String prenom;
       protected String login;
       protected String password;
       protected String cin;
       protected long tel;
       protected Role role;
       protected Profil profil;
       
       
	public Personne() {
		super();
		
	}


	public Personne(String nom, String prenom, String login, String password, String cin, long tel , Role role,Profil profil) {
		
		this.nom      = nom;
		this.prenom   = prenom;
		this.login    = login;
		this.password = password;
		this.cin      = cin;
		this.tel      = tel;
		this.role     = role;
		this.profil   = profil;
	}
       
    public Personne(int id,String nom, String prenom, String login, String password, String cin, long tel , Role role, Profil profil ) {
		this.id       = id;
		this.nom      = nom;
		this.prenom   = prenom;
		this.login    = login;
		this.password = password;
		this.cin      = cin;
		this.tel      = tel;
		this.role     = role;
		this.profil   = profil;
	}
	
       
	public Personne(Personne p) {
		this.id       = p.id;
		this.nom      = p.nom;
		this.prenom   = p.prenom;
		this.login    = p.login;
		this.password = p.password;
		this.cin      = p.cin;
		this.tel      = p.tel;
		this.role     = p.role;
	}

	
	

	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getNom() {
		return nom;
	}


	public void setNom(String nom) {
		this.nom = nom;
	}


	public String getPrenom() {
		return prenom;
	}


	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}


	public String getLogin() {
		return login;
	}


	public void setLogin(String login) {
		this.login = login;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getCin() {
		return cin;
	}


	public void setCin(String cin) {
		this.cin = cin;
	}


	public long getTel() {
		return tel;
	}


	public void setTel(long tel) {
		this.tel = tel;
	}


	public Role getRole() {
		return role;
	}


	public void setRole(Role role) {
		this.role = role;
	}


	public Profil getProfil() {
		return profil;
	}


	public void setProfil(Profil profil) {
		this.profil = profil;
	}


	@Override
	public String toString() {
		return "Personne [id=" + id + ", nom=" + nom + ", prenom=" + prenom + ", login=" + login + ", password="
				+ password + ", cin=" + cin + ", tel=" + tel + ", role=" + role + ", profil=" + profil + "]";
	}



    	
       
}
