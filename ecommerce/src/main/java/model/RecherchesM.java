package model;

import java.sql.Date;

public class RecherchesM {

	private int id_recherche;
	private UtilisateursM id_utilisateur;
	private String mot_cle;
	private Date dateR;
	
	// Constructors
	
	public RecherchesM() {
	}

	public RecherchesM(int id_recherche, UtilisateursM id_utilisateur, String mot_cle, Date dateR) {	
		this.id_recherche = id_recherche;
		this.id_utilisateur = id_utilisateur;
		this.mot_cle = mot_cle;
		this.dateR = dateR;
	}
	
	// Getters and Setters

	public int getId_recherche() {
		return id_recherche;
	}

	public void setId_recherche(int id_recherche) {
		this.id_recherche = id_recherche;
	}

	public UtilisateursM getId_utilisateur() {
		return id_utilisateur;
	}

	public void setId_utilisateur(UtilisateursM id_utilisateur) {
		this.id_utilisateur = id_utilisateur;
	}

	public String getMot_cle() {
		return mot_cle;
	}

	public void setMot_cle(String mot_cle) {
		this.mot_cle = mot_cle;
	}

	public Date getDateR() {
		return dateR;
	}

	public void setDateR(Date dateR) {
		this.dateR = dateR;
	}

	@Override
	public String toString() {
		return "RecherchesM [id_recherche=" + id_recherche + ", id_utilisateur=" + id_utilisateur + ", mot_cle="
				+ mot_cle + ", dateR=" + dateR + "]";
	}
	
}
