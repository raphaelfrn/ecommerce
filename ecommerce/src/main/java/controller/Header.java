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
import dao.CategorieDao;


import dao.UtilisateursDao;

import model.UtilisateursM;


/**
 * Servlet implementation class Header
 */
@WebServlet("/header")
public class Header extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	CategorieDao catDao = new CategorieDao();
	
	UtilisateursDao userDao=new UtilisateursDao();
	Adresses_livraisonDao addressDao = new Adresses_livraisonDao();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Header() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean connected=false;
		
		
		// session
		HttpSession session = request.getSession(true);
		if(session.getAttribute("isConnected")==null) {
			session.setAttribute( "isConnected", false );
		}
		
		// categories 
		request.setAttribute("listCat", catDao.read());	
		
		// session
		
		try {
			if(request.getParameter("btnConnexion")!=null ) {
				String email=request.getParameter("emailCo");
				String password=request.getParameter("passwordCo");
				String pwd = encode(password);
				UtilisateursM user = userDao.connexion(email, pwd);
				if(user==null) {
					System.out.println("Pas encore connecté");
				} else {
					request.getSession( true );
			        session.setAttribute( "userid", user.getId_utilisateur());
			        session.setAttribute( "userEmail", user.getEmail());
			        session.setAttribute( "userNom", user.getNom());
			        session.setAttribute( "userPrenom", user.getPrenom());
			        session.setAttribute( "userTelephone", user.getTelephone());
			        session.setAttribute( "isConnected", true );
					connected=true;	
					System.out.println("Vous êtes connecté");
				}
			}	
			if((boolean)session.getAttribute("isConnected")!=false) {
				System.out.println("connecter");
				int userId = (int)session.getAttribute("userid");
				UtilisateursDao userDao = new UtilisateursDao();
				request.setAttribute("InfosUser", userDao.findById(userId));
			} 

		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		if(!connected) {
			request.getRequestDispatcher("/view/menu/header.jsp").forward(request, response);
		} else {	
			request.getRequestDispatcher("/view/menu/header.jsp").forward(request, response);
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
