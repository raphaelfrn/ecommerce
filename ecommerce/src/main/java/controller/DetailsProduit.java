package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ImagesDao;
import dao.ProduitsDao;
import model.ImagesM;
import model.PanierDetailsM;
import model.PanierM;
import model.ProduitsM;

/**
 * Servlet implementation class DetailsProduit
 */
@WebServlet("/details")
public class DetailsProduit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ProduitsDao produitsDao = new ProduitsDao();
	ImagesDao imagesDao = new ImagesDao();
       
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
			
			ProduitsM produit = produitsDao.findById(id);
			ArrayList<ImagesM> image = imagesDao.readByIdProduit(id);
			
			
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
		
		
		request.getRequestDispatcher("/view/pages/details-produit.jsp").forward(request, response);
		
		
}
		
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
