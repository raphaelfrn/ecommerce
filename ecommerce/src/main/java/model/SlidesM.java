package model;

public class SlidesM {
	
	private int id_slides;
	private String titre;
	private String sous_titre;
	private String image;
	private String url;
	
	
	// Constructors
	
	public SlidesM() {	
	}

	public SlidesM(int id_slides, String titre, String sous_titre, String image, String url) {
		this.id_slides = id_slides;
		this.titre = titre;
		this.sous_titre = sous_titre;
		this.image = image;
		this.url = url;
	}



	// Getters and Setters


	public int getId_slides() {
		return id_slides;
	}


	public void setId_slides(int id_slides) {
		this.id_slides = id_slides;
	}


	public String getTitre() {
		return titre;
	}


	public void setTitre(String titre) {
		this.titre = titre;
	}
	
	
	public String getSous_titre() {
		return sous_titre;
	}

	public void setSous_titre(String sous_titre) {
		this.sous_titre = sous_titre;
	}

	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}


	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public String toString() {
		return "Slides id " + id_slides + " titre " + titre + " subtitle " + sous_titre + " image " + image
				+ " url " + url;
	}

}
