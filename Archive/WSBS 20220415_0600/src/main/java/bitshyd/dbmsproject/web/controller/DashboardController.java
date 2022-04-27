package bitshyd.dbmsproject.web.controller;

import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DashboardController
 */
public class DashboardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public DashboardController() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String userRole =  (String) request.getSession().getAttribute("UserRole");
		String pageName ="";
		
		if (userRole == null)
		{
			response.sendRedirect("Error");
			return;
		}
		else if(userRole.equalsIgnoreCase("Admin")) { 
			pageName = "AdminDashboard.jsp"; 
		}
		else if(userRole.equalsIgnoreCase("Staff")) {
			pageName = "StaffDashboard.jsp"; 
		}
		else if(userRole.equalsIgnoreCase("Customer")) {
			pageName = "CustomerDashboard.jsp"; 
		}
		else
		{
			response.sendRedirect("Error");
			return;	
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(pageName);
		rd.forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
