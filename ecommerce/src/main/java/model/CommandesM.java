package model;

import java.sql.Date;

public class CommandesM {

	private int id_commande;
	private UtilisateursM id_utilisateur;
	private Date dateC;
	private float total;
	private Adresses_livraisonM id_adresse_livraison;
	private int etat;
	
	// Constructors
	public CommandesM() {
	}

	public CommandesM(int id_commande) {
		this.id_commande = id_commande;
	}
		
	
	public CommandesM(UtilisateursM id_utilisateur, Date dateC, float total) {
		super();
		this.id_utilisateur = id_utilisateur;
		this.dateC = dateC;
		this.total = total;
	}
	
	

	public CommandesM(int id_commande, UtilisateursM id_utilisateur, Date dateC, float total,
			Adresses_livraisonM id_adresse_livraison, int etat) {
		this.id_commande = id_commande;
		this.id_utilisateur = id_utilisateur;
		this.dateC = dateC;
		this.total = total;
		this.id_adresse_livraison = id_adresse_livraison;
		this.etat = etat;
	}

	// Getters and Setters

	public int getId_commande() {
		return id_commande;
	}


	public void setId_commande(int id_commande) {
		this.id_commande = id_commande;
	}


	public UtilisateursM getId_utilisateur() {
		return id_utilisateur;
	}


	public void setId_utilisateur(UtilisateursM id_utilisateur) {
		this.id_utilisateur = id_utilisateur;
	}


	public Date getDateC() {
		return dateC;
	}


	public void setDateC(Date dateC) {
		this.dateC = dateC;
	}


	public float getTotal() {
		return total;
	}


	public void setTotal(float total) {
		this.total = total;
	}


	public Adresses_livraisonM getId_adresse_livraison() {
		return id_adresse_livraison;
	}


	public void setId_adresse_livraison(Adresses_livraisonM id_adresse_livraison) {
		this.id_adresse_livraison = id_adresse_livraison;
	}


	public int getEtat() {
		return etat;
	}


	public void setEtat(int etat) {
		this.etat = etat;
	}


	@Override
	public String toString() {
		return "CommandesM [id_commande=" + id_commande + ", id_utilisateur=" + id_utilisateur + ", dateC=" + dateC
				+ ", total=" + total + ", id_adresse_livraison=" + id_adresse_livraison + ", etat=" + etat + "]";
	}
	
	
}
