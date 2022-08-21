package model;

public class Details_commandeM {
	
	private int id_details_commande;
	private CommandesM id_commande;
	private ProduitsM id_produit;
	private int quantite;
	private float prix;
	
	
	// Constructors
	
	public Details_commandeM() {
	}
	
	public Details_commandeM(int id_details_commande, CommandesM id_commande, ProduitsM id_produit, int quantite,
			float prix) {
		this.id_details_commande = id_details_commande;
		this.id_commande = id_commande;
		this.id_produit = id_produit;
		this.quantite = quantite;
		this.prix = prix;
	}

	// Getters and Setters

	public int getId_details_commande() {
		return id_details_commande;
	}


	public void setId_details_commande(int id_details_commande) {
		this.id_details_commande = id_details_commande;
	}


	public CommandesM getId_commande() {
		return id_commande;
	}


	public void setId_commande(CommandesM id_commande) {
		this.id_commande = id_commande;
	}


	public ProduitsM getId_produit() {
		return id_produit;
	}


	public void setId_produit(ProduitsM id_produit) {
		this.id_produit = id_produit;
	}


	public int getQuantite() {
		return quantite;
	}


	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}


	public float getPrix() {
		return prix;
	}


	public void setPrix(float prix) {
		this.prix = prix;
	}


	@Override
	public String toString() {
		return "Details_commandeM [id_details_commande=" + id_details_commande + ", id_commande=" + id_commande
				+ ", id_produit=" + id_produit + ", quantite=" + quantite + ", prix=" + prix + "]";
	}
	
	

}
