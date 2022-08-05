package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Adresses_livraisonDao;
import dao.ContactDao;
import dao.UtilisateursDao;
import model.Adresses_livraisonM;
import model.ContactM;
import model.UtilisateursM;

/**
 * Servlet implementation class Contact
 */
@WebServlet("/contact")
public class Contact extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ContactDao contactDao = new ContactDao();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Contact() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		
		if((boolean)session.getAttribute("isConnected")!=false) {
			int userId = (int)session.getAttribute("userid");
	
			request.setAttribute("listContact", contactDao.read());
		} 

		request.getRequestDispatcher("view/pages/contact.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		
		if((boolean)session.getAttribute("isConnected")!=false) {
			int userId = (int)session.getAttribute("userid");
			
			if (request.getParameter("btnContact") != null) {
				
				String sujet = request.getParameter("sujet");
				String msgContact = request.getParameter("msgContact");
				
				System.out.println(sujet);
				System.out.println(msgContact);
				
				ContactM contact = new ContactM();
				contact.setId_utilisateur(new UtilisateursM((userId)));
				contact.setSujet(sujet);
				contact.setMessage(msgContact);
				contact.setEtat(1);
				
				request.setAttribute("msgCreateContact", contactDao.create(contact));
			}
		} 
		
		doGet(request, response);
	}

}
