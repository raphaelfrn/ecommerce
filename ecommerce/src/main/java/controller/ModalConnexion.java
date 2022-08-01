package controller;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
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
 * Servlet implementation class ModalConnexion
 */
@WebServlet("/modalConnexion")
public class ModalConnexion extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	UtilisateursDao userDao=new UtilisateursDao();
	Adresses_livraisonDao addressDao = new Adresses_livraisonDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModalConnexion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			boolean connected=false;
		
			if(request.getParameter("btnConnexion")!=null ) {
				String email=request.getParameter("emailCo");
				String password=request.getParameter("passwordCo");
				String pwd = encode(password);

				UtilisateursM user = userDao.connexion(email, pwd);
				
				if(user==null) {
					System.out.println("pas encore connecté");
				
				} else {
		
					HttpSession session = request.getSession( true );
			        session.setAttribute( "userid", user.getId_utilisateur());
			        session.setAttribute( "userid", user.getId_utilisateur());
			        session.setAttribute( "userEmail", user.getEmail());
			        session.setAttribute( "userNom", user.getNom());
			        session.setAttribute( "userPrenom", user.getPrenom());
			        session.setAttribute( "userTelephone", user.getTelephone());
			        System.out.println("top connecté");
			        
			        session.setAttribute( "isConnected", true );
					connected=true;
					response.sendRedirect("panier");
					System.out.println("connected " +connected);
					
					
					
				}
			}
			
			if(connected==false) {
				System.out.println("connected " + connected);
				request.getRequestDispatcher("view/modals/modal-connexion.jsp").forward(request, response);
			}
	
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public static String encode(String value) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		byte[] hash = md.digest(value.getBytes(StandardCharsets.UTF_8)); String encoded = Base64.getEncoder().encodeToString(hash);
		return encoded;
	}
	
}