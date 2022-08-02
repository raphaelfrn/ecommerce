package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ImagesDao;
import dao.ProduitsDao;
import model.ImagesM;
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
