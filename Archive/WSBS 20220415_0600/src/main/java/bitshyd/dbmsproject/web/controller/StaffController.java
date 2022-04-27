package bitshyd.dbmsproject.web.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import bitshyd.dbmsproject.web.dao.LocationDao;
import bitshyd.dbmsproject.web.dao.UserDao;
import bitshyd.dbmsproject.web.model.Location;
import bitshyd.dbmsproject.web.model.User;
import bitshyd.dbmsproject.web.services.Helper;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StaffController
 */
public class StaffController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			forwardRequest(null, "Staff.jsp", request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String ActionType = request.getParameter("actionType");
		UserDao objUserDao = new UserDao();
		//System.out.print("ActionType = "+ ActionType);
		if (ActionType != null)
		{
			int UserId = Integer.parseInt(request.getParameter("id"));
			//System.out.print("UserId = "+ UserId);
			if(ActionType.equalsIgnoreCase("add") || ActionType.equalsIgnoreCase("edit")) {
				User objUser = null;
				if (UserId == 0) {	
					objUser = new User();
				}
				else {
					objUser = objUserDao.getStaff(UserId);	
				}
				LocationDao plDao = new LocationDao();
				ArrayList<Location> arrLocations = plDao.getAllActiveLocations();
				request.setAttribute("ActionType", ActionType);
				request.setAttribute("Locations", arrLocations);
				forwardRequest(objUser, "AddStaff.jsp", request, response);
				return;
			}
			else if(ActionType.equalsIgnoreCase("resetPassword")) {
				String newPassword = request.getParameter("NewPassword");
				objUserDao.updateUserPassword(UserId, 2, Helper.encrypt(newPassword));
				forwardRequest(null, "Staff.jsp", request, response);
				return;
			}
			else if (ActionType.equalsIgnoreCase("save"))
			{
				User objUser = new User();
				objUser.setUserTypeId(2);
				objUser.setUserId(UserId);
				objUser.setFirstName(request.getParameter("FirstName"));
				objUser.setLastName(request.getParameter("LastName"));
				if (UserId == 0) {
					objUser.setUsername(request.getParameter("Username"));
					objUser.setUserPassword(Helper.encrypt(request.getParameter("Password")));
				}
				String str=request.getParameter("DOB");  
				Date date=Date.valueOf(str);//converting string into sql date  
				objUser.setDOB(date);

				objUser.setResidentialAddress(request.getParameter("Address"));
				objUser.setEmailID(request.getParameter("EmailId"));
				objUser.setWorkLocationId(Integer.parseInt(request.getParameter("WorkLocation")));
				objUser.setPhoneNo(request.getParameter("MobileNumber"));
				objUser.setGender(request.getParameter("Gender"));
				objUser.setCity(request.getParameter("City"));
				objUser.setPincode(request.getParameter("PinCode"));
				objUser.setUserStatusId(1); 

				if(UserId == 0) {
					if(objUserDao.isUsernameUnique(objUser)) {
						objUserDao.saveStaffDetails(objUser);
						forwardRequest(null, "Staff.jsp", request, response);
						return;
					}
					else{
						
						objUser.setErrorMsg("Username already exists! Please try again.");
						objUser.setUsername("");
						request.setAttribute("ActionType", "edit");
						forwardRequest(objUser, "AddStaff.jsp", request, response);
						return;
					}
				}
				//In case saving during edit user
				else {
					//System.out.print(objUser.getPhoneNo());
						objUserDao.updateStaffDetails(objUser);
						forwardRequest(null, "Staff.jsp", request, response);
						return;
					}
			}
			
			if(ActionType.equalsIgnoreCase("delete")) {
				objUserDao.deleteUser(UserId, 2);
			}
			else if(ActionType.equalsIgnoreCase("block")) {
				objUserDao.blockUser(UserId, 2);
			}
			else if(ActionType.equalsIgnoreCase("activate")) {
				objUserDao.activateUser(UserId, 2);
			}
		}		
		
		ArrayList<User> arrUsers =  objUserDao.GetStaff(request.getParameter("FieldName"), request.getParameter("Value"));
//		System.out.print("Field Name =" + request.getParameter("FieldName") + "\n" 
//				+ "Value=" + request.getParameter("Value")+ "\n");
//		for (User user : arrUsers) {
//			System.out.print("First Name: " + user.getFirstName() + "\n");	
//		}
		forwardRequest(arrUsers, "Staff.jsp", request, response);
	}
	
	private void forwardRequest(Object model, String pagename, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setAttribute("model", model);
		RequestDispatcher rd = request.getRequestDispatcher(pagename);
		rd.forward(request, response);	
	}
}
