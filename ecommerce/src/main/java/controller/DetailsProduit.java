package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommentairesDao;
import dao.FavorisDao;
import dao.ImagesDao;
import dao.ProduitsDao;
import dao.UtilisateursDao;
import dao.VisitesDao;
import model.CommentairesM;
import model.FavorisM;
import model.ImagesM;
import model.PanierDetailsM;
import model.PanierM;
import model.ProduitsM;
import model.VisitesM;

/**
 * Servlet implementation class DetailsProduit
 */
@WebServlet("/details")
public class DetailsProduit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ProduitsDao produitsDao = new ProduitsDao();
	ImagesDao imagesDao = new ImagesDao();
	CommentairesDao comDao = new CommentairesDao();
	UtilisateursDao uDao = new UtilisateursDao();
	VisitesDao vDao = new VisitesDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailsProduit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int id=Integer.valueOf(request.getParameter("id"));
		
		String param = String.valueOf(request.getParameter("param"));
		
		
		if(param.equalsIgnoreCase("findById") ) {
			
			// affichage produit
			ProduitsM produit = produitsDao.findById(id);
			ArrayList<ImagesM> image = imagesDao.readByIdProduit(id);
			
			// compter les visites sur le produit
			VisitesM visite = new VisitesM();
			HttpSession session = request.getSession( true );
			if((boolean)session.getAttribute("isConnected")!=false) {
				int userId = (int)session.getAttribute("userid");
				visite.setId_utilisateur(uDao.findById(userId));
			} else {
				visite.setId_utilisateur(uDao.findById(1));
			}
			visite.setId_produit(produitsDao.findById(id));
			vDao.create(visite);
			
			// affichage produit
			request.setAttribute("produit", produit);
			request.setAttribute("image", image);
		}
		
		
		// add to cart
		
		if(request.getParameter("btnAdd")!=null ) {
			
			HttpSession session = request.getSession( true );
			
			int qte=Integer.valueOf(request.getParameter("quantity"));
			ProduitsM produit = produitsDao.findById(id);
			PanierDetailsM panieradd=new PanierDetailsM(produit,qte);	
		
			PanierM panier=(PanierM) session.getAttribute("panier");
			panier.add(panieradd);
			session.setAttribute( "panier", panier );
		}	
		
		// add to wish list
		if(request.getParameter("btnFav")!=null ) {
			
			HttpSession session = request.getSession();
			int userId = (int)session.getAttribute("userid");
			int produitId = Integer.parseInt(request.getParameter("btnFav")) ;
			FavorisM fav = new FavorisM();
			fav.setId_utilisateur(uDao.findById(userId));
			fav.setId_produit(produitsDao.findById(produitId));
			
			FavorisDao favDao = new FavorisDao();
			request.setAttribute("listAddress", favDao.create(fav));
	
			
		}
		
	
		
		// read comm
		int produitId=Integer.valueOf(request.getParameter("id"));
		request.setAttribute("commentaires", comDao.readById(produitId));

		
		request.getRequestDispatcher("/view/pages/details-produit.jsp").forward(request, response);
		
}
		
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// add a comment
		
		if(request.getParameter("btnAddComm")!=null ) {
			
			HttpSession session = request.getSession( true );
			int userId = (int)session.getAttribute("userid");
			int produitId=Integer.valueOf(request.getParameter("id"));
			String contenu = request.getParameter("commentaire");
			int note = Integer.parseInt(request.getParameter("rating"));

			CommentairesM commentaire = new CommentairesM();
			commentaire.setCommentaire(contenu);
			commentaire.setNote(note);
			commentaire.setId_produit(produitsDao.findById(produitId));
			commentaire.setId_utilisateur(uDao.findById(userId));
			
			 comDao.create(commentaire);
		}	
		
		doGet(request, response);
	}

}
