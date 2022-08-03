package model;

public class CategorieM {

	private int id_categorie;
	private String titre;
	private String video;
	private String description;
	private String image;

	
	// Constructors

	public CategorieM() {
	}
	
	public CategorieM(int id_categorie) {
		this.id_categorie = id_categorie;
	}
	
	public CategorieM(int id_categorie, String titre, String video, String description, String image) {
		this.id_categorie = id_categorie;
		this.titre = titre;
		this.video=video;
		this.description = description;
		this.image = image;
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

	public String getVideo() {
		return video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "CategorieM [id_categorie=" + id_categorie + ", titre=" + titre + ", video=" + video + ", description="
				+ description + ", image=" + image + "]";
	}

	


	
}
