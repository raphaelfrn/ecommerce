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
import model.RecherchesM;
import model.UtilisateursM;

/**
 * Servlet implementation class Recherches
 */
@WebServlet("/recherche")
public class Recherches extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
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
			  
			
			  System.out.println(search);
			  
			  
			 // stocker dans la table recherche
			  
		
		 RecherchesDao rechercheDao = new RecherchesDao();
		  RecherchesM recherche = new RecherchesM();
		  
		  if(search != null) {
			  
			  if((boolean)session.getAttribute("isConnected")!=false) {
			  int userId = (int)session.getAttribute("userid"); 
			  
			  recherche.setId_utilisateur(new UtilisateursM((userId)));
			  recherche.setMot_cle(search);
			  System.out.println(recherche);
			  rechercheDao.create(recherche);
			  
			  
			  System.out.println(rechercheDao.create(recherche));
			  
			  }
			
			 
			
		  }
		
		request.getRequestDispatcher("/view/pages/recherches.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		int userId = (int)session.getAttribute("userid");
		doGet(request, response);
	}

}
