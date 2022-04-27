package bitshyd.dbmsproject.web.controller;

import java.io.IOException;
import java.util.ArrayList;

import bitshyd.dbmsproject.web.dao.WorkSpaceBookingDao;
import bitshyd.dbmsproject.web.model.WorkSpaceBooking;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BookingsController
 */
public class BookingsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BookingsController() {
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try {
		int customerId=-1;
		if (request.getSession().getAttribute("UserRole").toString().equalsIgnoreCase("Customer")) {
			customerId =Integer.parseInt(request.getSession().getAttribute("UserID").toString());
		}
		WorkSpaceBookingDao objBookingsDao=new WorkSpaceBookingDao();
		ArrayList<WorkSpaceBooking> arrFutureBookings=objBookingsDao.getAllCustomerBookings(customerId, false, true, true, true);
		ArrayList<WorkSpaceBooking> arrRunningBookings=objBookingsDao.getAllCustomerBookings(customerId, true, false, true, true);
		ArrayList<WorkSpaceBooking> arrPastBookings=objBookingsDao.getAllCustomerBookings(customerId, true, true, false, false);
		
		request.setAttribute("modelFutureBookings", arrFutureBookings);
		request.setAttribute("modelRunningBookings", arrRunningBookings);
		request.setAttribute("modelPastBookings", arrPastBookings);
		RequestDispatcher rd = request.getRequestDispatcher("Bookings.jsp");
		rd.forward(request, response);
		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String actionType=request.getParameter("actionType");
			int bookingId=Integer.parseInt(request.getParameter("id"));
			int checkinMinutes=0;
			if (request.getParameter("mts")!=null) {
				checkinMinutes=Integer.parseInt(request.getParameter("mts"));
			}
			if (actionType.equalsIgnoreCase("cancel")){
		// When cancellation is 4 hours earlier than Check in, 90% of Advance shall be refunded, less than 4 hours 50% refund
				int refundPercentage=50;
					if (checkinMinutes > 240) {
						refundPercentage = 90;
					}
				WorkSpaceBookingDao objBookingDao=new WorkSpaceBookingDao();
				objBookingDao.cancelBooking(bookingId, refundPercentage);
				doGet(request, response);
			}
			else if (actionType.equalsIgnoreCase("modify")) {
				response.sendRedirect("NewBooking?id=" + bookingId);
			}
			else if (actionType.equalsIgnoreCase("feedback")) {
				WorkSpaceBookingDao objBookingDao=new WorkSpaceBookingDao();
				WorkSpaceBooking objBooking=objBookingDao.getBooking(bookingId);
				request.setAttribute("model", objBooking);
				RequestDispatcher rd = request.getRequestDispatcher("FeedbackForm.jsp");
				rd.forward(request, response);
			}
			else if (actionType.equalsIgnoreCase("cstfeedback")) {
				int RatingOnService= Integer.parseInt(request.getParameter("servicerating"));
				int RatingOnStaff=Integer.parseInt(request.getParameter("staffrating"));
				String FeedbackText=request.getParameter("commentText");
				
				WorkSpaceBookingDao objBookingDao=new WorkSpaceBookingDao();
				WorkSpaceBooking objBooking= new WorkSpaceBooking();
				objBooking.setBookingId(bookingId);
				objBooking.setRatingOnService(RatingOnService);
				objBooking.setRatingOnStaff(RatingOnStaff);
				objBooking.setFeedbackText(FeedbackText);
				int feedbackId= objBookingDao.saveCustomerFeedBack(objBooking);
				objBooking.setFeedbackId(feedbackId);
				request.setAttribute("model", objBooking);
				RequestDispatcher rd = request.getRequestDispatcher("FeedbackForm.jsp");
				rd.forward(request, response);	
			}
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
