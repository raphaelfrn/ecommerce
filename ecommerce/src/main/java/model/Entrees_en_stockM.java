package model;

import java.sql.Date;

public class Entrees_en_stockM {
	
	private int id_entrees_en_stock;
	private FournisseursM id_fournisseur;
	private ProduitsM id_produit;
	private Date dateE;
	
	
	// Constructors
	
	public Entrees_en_stockM() {
	}

	public Entrees_en_stockM(int id_entrees_en_stock, FournisseursM id_fournisseur, ProduitsM id_produit, Date dateE) {
		this.id_entrees_en_stock = id_entrees_en_stock;
		this.id_fournisseur = id_fournisseur;
		this.id_produit = id_produit;
		this.dateE = dateE;
	}
	
	// Getters and Setters

	public int getId_entrees_en_stock() {
		return id_entrees_en_stock;
	}

	public void setId_entrees_en_stock(int id_entrees_en_stock) {
		this.id_entrees_en_stock = id_entrees_en_stock;
	}

	public FournisseursM getId_fournisseur() {
		return id_fournisseur;
	}

	public void setId_fournisseur(FournisseursM id_fournisseur) {
		this.id_fournisseur = id_fournisseur;
	}

	public ProduitsM getId_produit() {
		return id_produit;
	}

	public void setId_produit(ProduitsM id_produit) {
		this.id_produit = id_produit;
	}

	public Date getDateE() {
		return dateE;
	}

	public void setDateE(Date dateE) {
		this.dateE = dateE;
	}

	@Override
	public String toString() {
		return "Entrees_en_stockM [id_entrees_en_stock=" + id_entrees_en_stock + ", id_fournisseur=" + id_fournisseur
				+ ", id_produit=" + id_produit + ", dateE=" + dateE + "]";
	}

}
