package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommentairesDao;
import dao.FavorisDao;
import dao.ProduitsDao;
import dao.Sous_categoriesDao;
import dao.UtilisateursDao;
import model.FavorisM;
import model.PanierDetailsM;
import model.PanierM;
import model.ProduitsM;
import model.Sous_categoriesM;
import model.UtilisateursM;

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

			
			// add to cart
			
			if(request.getParameter("btnAdd")!=null ) {
				
				HttpSession session = request.getSession( true );
				
				int produitId = Integer.parseInt(request.getParameter("btnAdd"));
				ProduitsM produit = produitsDao.findById(produitId);
				PanierDetailsM panieradd=new PanierDetailsM(produit,1);	
			
				
				PanierM panier=(PanierM) session.getAttribute("panier");
				panier.add(panieradd);
				session.setAttribute( "panier", panier );
		
				
			}	
		

			
			// add to wish list
			boolean addWishList = false;
			if(request.getParameter("btnFav")!=null ) {
				
				HttpSession session = request.getSession();
				int userId = (int)session.getAttribute("userid");
				int produitId = Integer.parseInt(request.getParameter("btnFav")) ;
				
				UtilisateursDao uDao = new UtilisateursDao();
				
				FavorisM fav = new FavorisM();
				fav.setId_utilisateur(uDao.findById(userId));
				fav.setId_produit(produitsDao.findById(produitId));
				addWishList = true;
				
				FavorisDao favDao = new FavorisDao();
				request.setAttribute("listAddress", favDao.create(fav));
		
				
			}
			request.setAttribute("addWishList", addWishList);
	
			
		
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
