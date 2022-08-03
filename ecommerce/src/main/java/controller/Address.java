package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Adresses_livraisonDao;
import model.Adresses_livraisonM;
import model.UtilisateursM;

/**
 * Servlet implementation class Address
 */
@WebServlet("/address")
public class Address extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Address() {
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
		
		request.getRequestDispatcher("view/pages/address.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int userId = (int)session.getAttribute("userid");
		
		if (request.getParameter("btnAddPageAddress") != null) {
			
			String adresse = request.getParameter("address");
			String city = request.getParameter("city");
			int zipCode = Integer.valueOf(request.getParameter("zipCode"));
			String country = request.getParameter("country");
			
			Adresses_livraisonDao  addressDao = new Adresses_livraisonDao();
			Adresses_livraisonM address = new Adresses_livraisonM();
			address.setUtilisateur(new UtilisateursM((userId)));
			address.setAdresse(adresse);
			address.setVille(city);
			address.setCode_postal(zipCode);
			address.setPays(country);
			
			addressDao.create(address);
		}
		
		doGet(request, response);
	}

}
