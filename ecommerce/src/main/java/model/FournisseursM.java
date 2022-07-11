package model;

public class FournisseursM {

	private int id_fournisseur;
	private String nom;
	
	
	// Constructors
	
	public FournisseursM() {
	}


	public FournisseursM(int id_fournisseur, String nom) {
		this.id_fournisseur = id_fournisseur;
		this.nom = nom;
	}
	
	// Getters and Setters


	public int getId_fournisseur() {
		return id_fournisseur;
	}


	public void setId_fournisseur(int id_fournisseur) {
		this.id_fournisseur = id_fournisseur;
	}


	public String getNom() {
		return nom;
	}


	public void setNom(String nom) {
		this.nom = nom;
	}


	@Override
	public String toString() {
		return "FournisseursM [id_fournisseur=" + id_fournisseur + ", nom=" + nom + "]";
	}
	
	
}
