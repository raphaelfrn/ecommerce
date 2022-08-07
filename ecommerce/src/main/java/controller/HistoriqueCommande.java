package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommandesDao;

/**
 * Servlet implementation class HistoriqueCommande
 */
@WebServlet("/historique")
public class HistoriqueCommande extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	CommandesDao cDao = new CommandesDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HistoriqueCommande() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		int userId = (int)session.getAttribute("userid");
		
		request.setAttribute("listCommand", cDao.readByUserId(userId));
		
	
		
		
		request.getRequestDispatcher("view/pages/historique.jsp").forward(request, response);	}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
