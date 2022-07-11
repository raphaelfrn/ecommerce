package model;

public class AdministrateursM {

	private int id_administrateurs;
	private String nom;
	private String email;
	private String mot_de_passe;
	private String privileges;
	
	
	// Constructors
	
	public AdministrateursM() {
	}


	public AdministrateursM(int id_administrateurs, String nom, String email, String mot_de_passe, String privileges) {
		
		this.id_administrateurs = id_administrateurs;
		this.nom = nom;
		this.email = email;
		this.mot_de_passe = mot_de_passe;
		this.privileges = privileges;
	}

	
	// Getters and Setters

	public int getId_administrateurs() {
		return id_administrateurs;
	}


	public void setId_administrateurs(int id_administrateurs) {
		this.id_administrateurs = id_administrateurs;
	}


	public String getNom() {
		return nom;
	}


	public void setNom(String nom) {
		this.nom = nom;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getMot_de_passe() {
		return mot_de_passe;
	}


	public void setMot_de_passe(String mot_de_passe) {
		this.mot_de_passe = mot_de_passe;
	}


	public String getPrivileges() {
		return privileges;
	}


	public void setPrivileges(String privileges) {
		this.privileges = privileges;
	}


	@Override
	public String toString() {
		return "AdministrateursM [id_administrateurs=" + id_administrateurs + ", nom=" + nom + ", email=" + email
				+ ", mot_de_passe=" + mot_de_passe + ", privileges=" + privileges + "]";
	}
	
	
	
}
