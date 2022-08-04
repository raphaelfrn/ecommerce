package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PanierDetailsM;


/**
 * Servlet implementation class Panier
 */
@WebServlet("/panier")
public class Panier extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ArrayList<PanierDetailsM> articles = new ArrayList<>();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Panier() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("view/pages/panier.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public int count() {
		
		return articles.size();
	}
	
	public void add(PanierDetailsM panierDetails) {
		boolean exist=false;
		
		for(PanierDetailsM dp:articles){
			if(dp.getProduit().getId_produit() == panierDetails.getProduit().getId_produit()){
			exist= true;
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
		for(PanierDetailsM pp:articles) {
			if(pp.getProduit().getId_produit()==idProduit) {
				detail=pp;
			}
		}
		articles.remove(detail);
	}
	
	public void vider() {
		articles= new ArrayList<PanierDetailsM>();
	}
	
	
}
