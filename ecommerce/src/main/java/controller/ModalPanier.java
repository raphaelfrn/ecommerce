package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.PanierM;

/**
 * Servlet implementation class ModalPanier
 */
@WebServlet("/modalPanier")
public class ModalPanier extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModalPanier() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
//		if(request.getParameter("inputQuantity") != null) {
//			ProduitsDao produitsDao = new ProduitsDao();
//			
//			HttpSession session = request.getSession( true );
//			int id = Integer.valueOf(request.getParameter("id"));
//			int qte=Integer.valueOf(request.getParameter("quantity"));
//			ProduitsM produit = produitsDao.findById(id);
//			PanierDetailsM panieradd=new PanierDetailsM(produit,qte);	
//		
//			
//			PanierM panier=(PanierM) session.getAttribute("panier");
//			panier.add(panieradd);
//			session.setAttribute( "panier", panier );
//		}
		
		
		// total panier
		
		HttpSession session = request.getSession();
		PanierM panier=(PanierM) session.getAttribute("panier");
		float total = (float) panier.total();
		 session.setAttribute( "total", total);
		
		
		// delete and reset total
		
		if(request.getParameter("btnDelete")!=null ) {
			 session = request.getSession( true );
			 int produitId = Integer.parseInt(request.getParameter("btnDelete")) ;
			 panier=(PanierM) session.getAttribute("panier");
				panier.delete(produitId);
				session.setAttribute( "panier", panier );
				float totalDel = (float) panier.total();
				session.setAttribute("total", totalDel);
			 
		}
			
				
		request.getRequestDispatcher("view/modals/modal-panier.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
