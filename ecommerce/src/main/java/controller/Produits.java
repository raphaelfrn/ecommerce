package controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProduitsDao;
import dao.Sous_categoriesDao;
import model.PanierDetailsM;
import model.PanierM;
import model.ProduitsM;
import model.Sous_categoriesM;

/**
 * Servlet implementation class Produits
 */
@WebServlet("/produits")
public class Produits extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ProduitsDao produitsDao = new ProduitsDao();
	
	Sous_categoriesDao sousCatDao = new Sous_categoriesDao();
	
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Produits() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idSousCat= Integer.valueOf(request.getParameter("idSousCat"));
		 
		 request.setAttribute("listProduits", produitsDao.produitByIdSousCat(idSousCat));
		 
		 Sous_categoriesM sousCat = sousCatDao.findById(idSousCat);
			
			request.setAttribute("sC", sousCat);			
		
			
			if(request.getParameter("param")!=null ) {
				
				HttpSession session = request.getSession( true );
				int id = Integer.valueOf(request.getParameter("param"));
				ProduitsM produit = produitsDao.findById(id);
				PanierDetailsM panieradd=new PanierDetailsM(produit,1);	
			
				
				PanierM panier=(PanierM) session.getAttribute("panier");
				panier.add(panieradd);
				session.setAttribute( "panier", panier );
		
				
			}	
	
	
			
		
		request.getRequestDispatcher("/view/pages/produits.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		doGet(request, response);
	}

}
