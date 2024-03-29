package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Adresses_livraisonDao;
import dao.CommandesDao;
import dao.Details_commandeDao;
import dao.FavorisDao;
import dao.ProduitsDao;
import dao.UtilisateursDao;
import model.Adresses_livraisonM;
import model.CommandesM;
import model.Details_commandeM;
import model.PanierDetailsM;
import model.PanierM;
import model.ProduitsM;
import model.UtilisateursM;


/**
 * Servlet implementation class Panier
 */
@WebServlet("/panier")
public class Panier extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
	ArrayList<PanierDetailsM> articles = new ArrayList<>();
	UtilisateursDao userDao = new UtilisateursDao();
	CommandesDao cDao = new CommandesDao();
	Details_commandeDao dcDao=new Details_commandeDao();
	Adresses_livraisonDao adresse = new Adresses_livraisonDao();
	ProduitsDao produitsDao = new ProduitsDao();
	 FavorisDao favorisDao = new FavorisDao();
	
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
		
		HttpSession session = request.getSession();
		
		
		
		if((boolean)session.getAttribute("isConnected")!=false) {
			
			// adresse
			
			
			int userId = (int)session.getAttribute("userid");
			Adresses_livraisonDao addressDao = new Adresses_livraisonDao();
			request.setAttribute("InfosUser", userDao.findById(userId));
			request.setAttribute("listAddress", addressDao.addressUser(userId));
			
			}
	


	// delete
		if(request.getParameter("idtodelete")!=null ) {
			 request.getSession( true );
			int idproduit=Integer.valueOf(request.getParameter("idtodelete"));
			PanierM panier=(PanierM) session.getAttribute("panier");
			panier.delete(idproduit);
			session.setAttribute( "panier", panier );
		}
		
	

		
		request.getRequestDispatcher("view/pages/panier.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		boolean commandeok=false;
		
	// create commande
		
		
		if("btnCommande" != null ) {
			CommandesM commande = new CommandesM();
			HttpSession session = request.getSession();
			
					if((boolean)session.getAttribute("isConnected")!=false) {
					
					int idUser = (int)session.getAttribute("userid");
					
					
			PanierM panier=(PanierM) session.getAttribute("panier");
			float total = (float) panier.total();
			
			int idAdresse =	adresse.findMainAddress(idUser).getId_adresse_livraison();

			commande.setId_utilisateur(new UtilisateursM(idUser));
			commande.setTotal(total);
			commande.setId_adresse_livraison(new Adresses_livraisonM(idAdresse));
			commande.setEtat(1);
	
			int commandeId = cDao.createReturn(commande);
			
					

			
			   // detail command
			
	        for(PanierDetailsM pd:panier.getArticles()) {
	        	Details_commandeM d = new Details_commandeM();
	        	d.setQuantite(pd.getQte());
	        	d.setId_commande(cDao.findById(commandeId));
	        	d.setPrix(pd.getProduit().getPrix());
	        	d.setId_produit(new ProduitsM (pd.getProduit().getId_produit()));
	        	dcDao.create(d);
	        
	        }
	        panier.vider();
	        session.setAttribute("commandeId", commandeId);
	        
	        session.setAttribute( "panier", panier );
			commandeok=true;
			
			response.sendRedirect("confirmation"); 
					}
		}
		

		if(commandeok==false) {
			doGet(request, response);
			}
		
	}
	
	
		
	
}
