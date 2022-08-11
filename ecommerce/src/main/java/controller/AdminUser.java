package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UtilisateursDao;
import model.PanierM;
import model.UtilisateursM;

/**
 * Servlet implementation class AdminUser
 */
@WebServlet("/adminUser")
public class AdminUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	UtilisateursDao uDao = new UtilisateursDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("listUser", uDao.read());
		
		// delete
				if(request.getParameter("idtodelete")!=null ) {
					 request.getSession( true );
					int UserId=Integer.valueOf(request.getParameter("idtodelete"));
					uDao.delete(UserId);
					
				}
		
		
		request.getRequestDispatcher("view/admin/admin-user.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
