package bitshyd.dbmsproject.web.controller;

import java.io.IOException;
import java.util.ArrayList;

import bitshyd.dbmsproject.web.dao.UserDao;
import bitshyd.dbmsproject.web.model.User;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SearchCustomerController
 */
public class SearchCustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		forwardRequest(null , "SearchCustomer.jsp", request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String submitType = request.getParameter("actionType");
		if (submitType != null){
			if(submitType.equalsIgnoreCase("block")) {
				int userId = Integer.parseInt(request.getParameter("id"));
				UserDao objUserDao = new UserDao();
				objUserDao.blockUser(userId, 3);
			}
			else if(submitType.equalsIgnoreCase("activate")) {
				int userId = Integer.parseInt(request.getParameter("id"));
				UserDao objUserDao = new UserDao();
				objUserDao.activateUser(userId, 3);
			}
			else if(submitType.equalsIgnoreCase("delete")) {
				int userId = Integer.parseInt(request.getParameter("id"));
				UserDao objUserDao = new UserDao();
				objUserDao.deleteUser(userId, 3);
			}
		}
		UserDao objUserDao = new UserDao();
		ArrayList<User> arrUsers =  objUserDao.GetCustomers(request.getParameter("FieldName"), request.getParameter("Value"));
		forwardRequest(arrUsers, "SearchCustomer.jsp", request, response);
	}
	
	private void forwardRequest(ArrayList<User> model, String pagename, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setAttribute("model", model);
		RequestDispatcher rd = request.getRequestDispatcher(pagename);
		rd.forward(request, response);	
	}

}
