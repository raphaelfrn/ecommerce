package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.FavorisDao;
import dao.ProduitsDao;
import model.PanierDetailsM;
import model.PanierM;
import model.ProduitsM;

/**
 * Servlet implementation class Wishlist
 */
@WebServlet("/wishlist")
public class Wishlist extends HttpServlet {
	private static final long serialVersionUID = 1L;
	FavorisDao favorisDao = new FavorisDao();
	ProduitsDao produitsDao = new ProduitsDao();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Wishlist() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		int userId = (int)session.getAttribute("userid");
		
		// wishlist
		
		request.setAttribute("favoris", favorisDao.findFavByUser(userId));

			 
		// add to cart from wish list
				
		if(request.getParameter("btnAdd")!=null && "btnAdd".equals("btnAdd") ) {
					
			request.getSession( true );
					
			int idP = Integer.parseInt(request.getParameter("btnAdd"));
			ProduitsM produit = produitsDao.findById(idP);
			PanierDetailsM panieradd=new PanierDetailsM(produit,1);	
			PanierM panier=(PanierM) session.getAttribute("panier");
			panier.add(panieradd);
			favorisDao.delete(idP);
			session.setAttribute( "panier", panier );
					
				}
		
		request.getRequestDispatcher("view/pages/wishlist.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
