package model;

public class SlidesM {
	
	private int id_slides;
	private String titre;
	private String image;
	private String url;
	
	
	// Constructors
	
	public SlidesM() {	
	}


	public SlidesM(int id_slides, String titre, String image, String url) {
		this.id_slides = id_slides;
		this.titre = titre;
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
		return "SlidesM [id_slides=" + id_slides + ", titre=" + titre + ", image=" + image + ", url=" + url + "]";
	}
	
	

}
