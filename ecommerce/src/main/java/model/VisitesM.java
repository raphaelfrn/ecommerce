package model;

import java.sql.Date;

public class VisitesM {
	
	private int id_visite;
	private ProduitsM id_produit;
	private UtilisateursM id_utilisateur;
	private Date dateV;
	
	
	
	// Constructors
	
	public VisitesM() {
	}
	public VisitesM(int id_visite, ProduitsM id_produit, UtilisateursM id_utilisateur, Date dateV) {
		this.id_visite = id_visite;
		this.id_produit = id_produit;
		this.id_utilisateur = id_utilisateur;
		this.dateV = dateV;
	}
	
	// Getters and Setters

	
	public int getId_visite() {
		return id_visite;
	}
	public void setId_visite(int id_visite) {
		this.id_visite = id_visite;
	}
	public ProduitsM getId_produit() {
		return id_produit;
	}
	public void setId_produit(ProduitsM id_produit) {
		this.id_produit = id_produit;
	}
	public UtilisateursM getId_utilisateur() {
		return id_utilisateur;
	}
	public void setId_utilisateur(UtilisateursM id_utilisateur) {
		this.id_utilisateur = id_utilisateur;
	}
	public Date getDateV() {
		return dateV;
	}
	public void setDateV(Date dateV) {
		this.dateV = dateV;
	}
	
	
	@Override
	public String toString() {
		return "VisitesM [id_visite=" + id_visite + ", id_produit=" + id_produit + ", id_utilisateur=" + id_utilisateur
				+ ", dateV=" + dateV + "]";
	}
	

}
