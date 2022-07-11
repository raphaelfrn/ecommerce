package model;

public class FavorisM {
	
	private int id_favoris;
	private ProduitsM id_produit;
	private UtilisateursM id_utilisateur;
	
	// Constructors
	
	public FavorisM() {
	}

	public FavorisM(int id_favoris, ProduitsM id_produit, UtilisateursM id_utilisateur) {
		this.id_favoris = id_favoris;
		this.id_produit = id_produit;
		this.id_utilisateur = id_utilisateur;
	}

	// Getters and Setters

	public int getId_favoris() {
		return id_favoris;
	}

	public void setId_favoris(int id_favoris) {
		this.id_favoris = id_favoris;
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

	@Override
	public String toString() {
		return "FavorisM [id_favoris=" + id_favoris + ", id_produit=" + id_produit + ", id_utilisateur="
				+ id_utilisateur + "]";
	}

}
