package model;

public class ImagesM {
	
	private int id_image;
	private ProduitsM id_produit;
	private String url;
	
	
	// Constructors
	
	public ImagesM() {
	}
	
	public ImagesM(int id_image, ProduitsM id_produit, String url) {
		this.id_image = id_image;
		this.id_produit = id_produit;
		this.url = url;
	}
	
	// Getters and Setters

	
	public int getId_image() {
		return id_image;
	}
	public void setId_image(int id_image) {
		this.id_image = id_image;
	}
	public ProduitsM getId_produit() {
		return id_produit;
	}
	public void setId_produit(ProduitsM id_produit) {
		this.id_produit = id_produit;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	@Override
	public String toString() {
		return "ImagesM [id_image=" + id_image + ", id_produit=" + id_produit + ", url=" + url + "]";
	}
	
	

}
