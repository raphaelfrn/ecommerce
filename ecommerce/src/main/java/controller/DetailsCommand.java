package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommandesDao;
import dao.Details_commandeDao;
import model.CommandesM;

/**
 * Servlet implementation class DetailsCommand
 */
@WebServlet("/detailsCommand")
public class DetailsCommand extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Details_commandeDao dcDao = new Details_commandeDao();
	CommandesDao cDao = new CommandesDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailsCommand() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idCommande = Integer.valueOf(request.getParameter("idC"));
		 
		 request.setAttribute("listDC", dcDao.findByIdCommande(idCommande));
		 
		 CommandesM commande = cDao.findById(idCommande);
		 request.setAttribute("commande", commande);
		
		
		request.getRequestDispatcher("view/pages/details-command.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
