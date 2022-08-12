package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Adresses_livraisonDao;
import dao.CommandesDao;
import dao.CommentairesDao;
import dao.ContactDao;
import dao.Details_commandeDao;
import dao.UtilisateursDao;
import model.UtilisateursM;

/**
 * Servlet implementation class AdminUserDetails
 */
@WebServlet("/adminUserDetails")
public class AdminUserDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
      UtilisateursDao userDao = new UtilisateursDao();
      CommandesDao cDao = new CommandesDao();
      CommentairesDao commentairesDao = new CommentairesDao();
      Details_commandeDao dcDao = new Details_commandeDao();
      ContactDao contactDao = new ContactDao();
      Adresses_livraisonDao addressDao = new Adresses_livraisonDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUserDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int UserId = Integer.valueOf(request.getParameter("id")) ;
		
		// User info
		request.setAttribute("UserInfo", userDao.findById(UserId));
		
		if(request.getParameter("btnUpdate")!=null) {
			String nom = request.getParameter("name");
			String prenom = request.getParameter("prenom");
			String email = request.getParameter("email");
			String telephone = request.getParameter("tel");
			
			UtilisateursM userUpdate = new UtilisateursM();
			userUpdate.setNom(nom);
			userUpdate.setPrenom(prenom);
			userUpdate.setEmail(email);
			userUpdate.setTelephone(telephone);
			
			userDao.update(userUpdate, UserId);
		}
		
		// adresses
		request.setAttribute("listAddress", addressDao.addressUser(UserId));
		
		// liste commandes
		request.setAttribute("listCommand", cDao.readByUserId(UserId));
		
		// commentaires
		request.setAttribute("listCommentaires", commentairesDao.readByUserId(UserId));
		
		// contact
		request.setAttribute("listContact", contactDao.readByUserId(UserId));
		
		
		// details commande
		
		if(request.getParameter("btnDetailsC")!=null) {
			int produitId = Integer.parseInt(request.getParameter("btnDetailsC")) ;
			request.setAttribute("listDC", dcDao.findByIdCommande(produitId));
		}
		
		
		
		request.getRequestDispatcher("view/admin/admin-user-details.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
