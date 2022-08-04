package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommandesDao;
import dao.Details_commandeDao;
import model.CommandesM;
import model.Details_commandeM;
import model.PanierDetailsM;
import model.PanierM;


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
		
		 
		
		
//		// delete
//		if(request.getParameter("idtodelete")!=null ) {
//			HttpSession session = request.getSession( true );
//			int idproduit=Integer.valueOf(request.getParameter("idtodelete"));
//			PanierM panier=(PanierM) session.getAttribute("panier");
//			panier.delete(idproduit);
//			session.setAttribute( "panier", panier );
//		}
//		
//		
//		boolean commandeok=false;
//		
//		
//		// Validate command
//		if(request.getParameter("valider")!=null ) {
//			HttpSession session = request.getSession( true );
//			
//			CommandesDao commandedao=new CommandesDao();
//			Details_commandeDao detaildao=new Details_commandeDao();
//			
//			PanierM panier=(PanierM) session.getAttribute("panier");
//			
//			int InscriptionId= (int)session.getAttribute("userid");
//			float total=panier.total();
//			long millis=System.currentTimeMillis();  
//	        Date date=new Date(millis);
//	        
//	        
//	    //  Save command and get ID
//	     
//	        CommandesM commande=new CommandesM(InscriptionId,total,date);
//	        int commandeid=commandedao.create(commande);
//	        
//	      // detail command
//	        for(PanierDetailsM pd:panier.articles) {
//	        	Details_commandeM d = new Details_commandeM();
//	        	d.setQuantite(pd.getQte());
//	        	d.setId_commande(commandeid));
//	        	d.setPrix(pd.getProduit().getPrix());
//	        	d.setId_produit(pd.getProduit().getId_produit());
//	        	detaildao.create(d);
//	        }
//	        panier.empty();
//			session.setAttribute( "panier", panier );
//			commandeok=true;
//			response.sendRedirect("Commandeok"); 
//		}	
//		
//		if(commandeok==false) {
//			request.getRequestDispatcher("view/pages/panier.jsp").forward(request, response);
//			}
		
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
	
	public float total() {
		float total=0;
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
	
	public void empty() {
		articles= new ArrayList<PanierDetailsM>();
	}
	
	
}
