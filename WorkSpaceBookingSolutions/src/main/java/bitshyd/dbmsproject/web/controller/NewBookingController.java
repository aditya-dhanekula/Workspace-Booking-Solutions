package bitshyd.dbmsproject.web.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Arrays;

import bitshyd.dbmsproject.web.dao.WorkSpaceBookingDao;
import bitshyd.dbmsproject.web.dao.LocationDao;
import bitshyd.dbmsproject.web.dao.WorkSpaceDao;
import bitshyd.dbmsproject.web.dao.ServiceDao;
import bitshyd.dbmsproject.web.dao.UserDao;
import bitshyd.dbmsproject.web.model.NewBooking;
import bitshyd.dbmsproject.web.model.WorkSpaceBooking;
import bitshyd.dbmsproject.web.model.WorkSpace;
import bitshyd.dbmsproject.web.model.User;
import bitshyd.dbmsproject.web.services.SendMail;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NewBookingController
 */
public class NewBookingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public NewBookingController() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			NewBooking objNewBooking=new NewBooking();
			
			LocationDao objLocationDao=new LocationDao();
			objNewBooking.setArrLocations(objLocationDao.getAllActiveLocations());
			
			forwardRequest(objNewBooking, "NewBooking.jsp", request, response);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		try {
			String actionType=request.getParameter("actionType");
			int id=Integer.parseInt(request.getParameter("id"));

			NewBooking objNewBooking=new NewBooking();
			objNewBooking.setActionType(actionType);
			objNewBooking.getBooking().setWorkSpaceId(id);
			
			if(!request.getParameter("location").equalsIgnoreCase("")) {
				objNewBooking.setLocationId(Integer.parseInt(request.getParameter("location")));
			}
			
			if (!request.getParameter("checkin").equalsIgnoreCase("")) {
				  
				objNewBooking.setCheckin(request.getParameter("checkin")); 
				  //objNewBooking.getBooking().setCheckinTime(Date.valueOf(objNewBooking.getCheckin()));
				}
				if (!request.getParameter("checkout").equalsIgnoreCase("")) {
					  
					objNewBooking.setCheckout(request.getParameter("checkout")); 
					  //objNewBooking.getBooking().setCheckoutTime(Date.valueOf(objNewBooking.getCheckout()));
				}
			

			LocationDao objLocationDao=new LocationDao();
			objNewBooking.setArrLocations(objLocationDao.getAllActiveLocations());
			
			if (actionType.equalsIgnoreCase("Search")) {
				
				WorkSpaceDao spaceDao=new WorkSpaceDao();
			 	objNewBooking.setArrWorkSpaces(spaceDao.getAllBookingAvailable(objNewBooking.getLocationId(), 
			 			objNewBooking.getCheckin(), objNewBooking.getCheckout()));
			}
			else if (actionType.equalsIgnoreCase("Book")) {
				WorkSpaceDao spaceDao=new WorkSpaceDao();
				User objStaff= spaceDao.getStaffOfWorkSpace(id);
				objNewBooking.setStaff(objStaff);
			}
			else if (actionType.equalsIgnoreCase("Proceed")) {
				String strOptedServices=Arrays.toString(request.getParameterValues("optedservices"));
				//System.out.println("Opted Services: " + strOptedServices);
				if (strOptedServices != null && !strOptedServices.equalsIgnoreCase("null") && !strOptedServices.isEmpty())
				{
					strOptedServices = strOptedServices.substring(1, strOptedServices.length()-1);
				}
				else {
					strOptedServices="";
				}
				
				objNewBooking.setOptedServices(strOptedServices);
				objNewBooking.setLocationName(objLocationDao.getLocation(objNewBooking.getLocationId()).getLocationName());
				WorkSpace objSpace= new WorkSpaceDao().getWorkSpace(id);
				
				WorkSpaceBooking objWorkSpaceBooking=objNewBooking.getBooking(); 
				
				objWorkSpaceBooking.setWorkSpaceName(objSpace.getWorkSpaceName());
				int hourlyWorkSpacePrice=objSpace.getWorkSpacePrice(); 
				objWorkSpaceBooking.setHourlyWorkSpacePrice(hourlyWorkSpacePrice);
				int diffInHours= (new WorkSpaceBookingDao()).DifferenceInHours(objNewBooking.getCheckout().replace('T', ' '), 
							objNewBooking.getCheckin().replace('T', ' '));
				int bookingCost=diffInHours * hourlyWorkSpacePrice;
				objWorkSpaceBooking.setChargedAmount(bookingCost);
				objNewBooking.setStaff(objSpace.getStaff());
				int customerId=Integer.parseInt(request.getSession().getAttribute("UserID").toString());
				objNewBooking.setCustomer(new UserDao().getCustomer(customerId));
				if(!strOptedServices.equalsIgnoreCase("")) {
					objNewBooking.setArrOptedServices(new ServiceDao().getAllStaffServicesOfIds(strOptedServices));
				}
				forwardRequest(objNewBooking, "BookingConfirmation.jsp", request, response);
				return;
			}
			else if (actionType.equalsIgnoreCase("Pay")) {
				WorkSpaceBookingDao objBookingDao=new WorkSpaceBookingDao();
				String strOptedServices= request.getParameter("OptedServices");
				WorkSpaceBooking objBooking=new WorkSpaceBooking();
				objBooking.setCustomerId(Integer.parseInt(request.getSession().getAttribute("UserID").toString()));
				objBooking.setWorkSpaceId(id);
				WorkSpace objSpace= new WorkSpaceDao().getWorkSpace(id);
				int hourlyWorkSpacePrice=objSpace.getWorkSpacePrice(); 
				objBooking.setHourlyWorkSpacePrice(hourlyWorkSpacePrice);
				objBooking.setStaffId(objSpace.getStaff().getUserId());
				objBooking.setStrCheckinTime(objNewBooking.getCheckin());
				objBooking.setStrCheckoutTime(objNewBooking.getCheckout());
				int diffInHours= objBookingDao.DifferenceInHours(objNewBooking.getCheckout().replace('T', ' '), 
						objNewBooking.getCheckin().replace('T', ' '));
				int bookingCost=diffInHours * hourlyWorkSpacePrice;
				objBooking.setChargedAmount(bookingCost);
				objBooking.setRefundAmount(0);
				objBooking.setServiceIds(strOptedServices);
				int newBookingId=objBookingDao.addBooking(objBooking);
				objBooking.setBookingId(newBookingId);
				
				objNewBooking.setBooking(objBooking);
				objNewBooking.setOptedServices(strOptedServices);
				objNewBooking.setLocationName(objLocationDao.getLocation(objNewBooking.getLocationId()).getLocationName());
				objNewBooking.getBooking().setWorkSpaceName(objSpace.getWorkSpaceName());
				objNewBooking.setStaff(objSpace.getStaff());
				int customerId=Integer.parseInt(request.getSession().getAttribute("UserID").toString());
				objNewBooking.setCustomer(new UserDao().getCustomer(customerId));
				objNewBooking.setArrOptedServices(new ServiceDao().getAllStaffServicesOfIds(strOptedServices));
				sendBookingConfirmationMail(objNewBooking);
				forwardRequest(objNewBooking, "BookingConfirmation.jsp", request, response);
				return;
			}
				
			forwardRequest(objNewBooking, "NewBooking.jsp", request, response);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	private void sendBookingConfirmationMail(NewBooking objbooking) {
		String to=objbooking.getCustomer().getEmailID();
		String subject="Booking Confirmation, BookingId " + objbooking.getBooking().getBookingId();
		String body="Your WorkSpace Booking is confirmed with booking Id:" + objbooking.getBooking().getBookingId() + " \n "
				+ "Booking Details are provded below \n " 
				+ "Location: " + objbooking.getLocationName() + " \n "
				+ "Work Space Name: " + objbooking.getBooking().getWorkSpaceName() + " \n "
				+ "Check in :" + objbooking.getBooking().getStrCheckinTime() + " \n "
				+ "Check out:" + objbooking.getBooking().getStrCheckoutTime() + " \n "
				+ "Work Space Cost: " + objbooking.getBooking().getChargedAmount() + "\n "
				+ " \n\n Thank you.";
		
		try{
			SendMail.send(to, subject, body);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

	
	private void forwardRequest(Object model, String pagename, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setAttribute("model", model);
		RequestDispatcher rd = request.getRequestDispatcher(pagename);
		rd.forward(request, response);	
	}

}
