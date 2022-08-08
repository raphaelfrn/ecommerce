package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategorieDao;
import dao.ContactDao;
import dao.ProduitsDao;
import dao.RecherchesDao;
import dao.Sous_categoriesDao;
import dao.UtilisateursDao;
import model.ContactM;
import model.UtilisateursM;

/**
 * Servlet implementation class Admin
 */
@WebServlet("/admin")
public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			UtilisateursDao userDao = new UtilisateursDao();
			CategorieDao catDao = new CategorieDao();
			Sous_categoriesDao sousCatDao = new Sous_categoriesDao();
			ProduitsDao productsDao = new ProduitsDao();
			RecherchesDao searchDao = new RecherchesDao();
			ContactDao contactDao = new ContactDao();
		
			request.setAttribute("listUserNnbr", userDao.read().size());
			request.setAttribute("listUsers", userDao.read());
			request.setAttribute("listUsersLastRegister", userDao.userLastregister());
			request.setAttribute("listCat", catDao.read());
			request.setAttribute("listSousCat", sousCatDao.read());
			request.setAttribute("listProducts", productsDao.read());
			request.setAttribute("listSearch", searchDao.groupByMotCle());
			request.setAttribute("listSearchCount", searchDao.groupByMotCleCount());
			request.setAttribute("listLastContact", contactDao.lastContact());
			request.setAttribute("NbrContactNotRead",contactDao.notReadContact().size());
		
//			ArrayList<Integer> listEtat = new ArrayList<>();
//			contactDao.notReadContact().forEach(t -> 	
//					listEtat.add(t.getEtat())
//			);
			
			

			request.getRequestDispatcher("view/pages/admin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
