package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Adresses_livraisonDao;
import dao.UtilisateursDao;
import model.Adresses_livraisonM;
import model.UtilisateursM;

/**
 * Servlet implementation class MyAccount
 */
@WebServlet("/account")
public class MyAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		int userId = (int)session.getAttribute("userid");
		
		Adresses_livraisonDao addressDao = new Adresses_livraisonDao();
		request.setAttribute("listAddress", addressDao.addressUser(userId));
		
		if (request.getParameter("btnUpdateUser")!=null ) {

			String newPhone = request.getParameter("newPhone");
			String repeatPhone = request.getParameter("repeatPhone");
			
			String newLastname = request.getParameter("newLastname");
			String newFirstname = request.getParameter("newFirstname");
			
			String newMail = request.getParameter("newMail");
			String repeatEMail = request.getParameter("repeatEMail");
			
			String lastPwd = request.getParameter("lastPwd");
			String newPwd = request.getParameter("newPwd");
			String repeatPwd = request.getParameter("repeatPwd");
			
			UtilisateursDao userDao = new UtilisateursDao();
			UtilisateursM userUpdate = new UtilisateursM();
			

			if( newPhone !=null && repeatPhone !=null  && newPhone.equalsIgnoreCase(repeatPhone)) {
				userUpdate.setTelephone(request.getParameter("newPhone"));
				request.setAttribute("msgUpdateTel", userDao.updateTel(userUpdate, userId));
			}
			
			if( newLastname !=null && newFirstname !=null ) {
				userUpdate.setNom(newLastname);
				userUpdate.setPrenom(newFirstname);
				request.setAttribute("msgUpdatName", userDao.updateName(userUpdate, userId));
			}

			if( newMail !=null && repeatEMail !=null ) {
				userUpdate.setEmail(repeatEMail);
				request.setAttribute("msgUpdatEmail", userDao.updateMail(userUpdate, userId));
			}
			
			if( lastPwd !=null && newPwd !=null && repeatPwd !=null ) {
				if ( lastPwd.equalsIgnoreCase(newPwd) && lastPwd.equalsIgnoreCase(repeatPwd) ) {
					userUpdate.setMot_de_passe(newPwd);
					request.setAttribute("msgUpdatPwd", userDao.updatePwd(userUpdate, userId));
				}
			 }
			
		}
		
		UtilisateursDao userDao = new UtilisateursDao();
		request.setAttribute("InfosUser", userDao.findById(userId));
		
		request.getRequestDispatcher("view/pages/account.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
