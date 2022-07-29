package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Adresses_livraisonDao;
import dao.UtilisateursDao;
import model.Adresses_livraisonM;
import model.UtilisateursM;


/**
 * Servlet implementation class ModalInscription
 */
@WebServlet("/modalInscription")
public class ModalInscription extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	UtilisateursDao userDao = new UtilisateursDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModalInscription() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("listUsers", userDao.read());

		request.getRequestDispatcher("view/modals/modal-inscription.jsp").forward(request, response);	
		
		}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		if(request.getParameter("btnInscription")!=null ) {	
			String name = request.getParameter("name");
			String firstname = request.getParameter("firstname");
			String mail = request.getParameter("email");
			String phone = request.getParameter("phone");
			String password = request.getParameter("password");
			
			UtilisateursM user = new UtilisateursM();
			user.setNom(name);
			user.setPrenom(firstname);
			user.setEmail(mail);
			user.setTelephone(phone);
			user.setMot_de_passe(password);
			
			request.setAttribute("msgUser", userDao.create(user));
			
			String adresse = request.getParameter("address");
			String city = request.getParameter("city");
			int zipCode = Integer.valueOf(request.getParameter("zipCode"));
			String country = request.getParameter("country");
			
			
			userDao.findByMail(mail).getId_utilisateur();

			Adresses_livraisonDao  addressDao = new Adresses_livraisonDao();
			Adresses_livraisonM address = new Adresses_livraisonM();
			address.setUtilisateur(new UtilisateursM(userDao.findByMail(mail).getId_utilisateur()));
			address.setAdresse(adresse);
			address.setVille(city);
			address.setCode_postal(zipCode);
			address.setPays(country);
			
			addressDao.create(address);
		}

		doGet(request, response);
	}
}	