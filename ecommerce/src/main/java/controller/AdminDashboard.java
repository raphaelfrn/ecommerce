package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategorieDao;
import dao.CommandesDao;
import dao.ContactDao;
import dao.Details_commandeDao;
import dao.ProduitsDao;
import dao.RecherchesDao;
import dao.Sous_categoriesDao;
import dao.UtilisateursDao;
import dao.VisitesDao;
import model.Details_commandeM;

/**
 * Servlet implementation class AdminDashboard
 */
@WebServlet("/adminDashboard")
public class AdminDashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
	   
		UtilisateursDao userDao = new UtilisateursDao();
		CategorieDao catDao = new CategorieDao();
		Sous_categoriesDao sousCatDao = new Sous_categoriesDao();
		ProduitsDao productsDao = new ProduitsDao();
		RecherchesDao searchDao = new RecherchesDao();
		ContactDao contactDao = new ContactDao();
		CommandesDao commandesDao = new CommandesDao();
		Details_commandeDao detailsCoDao = new Details_commandeDao();
		VisitesDao visitDao = new VisitesDao();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDashboard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Data for graphique
		request.setAttribute("listUserNnbr", userDao.read().size());
		request.setAttribute("listUsers", userDao.read());
		request.setAttribute("listUsersLastRegister", userDao.userLastregister());
		request.setAttribute("usersByMonth", userDao.usersByMonth());
		request.setAttribute("listCat", catDao.read());
	
		request.setAttribute("listSousCat", sousCatDao.read());
		request.setAttribute("listProducts", productsDao.read());
		request.setAttribute("visitByProd", visitDao.visitByProd());
		request.setAttribute("nbrVisitByProd", visitDao.nbrVisitByProd());	
		request.setAttribute("visitByYear", visitDao.visitByYear().size());	
	
		request.setAttribute("listSearch", searchDao.groupByMotCle());
		request.setAttribute("listSearchCount", searchDao.groupByMotCleCount());
		request.setAttribute("listLastContact", contactDao.lastContact());
		request.setAttribute("NbrContactNotRead",contactDao.notReadContact().size());
		request.setAttribute("caByYear", commandesDao.caByYear());
		request.setAttribute("caByMonth", commandesDao.caByMonth());
		request.setAttribute("listBestSeller", detailsCoDao.productBestSeller());
		request.setAttribute("totalCaByCat", detailsCoDao.totalCaByCat());
		
		//Total BestSeller
		float price = detailsCoDao.productBestSeller().getPrix();
		int qte = detailsCoDao.productBestSeller().getQuantite();
		float totalBestSeller = price * qte; 
		request.setAttribute("totalBestSeller", totalBestSeller);

		request.getRequestDispatcher("view/admin/admin-dashboard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
