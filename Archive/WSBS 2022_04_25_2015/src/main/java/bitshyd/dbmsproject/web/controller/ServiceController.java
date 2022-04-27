package bitshyd.dbmsproject.web.controller;

import java.io.IOException;
import java.util.ArrayList;

import bitshyd.dbmsproject.web.dao.ServiceDao;
import bitshyd.dbmsproject.web.model.Service;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServiceController
 */
public class ServiceController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServiceDao objServiceDao = new ServiceDao();
		ArrayList<Service> arrServices =  objServiceDao.getAllServices();
		forwardRequest(arrServices, "Service.jsp", request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String submitType = request.getParameter("actionType");
		ServiceDao objServiceDao = new ServiceDao();
		if (submitType != null)
		{
			if(submitType.equalsIgnoreCase("add")) {
				Service objService = new Service();
				forwardRequest(objService , "AddEditService.jsp", request, response);
				return;
			}
			int serviceID = Integer.parseInt(request.getParameter("id"));
			if(submitType.equalsIgnoreCase("edit")) {
				Service objService = objServiceDao.getServiceDetails(serviceID);
				forwardRequest(objService , "AddEditService.jsp", request, response);
				return;
			}
			
			if(submitType.equalsIgnoreCase("delete")) {
					objServiceDao.deleteService(serviceID);
			}
			else if (submitType.equalsIgnoreCase("activate")) {
				objServiceDao.activateService(serviceID);
			}
			else if (submitType.equalsIgnoreCase("deactivate")) {
				objServiceDao.deactivateService(serviceID);
			}
			
		}
		//In case of saving service on submit of Add/ Edit Service
		else
		{
			Service objService = new Service();
			int serviceID = Integer.parseInt(request.getParameter("ServiceID"));
			objService.setServiceID(serviceID);
			String serviceName = request.getParameter("ServiceName");
			objService.setServiceName(serviceName);
			int servicePrice = Integer.parseInt(request.getParameter("ServicePrice"));
			objService.setServicePrice(servicePrice);
			String unitType=request.getParameter("UnitType");
			objService.setUnitType(unitType);
			if(serviceID == 0) {
				objServiceDao.addService(objService);
			}
			else {
				objServiceDao.updateService(objService);
			}
		}
		
		ArrayList<Service> arrServices =  objServiceDao.getAllServices();
		forwardRequest(arrServices, "Service.jsp", request, response);
	}
	
	private void forwardRequest(Object model, String pagename, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setAttribute("model", model);
		RequestDispatcher rd = request.getRequestDispatcher(pagename);
		rd.forward(request, response);	
	}
}
