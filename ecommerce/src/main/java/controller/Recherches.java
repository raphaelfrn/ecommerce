package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProduitsDao;
import dao.RecherchesDao;
import model.PanierDetailsM;
import model.PanierM;
import model.ProduitsM;
import model.RecherchesM;
import model.UtilisateursM;

/**
 * Servlet implementation class Recherches
 */
@WebServlet("/recherche")
public class Recherches extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ProduitsDao produitsDao = new ProduitsDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Recherches() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		HttpSession session = request.getSession();
	
		
		
		// search
				ProduitsDao produitDao = new ProduitsDao();
				String search = request.getParameter("search");
				String query = request.getQueryString();
				
				request.setAttribute("query", query);
				
			  request.setAttribute("listSearch", produitDao.search(search));
			  
		// add to cart
			  
			  if(request.getParameter("param")!=null && request.getParameter("param") == String.valueOf(request.getParameter("param")) ) {
						
					int id = Integer.valueOf(request.getParameter("param"));
					ProduitsM produit = produitsDao.findById(id);
					PanierDetailsM panieradd=new PanierDetailsM(produit,1);	
		
					PanierM panier=(PanierM) session.getAttribute("panier");
					panier.add(panieradd);
					session.setAttribute( "panier", panier );  
					
				}		
			  
			  
			  
		// stocker dans la table recherche
			  
		
		 RecherchesDao rechercheDao = new RecherchesDao();
		  RecherchesM recherche = new RecherchesM();
		  
		  if(search != null) {
			  
			  if((boolean)session.getAttribute("isConnected")!=false) {
			  int userId = (int)session.getAttribute("userid"); 
			  
			  recherche.setId_utilisateur(new UtilisateursM((userId)));
			  recherche.setMot_cle(search);
			  rechercheDao.create(recherche);
			  
			  } else {
                  recherche.setId_utilisateur(new UtilisateursM((1)));
                  recherche.setMot_cle(search);
                rechercheDao.create(recherche) ; 
              }
			
			 
			
		  }
		
		request.getRequestDispatcher("/view/pages/recherches.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
	}

}