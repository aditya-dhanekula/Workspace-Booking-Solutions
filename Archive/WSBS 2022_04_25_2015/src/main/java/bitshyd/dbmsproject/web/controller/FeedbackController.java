package bitshyd.dbmsproject.web.controller;

import java.io.IOException;

import bitshyd.dbmsproject.web.dao.WorkSpaceBookingDao;
import bitshyd.dbmsproject.web.model.WorkSpaceBooking;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FeedbackController
 */
public class FeedbackController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public FeedbackController() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			long feedbackKey=0;
			if (request.getParameter("id")==null) {
				response.sendRedirect("Error");
				return;
			}
			else {
				try {
				feedbackKey =Long.parseUnsignedLong(request.getParameter("id"));
				}
				catch(Exception e) {
					response.sendRedirect("Error");
					return;
				}
				WorkSpaceBookingDao objBookingDao=new WorkSpaceBookingDao();
				WorkSpaceBooking objBooking=objBookingDao.getBookingByFeedbackKey(feedbackKey);
				if (objBooking ==  null ) {
					//send to Error Page as Invalid link
					request.setAttribute("model", "Invalid Request");
					RequestDispatcher rd = request.getRequestDispatcher("Error.jsp");
					rd.forward(request, response);	
				}
				else if (objBooking.getFeedbackId() >0) {
					//send to error page as feedback already provided;
					request.setAttribute("model", "Feedback already provided for this Booking.");
					RequestDispatcher rd = request.getRequestDispatcher("Error.jsp");
					rd.forward(request, response);	
				}
				else {
					request.setAttribute("model", objBooking);
					RequestDispatcher rd = request.getRequestDispatcher("FeedbackForm.jsp");
					rd.forward(request, response);	
				}

			}
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
