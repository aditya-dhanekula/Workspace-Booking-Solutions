package bitshyd.dbmsproject.web.controller;

import java.io.IOException;
import java.util.ArrayList;

import bitshyd.dbmsproject.web.dao.LocationDao;
import bitshyd.dbmsproject.web.model.Location;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LocationController
 */
public class LocationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public LocationController() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		LocationDao plDao = new LocationDao();
		ArrayList<Location> arrLocations = plDao.getAllLocations();
		forwardRequest(arrLocations, "Locations.jsp", request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String actionType = request.getParameter("actionType");
		if (actionType == null) {
			doGet(request, response);
			return;
		}
		int locationId = Integer.parseInt(request.getParameter("id"));
		LocationDao plDao = new LocationDao();
		if (actionType.equalsIgnoreCase("add") || actionType.equalsIgnoreCase("edit"))
		{
			Location pLocation = null;
			if (actionType.equalsIgnoreCase("add")) {
				pLocation = new Location();
			}
			else {
				pLocation=plDao.getLocation(locationId);
			}
			forwardRequest(pLocation, "AddEditLocation.jsp", request, response);
			return;
		}
		else if (actionType.equalsIgnoreCase("save")) {
			Location pLocation = new Location();
			pLocation.setLocationID(locationId);
			pLocation.setLocationName(request.getParameter("locationName"));
			pLocation.setBigWorkSpaces(Integer.parseInt(request.getParameter("bigSpaces")));
			pLocation.setSmallWorkSpaces(Integer.parseInt(request.getParameter("smallSpaces")));
			if (locationId > 0) {
				plDao.update(pLocation);
			}
			else {
				plDao.add(pLocation);
			}
				
		}
		else if (actionType.equalsIgnoreCase("block")) {
			plDao.block(locationId);
		}
		else if (actionType.equalsIgnoreCase("unblock")) {
			plDao.activate(locationId);
		}
		else if (actionType.equalsIgnoreCase("delete")) {
			plDao.delete(locationId);
		}
		
		doGet(request, response);
	}

	
	private void forwardRequest(Object model, String pagename, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setAttribute("model", model);
		RequestDispatcher rd = request.getRequestDispatcher(pagename);
		rd.forward(request, response);	
	}
}
