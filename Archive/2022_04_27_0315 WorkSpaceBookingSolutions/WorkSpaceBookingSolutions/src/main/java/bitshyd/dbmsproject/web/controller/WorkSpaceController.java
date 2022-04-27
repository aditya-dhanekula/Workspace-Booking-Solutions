package bitshyd.dbmsproject.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import bitshyd.dbmsproject.web.dao.LocationDao;
import bitshyd.dbmsproject.web.dao.WorkSpaceDao;
import bitshyd.dbmsproject.web.dao.UserDao;
import bitshyd.dbmsproject.web.model.Location;
import bitshyd.dbmsproject.web.model.LocationsSpacesAndStaff;
import bitshyd.dbmsproject.web.model.WorkSpace;
import bitshyd.dbmsproject.web.model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class WorkSpaceController
 */
public class WorkSpaceController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public WorkSpaceController() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		LocationDao locationsDao = new LocationDao();
		LocationsSpacesAndStaff objLocSpaceStaff  = new LocationsSpacesAndStaff();
		ArrayList<Location> arrLocations = locationsDao.getAllActiveLocations(); 
		objLocSpaceStaff.setArrLocations(arrLocations);
		forwardRequest(objLocSpaceStaff, "WorkSpaces.jsp", request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String ActionType = request.getParameter("actionType");
		WorkSpaceDao objSpaceDao = new WorkSpaceDao();
		//System.out.print("ActionType = "+ ActionType);
		int locationId = 0;
		if (ActionType != null)
		{
			locationId = Integer.parseInt(request.getParameter("LocationId"));
			int spaceId = Integer.parseInt(request.getParameter("id"));
			
			if(ActionType.equalsIgnoreCase("assign")) {
				int staffId = Integer.parseInt(request.getParameter("staffId"));
				String workSpaces = Arrays.toString(request.getParameterValues("chkWorkSpace"));
				if (workSpaces != null && !workSpaces.equalsIgnoreCase("null") && !workSpaces.isEmpty())
				{
					workSpaces = workSpaces.substring(1, workSpaces.length()-1);
				}
				//System.out.print("SelectedWorkSpace SpaceIds are " + workSpaces);
				if (staffId >0 && workSpaces != null && !workSpaces.isEmpty() ) {
					objSpaceDao.updateStaffToWorkSpaces(staffId, workSpaces);
				}
			}
			
			else if(ActionType.equalsIgnoreCase("block")) {
				objSpaceDao.block(spaceId);
			}
			else if(ActionType.equalsIgnoreCase("unblock")) {
				objSpaceDao.activate(spaceId);
			}
		}		
		
		LocationDao locationsDao = new LocationDao();
		LocationsSpacesAndStaff objLocSpaceStaff  = new LocationsSpacesAndStaff();
		ArrayList<Location> arrLocations = locationsDao.getAllActiveLocations();
		objLocSpaceStaff.setArrLocations(arrLocations);
		if (locationId > 0) {
			objLocSpaceStaff.setSelectedLocationId(locationId);
			ArrayList<User> arrStaff = (new UserDao()).getAllActiveStaffbyWorkLocation(locationId);
			objLocSpaceStaff.setArrStaff(arrStaff);
			ArrayList<WorkSpace> arrSpaces = objSpaceDao.getAllWorkSpacesOfLocation(locationId);
			objLocSpaceStaff.setArrWorkSpaces(arrSpaces);
		}
		forwardRequest(objLocSpaceStaff, "WorkSpaces.jsp", request, response);
	}
	
	private void forwardRequest(Object model, String pagename, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setAttribute("model", model);
		RequestDispatcher rd = request.getRequestDispatcher(pagename);
		rd.forward(request, response);	
	}

}
