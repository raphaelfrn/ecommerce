package model;

public class ProduitsM {
	
	private int id_produit;
	private String titre;
	private String description;
	private float prix;
	private String image;
	private Sous_categoriesM id_sous_categorie;
	private int stock;
	private int stock_minimum;
	
	
	// Constructors
	
	public ProduitsM() {
	}
	
	public ProduitsM(int id_produit) {
		this.id_produit = id_produit;
	}



	public ProduitsM(int id_produit, String titre, String description, float prix, String image,
			Sous_categoriesM id_sous_categorie, int stock, int stock_minimum) {
		this.id_produit = id_produit;
		this.titre = titre;
		this.description = description;
		this.prix = prix;
		this.image = image;
		this.id_sous_categorie = id_sous_categorie;
		this.stock = stock;
		this.stock_minimum = stock_minimum;
	}

	// Getters and Setters

	public int getId_produit() {
		return id_produit;
	}


	public void setId_produit(int id_produit) {
		this.id_produit = id_produit;
	}


	public String getTitre() {
		return titre;
	}


	public void setTitre(String titre) {
		this.titre = titre;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public float getPrix() {
		return prix;
	}


	public void setPrix(float prix) {
		this.prix = prix;
	}


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}


	public Sous_categoriesM getId_sous_categorie() {
		return id_sous_categorie;
	}


	public void setId_sous_categorie(Sous_categoriesM id_sous_categorie) {
		this.id_sous_categorie = id_sous_categorie;
	}


	public int getStock() {
		return stock;
	}


	public void setStock(int stock) {
		this.stock = stock;
	}


	public int getStock_minimum() {
		return stock_minimum;
	}


	public void setStock_minimum(int stock_minimum) {
		this.stock_minimum = stock_minimum;
	}


	@Override
	public String toString() {
		return "ProduitsM [id_produit=" + id_produit + ", titre=" + titre + ", description=" + description + ", prix="
				+ prix + ", image=" + image + ", id_sous_categorie=" + id_sous_categorie + ", stock=" + stock
				+ ", stock_minimum=" + stock_minimum + "]";
	}

}
