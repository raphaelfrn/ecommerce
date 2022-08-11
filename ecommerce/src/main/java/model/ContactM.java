package model;

public class ContactM {
	
	private int id_contact;
	private UtilisateursM id_utilisateur;
	private String sujet;
	private String message;
	private int etat;
	
	// Constructors
	
	public ContactM() {
	}
	
	public ContactM(int id_contact, UtilisateursM id_utilisateur, String sujet, String message, int etat) {
		this.id_contact = id_contact;
		this.id_utilisateur = id_utilisateur;
		this.sujet = sujet;
		this.message = message;
		this.etat = etat;
	}
	
	// Getters and Setters

	public int getId_contact() {
		return id_contact;
	}
	public void setId_contact(int id_contact) {
		this.id_contact = id_contact;
	}
	public UtilisateursM getId_utilisateur() {
		return id_utilisateur;
	}
	public void setId_utilisateur(UtilisateursM id_utilisateur) {
		this.id_utilisateur = id_utilisateur;
	}
	public String getSujet() {
		return sujet;
	}
	public void setSujet(String sujet) {
		this.sujet = sujet;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getEtat() {
		return etat;
	}
	public void setEtat(int etat) {
		this.etat = etat;
	}
	
	@Override
	public String toString() {
		return "ContactM [id_contact=" + id_contact + ", id_utilisateur=" + id_utilisateur + ", sujet=" + sujet
				+ ", message=" + message + ", Etat=" + etat + "]";
	}
	
}
