package controller;

import java.io.IOException;
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
import model.CategorieM;

/**
 * Servlet implementation class AdminDashbord
 */
@WebServlet("/adminDashbord")
public class AdminDashbord extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	   
	UtilisateursDao userDao = new UtilisateursDao();
	CategorieDao catDao = new CategorieDao();
	Sous_categoriesDao sousCatDao = new Sous_categoriesDao();
	ProduitsDao productsDao = new ProduitsDao();
	RecherchesDao searchDao = new RecherchesDao();
	ContactDao contactDao = new ContactDao();

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDashbord() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
	
//		ArrayList<Integer> listEtat = new ArrayList<>();
//		contactDao.notReadContact().forEach(t -> 	
//				listEtat.add(t.getEtat())
//		);
		
		

		request.getRequestDispatcher("view/admin/admin-dashbord.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getParameter("addCat") != null) {
			String titleCat = request.getParameter("addTitleCat");
			String videoCat = request.getParameter("addVideoCat");
			String descriptionCat = request.getParameter("addDescriptionCat");
			String imageCat = request.getParameter("addImgCat");
			System.out.println(titleCat);
			System.out.println(videoCat);
			System.out.println(descriptionCat);
			System.out.println(imageCat);
			
			CategorieM categorie = new CategorieM();
			categorie.setTitre(titleCat);
			categorie.setVideo(videoCat);
			categorie.setDescription(descriptionCat);
			categorie.setImage(imageCat);
			
			catDao.create(categorie);
		}
		doGet(request, response);
	}

}
