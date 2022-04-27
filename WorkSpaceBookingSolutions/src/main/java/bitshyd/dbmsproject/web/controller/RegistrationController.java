package bitshyd.dbmsproject.web.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.DecimalFormat;
import java.util.Random;

import bitshyd.dbmsproject.web.dao.UserDao;
import bitshyd.dbmsproject.web.services.Helper;
import bitshyd.dbmsproject.web.services.SendMail;
import bitshyd.dbmsproject.web.services.SendSMS;
import bitshyd.dbmsproject.web.model.User;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistrationController
 */
public class RegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		User objUser = new User();
		forwardRequest(objUser, "Registration.jsp", request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		User objUser = new User();
		objUser.setUserTypeId(3);
		objUser.setFirstName(request.getParameter("firstname"));
		objUser.setLastName(request.getParameter("lastname"));
		objUser.setDOB(Date.valueOf(request.getParameter("birthday")));
		objUser.setGender(request.getParameter("Gender"));
		objUser.setUsername(request.getParameter("username"));
		objUser.setUserPassword(request.getParameter("password"));
		
		objUser.setEmailID(request.getParameter("emailid"));
		objUser.setPhoneNo(request.getParameter("phoneno"));
		objUser.setResidentialAddress(request.getParameter("address"));
		objUser.setCity(request.getParameter("City"));
		objUser.setPincode(request.getParameter("PinCode"));
		objUser.setOTP(request.getParameter("OTP"));
		objUser.setUserStatusId(1);
		String otpGenerated = (String) request.getSession().getAttribute("otp"); 

		UserDao objUserDao = new UserDao();
		
		if(objUserDao.isUsernameUnique(objUser)) {
			if (objUser.getOTP().equals(""))
			{
				otpGenerated= new DecimalFormat("000000").format(new Random().nextInt(999999));
				objUser.setOTP(otpGenerated);
				request.getSession().setAttribute("otp", otpGenerated);
				SendSMS.send(objUser.getPhoneNo(), otpGenerated + " is the OTP for your registration to Work Space Booking Solutions");
				SendMail.send(objUser.getFirstName() + "<" + objUser.getEmailID() + ">", "New Registration Info - Work Space Booking Solutions", 
						"OTP for your registration to Work Space Booking Solutions is   " + otpGenerated);
				objUser.setErrorMsg("OTP is sent to your registered email. Please enter the OTP to proceed.");
				forwardRequest(objUser, "Registration.jsp", request, response);
			}
			else if (!objUser.getOTP().equals(otpGenerated))
			{
				objUser.setErrorMsg("Incorrect OTP! Please try again.");
				forwardRequest(objUser, "Registration.jsp", request, response);
			}
			else
			{
				request.getSession().removeAttribute("otp");
				objUser.setUserPassword(Helper.encrypt(objUser.getUserPassword()));
				if(objUserDao.saveCustomerDetails(objUser) == 1) {
				response.sendRedirect("Login");
				}
				else {
				objUser.setOTP(""); 
				objUser.setErrorMsg("Registration failed! Please try again.");
				forwardRequest(objUser, "Registration.jsp", request, response);
				}
			}
		}
		else{
			objUser.setErrorMsg("Username already exists! Please try again.");
			objUser.setUsername("");
			forwardRequest(objUser, "Registration.jsp", request, response);
		}
	}
	
	private void forwardRequest(User model, String pagename, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setAttribute("model", model);
		RequestDispatcher rd = request.getRequestDispatcher(pagename);
		rd.forward(request, response);	
	}
	
}
