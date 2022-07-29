package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Sous_categoriesDao;

/**
 * Servlet implementation class SousCategories
 */
@WebServlet("/sous-categories")
public class SousCategories extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Sous_categoriesDao sousCatDao = new Sous_categoriesDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SousCategories() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int idCat= Integer.valueOf(request.getParameter("idCat"));	
		request.setAttribute("listSousCat", sousCatDao.readByCat(idCat));
		
		request.getRequestDispatcher("/view/pages/sous-categories.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
