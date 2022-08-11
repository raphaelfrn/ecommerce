package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommandesDao;
import dao.UtilisateursDao;

/**
 * Servlet implementation class AdminUserDetails
 */
@WebServlet("/adminUserDetails")
public class AdminUserDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
      UtilisateursDao userDao = new UtilisateursDao();
      CommandesDao cDao = new CommandesDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUserDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int UserId = Integer.valueOf(request.getParameter("id")) ;
		request.setAttribute("UserInfo", userDao.findById(UserId));
		request.setAttribute("listCommand", cDao.readByUserId(UserId));
		
		
		request.getRequestDispatcher("view/admin/admin-user-details.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
