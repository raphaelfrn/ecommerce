package model;

public class CategorieM {

	private int id_categorie;
	private String titre;

	
	// Constructors

	public CategorieM() {
	}
	
	public CategorieM(int id_categorie, String titre) {
		this.id_categorie = id_categorie;
		this.titre = titre;
	}

	
	// Getters and Setters

	public int getId_categorie() {
		return id_categorie;
	}
	public void setId_categorie(int id_categorie) {
		this.id_categorie = id_categorie;
	}
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}

	@Override
	public String toString() {
		return "CategorieM [id_categorie=" + id_categorie + ", titre=" + titre + "]";
	}
}
