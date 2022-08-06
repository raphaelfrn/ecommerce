package controller;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

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
		
		UtilisateursDao userDao = new UtilisateursDao();
		Adresses_livraisonDao addressDao = new Adresses_livraisonDao();
		request.setAttribute("listAddress", addressDao.addressUser(userId));
		
		try {
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
				
				boolean msgPwdNo=false;
				if( lastPwd !=null && newPwd !=null && repeatPwd !=null ) {
					String lastPwdUser = userDao.findById(userId).getMot_de_passe();
					String saisielastPwdUser = encode(lastPwd);
					if ( saisielastPwdUser.equalsIgnoreCase(lastPwdUser) && newPwd.equalsIgnoreCase(repeatPwd) ) {
						String newPwdUser = encode(newPwd);
						userUpdate.setMot_de_passe(newPwdUser);
						request.setAttribute("msgUpdatPwd", userDao.updatePwd(userUpdate, userId));
					} else {
						msgPwdNo=true;
						request.setAttribute("msgPwdNo", msgPwdNo);
					}
				 }
			}
		} catch (NoSuchAlgorithmException e) {
			System.out.println("pas ok");
			e.printStackTrace();
		}
		
		request.setAttribute("InfosUser", userDao.findById(userId));
		
//		Suppresion compte client
//		String actionDelete = request.getParameter("action");
//		System.out.println(actionDelete);
//		if (actionDelete != null || actionDelete=="deleteUser") {
//			request.setAttribute("msgDeleteUser", userDao.delete(userId));
//		}
			
		
		request.getRequestDispatcher("view/pages/account.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	
	public static String encode(String value) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		byte[] hash = md.digest(value.getBytes(StandardCharsets.UTF_8)); String encoded = Base64.getEncoder().encodeToString(hash);
		return encoded;
	}

}
