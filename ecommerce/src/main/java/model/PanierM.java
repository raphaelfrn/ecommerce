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
	
	
}
