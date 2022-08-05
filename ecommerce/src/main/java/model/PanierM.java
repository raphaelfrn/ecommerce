package model;

import java.util.ArrayList;

public class PanierM {
	
	private ArrayList<PanierDetailsM> articles = new ArrayList<>();
	
	// constructor
	
	public PanierM() {
		
	}
	
	public PanierM(ArrayList<PanierDetailsM> articles) {
	
		this.articles = articles;
	}

	// get set
	
	public ArrayList<PanierDetailsM> getArticles() {
		return articles;
	}

	public void setArticles(ArrayList<PanierDetailsM> articles) {
		this.articles = articles;
	}
	
	// to string

	@Override
	public String toString() {
		return "Panier [articles=" + articles + "]";
	}
	public int count() {
		return this.articles.size();
	}
	
	
	public void add(PanierDetailsM panierDetails) {
		boolean exist=false;
		for(PanierDetailsM dp:articles) {
			if(dp.getProduit().getId_produit()==panierDetails.getProduit().getId_produit()) {
				exist=true;
				dp.setQte(dp.getQte()+panierDetails.getQte());
			}
		}
		if(exist==false) {
			articles.add(panierDetails);
		}
	}
	
	public double total() {
		double total=0;
		for(PanierDetailsM dp:articles) {
			total+=dp.getProduit().getPrix()*dp.getQte();
		}
		return total;
	}
	
	public void delete(int idProduit) {
		PanierDetailsM detail= new PanierDetailsM();
		for(PanierDetailsM dp:articles) {
			if(dp.getProduit().getId_produit()==idProduit) {
				detail=dp;
			}
		}
		articles.remove(detail);
	}
	
	public void vider() {
		articles= new ArrayList<PanierDetailsM>();
	}	
	
}
