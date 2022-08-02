package model;


public class Sous_categoriesM {
	
	private int id_sous_categorie;
	private String titre;
	private CategorieM id_categorie;
	private String image;
	private String video;
	
	
	// Constructors
	
	public Sous_categoriesM() {
	}
	
	public Sous_categoriesM(int id_sous_categorie) {
		this.id_sous_categorie = id_sous_categorie;
	}


	public Sous_categoriesM(int id_sous_categorie, String titre, CategorieM id_categorie, String image, String video) {	
		this.id_sous_categorie = id_sous_categorie;
		this.titre = titre;
		this.id_categorie = id_categorie;
		this.image = image;
		this.video= video;
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


	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getVideo() {
		return video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	@Override
	public String toString() {
		return "Sous_categoriesM [id_sous_categorie=" + id_sous_categorie + ", titre=" + titre + ", id_categorie="
				+ id_categorie + ", image=" + image + ", video=" + video + "]";
	}


	
	

}

