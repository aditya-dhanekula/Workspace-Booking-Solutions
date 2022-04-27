package bitshyd.dbmsproject.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import bitshyd.dbmsproject.web.dao.ServiceDao;
import bitshyd.dbmsproject.web.model.Service;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StaffServiceOfferingController
 */
public class StaffServiceOfferingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public StaffServiceOfferingController() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			int staffId = Integer.parseInt(request.getSession().getAttribute("UserID").toString());
			String userRole = request.getSession().getAttribute("UserRole").toString();
			if (!userRole.equalsIgnoreCase("Staff")) {
				response.sendRedirect("Error");
				return;
			}
			request.setAttribute("actionType", "View");
			ServiceDao objServiceDao= new ServiceDao();
			ArrayList<Service> arrServices = objServiceDao.getAllActiveServicesWithStaffSelectedStatus(staffId); 
			forwardRequest(arrServices, "StaffServiceOffering.jsp", request, response);
		}
		catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("Error");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			String actionType=request.getParameter("actionType");
			ServiceDao objServiceDao= new ServiceDao();
			int staffId = Integer.parseInt(request.getSession().getAttribute("UserID").toString());
			if (actionType != null)
			{
				if (actionType.equalsIgnoreCase("Edit")) {
					request.setAttribute("actionType", "Edit");
				}
				else if (actionType.equalsIgnoreCase("Save")) {
					
					String[] arrServiceIds= request.getParameterValues("chkservice");
					String strServices = "0";
					strServices = Arrays.toString(arrServiceIds);
					if(strServices == null || strServices.equalsIgnoreCase("null")){ 
						strServices = "0";
					}
					else {
						strServices = strServices.substring(1, strServices.length()-1);
					}
					//System.out.println("Selected Services:" + Arrays.toString(arrServiceIds));
					objServiceDao.saveStaffServices(staffId, strServices);
					request.setAttribute("actionType", "View");
				}
				else{
					request.setAttribute("actionType", "View");
				}
			}
			ArrayList<Service> arrServices = objServiceDao.getAllActiveServicesWithStaffSelectedStatus(staffId); 
			forwardRequest(arrServices, "StaffServiceOffering.jsp", request, response);
		}
		catch(Exception e){
			e.printStackTrace();
			response.sendRedirect("Error");
		}
	}
	
	private void forwardRequest(Object model, String pagename, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setAttribute("model", model);
		RequestDispatcher rd = request.getRequestDispatcher(pagename);
		rd.forward(request, response);	
	}

}
