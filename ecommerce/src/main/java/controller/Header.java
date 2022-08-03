package controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CategorieDao;
import dao.ProduitsDao;


/**
 * Servlet implementation class Header
 */
@WebServlet("/header")
public class Header extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	CategorieDao catDao = new CategorieDao();
	
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
		
		
		// session
		HttpSession session = request.getSession(true);
		if(session.getAttribute("isConnected")==null) {
			session.setAttribute( "isConnected", false );
		}
		
		// search
		ProduitsDao produitDao = new ProduitsDao();
		String search = request.getParameter("search");
		String query = request.getQueryString();
		
		System.out.println(query);
		
		
		request.setAttribute("query", query);
	    request.setAttribute("listSearch", produitDao.search(search));
	        
	        

	        System.out.println(produitDao.search(search));
		
		// categories 
		request.setAttribute("listCat", catDao.read());
		
		
		request.getRequestDispatcher("/view/menu/header.jsp").forward(request, response);
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
