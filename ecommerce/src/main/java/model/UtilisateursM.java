package model;

import java.sql.Date;

public class UtilisateursM {

	private int id_utilisateur;
	private String nom;
	private String prenom;
	private Date date_inscription;
	private String email;
	private String telephone;
	private String mot_de_passe;
	
	public UtilisateursM() {
	}

	public UtilisateursM(int id_utilisateur) {
		this.id_utilisateur = id_utilisateur;
	}

	public UtilisateursM(int id_utilisateur, String nom, String prenom) {
		this.id_utilisateur = id_utilisateur;
		this.nom = nom;
		this.prenom = prenom;
	}

	public UtilisateursM(int id_utilisateur, String nom, String prenom, Date date_inscription, String email,
			String telephone) {
		
		this.id_utilisateur = id_utilisateur;
		this.nom = nom;
		this.prenom = prenom;
		this.date_inscription = date_inscription;
		this.email = email;
		this.telephone = telephone;
	}
	
	public UtilisateursM(int id_utilisateur, String nom, String prenom, Date date_inscription, String email,
			String telephone, String mot_de_passe) {
		super();
		this.id_utilisateur = id_utilisateur;
		this.nom = nom;
		this.prenom = prenom;
		this.date_inscription = date_inscription;
		this.email = email;
		this.telephone = telephone;
		this.mot_de_passe = mot_de_passe;
	}

	

	public UtilisateursM(int id_utilisateur, String nom, String prenom, String telephone) {
		super();
		this.id_utilisateur = id_utilisateur;
		this.nom = nom;
		this.prenom = prenom;
		this.telephone = telephone;
	}

	public int getId_utilisateur() {
		return id_utilisateur;
	}

	public void setId_utilisateur(int id_utilisateur) {
		this.id_utilisateur = id_utilisateur;
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

	public Date getDate_inscription() {
		return date_inscription;
	}

	public void setDate_inscription(Date date_inscription) {
		this.date_inscription = date_inscription;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getMot_de_passe() {
		return mot_de_passe;
	}

	public void setMot_de_passe(String mot_de_passe) {
		this.mot_de_passe = mot_de_passe;
	}

	@Override
	public String toString() {
		return id_utilisateur + " " + nom + " " + prenom
				+ " " + date_inscription + " " + email + " " + telephone + " " + mot_de_passe ;
	}

}
