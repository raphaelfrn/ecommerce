package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommandesDao;
import model.Adresses_livraisonM;
import model.CommandesM;
import model.PanierM;
import model.UtilisateursM;

/**
 * Servlet implementation class Confirmation
 */
@WebServlet("/confirmation")
public class Confirmation extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	CommandesDao cDao = new CommandesDao();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Confirmation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
		
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("commandeId"));
	
		
CommandesM commande = cDao.findById((int) session.getAttribute("commandeId")); 


	
		
		
		request.setAttribute("commande", commande);
		
		
		request.getRequestDispatcher("/view/pages/confirm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
