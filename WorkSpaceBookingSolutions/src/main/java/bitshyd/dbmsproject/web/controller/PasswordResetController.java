package bitshyd.dbmsproject.web.controller;

import java.io.IOException;
import bitshyd.dbmsproject.web.dao.UserDao;
import bitshyd.dbmsproject.web.model.User;
import bitshyd.dbmsproject.web.services.Helper;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PasswordResetController
 */
public class PasswordResetController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public PasswordResetController() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userType = 0;
		String resetPasswordKey = "";
		try {
			userType=Integer.parseInt(request.getParameter("tp"));
			resetPasswordKey = request.getParameter("fp"); 
		}
		catch (Exception e) {
		}
		
		if (userType < 1 || userType > 3 || resetPasswordKey == null || resetPasswordKey.isEmpty()) {
			response.sendRedirect("Error");
			return;
		}
		
		User objUser= new User();
		objUser.setUserTypeId(userType);
		objUser.setResetPasswordKey(resetPasswordKey);
		forwardRequest(objUser, "PasswordReset.jsp", request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userTypeId = Integer.parseInt(request.getParameter("tp"));
		String resetPasswordKey = request.getParameter("key"); 
		
		String strUsername = request.getParameter("username"); 
		String strPassword = request.getParameter("password"); 
	//System.out.println("Key=" + resetPasswordKey + "; strUsername=" +  strUsername +"; strPassword =" + strPassword + ";");
		String errorMessage = "";
	
		UserDao objUserDao = new UserDao();
		User objUser=null;
		if (userTypeId ==1) {
			objUser= objUserDao.getAdmin(strUsername);
		}
		else if (userTypeId==2) {
			objUser= objUserDao.getStaff(strUsername);
		}
		else {
			objUser= objUserDao.getCustomer(strUsername);
		}
		
		if (objUser == null || objUser.getUserId() ==0) {
			errorMessage = "Username not valid";
		}
		else if (objUser.getResetPasswordKey() != null && objUser.getResetPasswordKey().equals(resetPasswordKey)) {
			objUserDao.updateUserPassword(objUser.getUserId(), userTypeId, Helper.encrypt(strPassword));
		}
		else {
			errorMessage = "Invalid request";
			objUser.setUserId(0);
		}
			
		objUser.setUsername(strUsername);
		objUser.setResetPasswordKey(resetPasswordKey);
		objUser.setErrorMsg(errorMessage);
		forwardRequest(objUser, "PasswordReset.jsp", request, response);
	}
	
	private void forwardRequest(Object model, String pagename, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setAttribute("model", model);
		RequestDispatcher rd = request.getRequestDispatcher(pagename);
		rd.forward(request, response);	
	}

}
