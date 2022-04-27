package bitshyd.dbmsproject.web.controller;

import java.io.IOException;
import bitshyd.dbmsproject.web.dao.UserDao;
import bitshyd.dbmsproject.web.model.User;
import bitshyd.dbmsproject.web.services.Helper;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

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
		String resetPasswordKey = request.getParameter("fp"); 
		if (resetPasswordKey == null ) {
			response.sendRedirect("Error");
			return;
		}
		User objUser= new User();
		objUser.setFirstName(resetPasswordKey);
		forwardRequest(objUser, "PasswordReset.jsp", request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String resetPasswordKey = request.getParameter("key"); 
		String strUsername = request.getParameter("username"); 
		String strPassword = request.getParameter("password"); 
	//System.out.println("Key=" + resetPasswordKey + "; strUsername=" +  strUsername +"; strPassword =" + strPassword + ";");
		String errorMessage = "";
	
		UserDao objUserDao = new UserDao();
		User objUser= objUserDao.getAdmin(strUsername);
		if (objUser == null || objUser.getUserId() ==0){
			errorMessage = "Username not valid";
		}
		else if (objUser.getResetPasswordKey() != null && objUser.getResetPasswordKey().equals(resetPasswordKey)) {
			objUserDao.updateUserPassword(objUser.getUserId(), 1, Helper.encrypt(strPassword));
		}
		else {
			errorMessage = "Invalid request";
			objUser.setUserId(0);
		}
			
		objUser.setUsername(strUsername);
		objUser.setFirstName(resetPasswordKey);
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
