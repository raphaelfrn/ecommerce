package model;

public class Sous_categoriesM {
	
	private int id_sous_categorie;
	private String titre;
	private CategorieM id_categorie;
	
	
	// Constructors
	
	public Sous_categoriesM() {
	}


	public Sous_categoriesM(int id_sous_categorie, String titre, CategorieM id_categorie) {	
		this.id_sous_categorie = id_sous_categorie;
		this.titre = titre;
		this.id_categorie = id_categorie;
	}

	// Getters and Setters


	public int getId_sous_categorie() {
		return id_sous_categorie;
	}


	public void setId_sous_categorie(int id_sous_categorie) {
		this.id_sous_categorie = id_sous_categorie;
	}


	public String getTitre() {
		return titre;
	}


	public void setTitre(String titre) {
		this.titre = titre;
	}


	public CategorieM getId_categorie() {
		return id_categorie;
	}


	public void setId_categorie(CategorieM id_categorie) {
		this.id_categorie = id_categorie;
	}


	@Override
	public String toString() {
		return "Sous_categoriesM [id_sous_categorie=" + id_sous_categorie + ", titre=" + titre + ", id_categorie="
				+ id_categorie + "]";
	}
	
	

}
