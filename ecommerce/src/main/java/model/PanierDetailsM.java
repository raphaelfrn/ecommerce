package model;

public class PanierDetailsM {

	
	private ProduitsM produit;
	private int qte;
	
	public PanierDetailsM() {
		
	}
	
	public PanierDetailsM(ProduitsM produit, int qte) {
		this.produit = produit;
		this.qte = qte;
	}
	public ProduitsM getProduit() {
		return produit;
	}
	public void setProduit(ProduitsM produit) {
		this.produit = produit;
	}
	public int getQte() {
		return qte;
	}
	public void setQte(int qte) {
		this.qte = qte;
	}
	
	@Override
	public String toString() {
		return "PanierDetails [produit=" + produit + ", qte=" + qte + "]";
	}
	
	
}
