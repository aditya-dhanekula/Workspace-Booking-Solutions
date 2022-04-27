package bitshyd.dbmsproject.web.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bitshyd.dbmsproject.web.model.WorkSpaceBooking;
import bitshyd.dbmsproject.web.model.User;
import bitshyd.dbmsproject.web.model.WalletTransaction;

public class WorkSpaceBookingDao {
	private Connection con = null;
	
	public WorkSpaceBookingDao() throws SQLException {
		con= Database.getConnection();
	}
	
	public int addBooking(WorkSpaceBooking newBooking) {
		PreparedStatement st=null;
		int bookingId = 0;
		try {
			User objStaff= (new WorkSpaceDao()).getStaffOfWorkSpace(newBooking.getWorkSpaceId());
			st=con.prepareStatement("Insert into WorkSpaceBookings (CustomerId, WorkSpaceId, HourlyWorkSpacePrice, StaffId, "
					+ "CheckinTime, CheckoutTime, WorkSpaceBookingCost, ChargedAmount) values (?, ?, ?, ?, ?, ?, ?, ?);", java.sql.Statement.RETURN_GENERATED_KEYS);
			st.setInt(1, newBooking.getCustomerId());
			st.setInt(2, newBooking.getWorkSpaceId());
			st.setInt(3, newBooking.getHourlyWorkSpacePrice());
			st.setInt(4, objStaff.getUserId());
			st.setString(5, newBooking.getStrCheckinTime());
			st.setString(6, newBooking.getStrCheckoutTime());
			st.setInt(7,  newBooking.getWorkSpaceBookingCost());
			st.setInt(8, newBooking.getChargedAmount());
			st.executeUpdate();
			
			//Getting newly created Booking Id
			ResultSet rs= st.getGeneratedKeys();
			rs.next();
			bookingId = rs.getInt(1);
			st.close();
			if (newBooking.getServiceIds() !=null && !newBooking.getServiceIds().equals("")) {
				st=con.prepareStatement("Insert into bookingservices (BookingId, ServiceID, ServicePrice)"
					+ " Select ?, ServiceID, ServicePrice from services where ServiceID IN ( "
					+ newBooking.getServiceIds() + ");");
				st.setInt(1, bookingId);
				st.executeUpdate();
				st.close();
			}
			WalletTransaction transaction= new WalletTransaction();
			transaction.setTransactionText("Advance for Booking Id " + bookingId);
			transaction.setCustomerId(newBooking.getCustomerId());
			transaction.setAmount(-1 * newBooking.getChargedAmount());
			transaction.setTransactionSuccess(1);
			WalletTransactionsDao TransactionsDao = new WalletTransactionsDao();
			TransactionsDao.addTransaction(transaction);
		}
		catch(Exception e) {
			e.printStackTrace();
			if (st != null) {
				System.out.print(st.toString());
			}
		}
		
		return bookingId;
		
	}
	
	public void cancelBooking(int bookingId, Boolean returnChargedAmount) {
		PreparedStatement st=null;
		try {
			int ChargedAmount=0;
			int customerId = 0;
			if (returnChargedAmount) {
				st=con.prepareStatement("Select CustomerId, ChargedAmount from WorkSpaceBookings where BookingId=?;");
				st.setInt(1, bookingId);
				ResultSet rs= st.executeQuery();
				if (rs.next()){
					customerId = rs.getInt("CustomerId"); 
					ChargedAmount = rs.getInt("ChargedAmount");
				}
				rs.close();
				st.close();
			}
			
			if (returnChargedAmount) {
				st=con.prepareStatement("Update WorkSpaceBookings set BookingstatusId=3, RefundAmount=?, IsProcessed=1, TimeUpdate= Now() WHERE BookingId=?;");
				st.setInt(1, ChargedAmount);
				st.setInt(2, bookingId);
				st.executeUpdate();
				st.close();
			}
			
			WalletTransaction transaction= new WalletTransaction();
			transaction.setTransactionText("Refund of BookingId:" + bookingId + " advance due to Cancellnation");
			transaction.setCustomerId(customerId);
			transaction.setAmount(ChargedAmount);
			transaction.setTransactionSuccess(1);
			WalletTransactionsDao TransactionsDao = new WalletTransactionsDao();
			TransactionsDao.addTransaction(transaction);
			if (!returnChargedAmount){
				transaction.setTransactionText("Cancellation charges for BookingId:" + bookingId );
				transaction.setCustomerId(customerId);
				transaction.setAmount(ChargedAmount);
				transaction.setTransactionSuccess(1);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
			if (st != null) {
				System.out.print(st.toString());
			}
		}
	}
	
	public void modifyBooking(WorkSpaceBooking objBooking, Boolean returnChargedAmount) {
		cancelBooking(objBooking.getBookingId(), returnChargedAmount);
		addBooking(objBooking);
	}
	
	public int saveCustomerFeedBack(WorkSpaceBooking objBooking) {
		PreparedStatement st=null;
		int feedbackId = 0;
		try {
			Connection con=Database.getConnection();
			st=con.prepareStatement("insert into customerfeedbacks (BookingId, OverallRating, RatingOnStaff, FeedbackText, FeedbackTime) "
					+ "values (?, ?, ?, ?, now());", java.sql.Statement.RETURN_GENERATED_KEYS);
			st.setInt(1, objBooking.getBookingId());
			st.setInt(2, objBooking.getOverallRating());
			st.setInt(3, objBooking.getRatingOnStaff());
			st.setString(4, objBooking.getFeedbackText());
			System.out.println(st.toString());
			st.executeUpdate();
			
			//Getting newly created feedback Id
			ResultSet rs= st.getGeneratedKeys();
			rs.next();
			feedbackId = rs.getInt(1);
			rs.close();
			st.close();
			
			st=con.prepareStatement("Select StaffId from workSpacebookings where BookingID=?;");
			st.setInt(1, objBooking.getBookingId());
			rs=st.executeQuery();
			int StaffId = rs.getInt("StaffId");
			rs.close();
			st.close();
			
			updateStaffRating(StaffId, objBooking.getRatingOnStaff());
			//updateStaffRating(1, objBooking.getOverallRating());
			
		}
		catch(Exception e) {
			e.printStackTrace(System.out);
		}
		return feedbackId;
	}
	
	private void updateStaffRating(int StaffId, int rating) {
		PreparedStatement st;
		try {
		con=Database.getConnection();
		st=con.prepareStatement("update staff set StaffTotalPoints=StaffTotalPoints+?, StaffRatedMembersCount=StaffRatedMembersCount+1, "
				+ "timeUpdate=Now() where StaffID=?;");
		st.setInt(1, rating);
		st.setInt(2, StaffId);
		st.executeUpdate();
		st.close();
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(System.out);
		}
	}
	
	private WorkSpaceBooking setObject(ResultSet rs) throws SQLException {
		
/*		BookingId, CustomerId, CustomerFirstName, CustomerLastName, WorkSpaceId, LocationId, LocationName, 
 *      WorkSpaceName, StaffId, StaffFirstName, StaffLastName, ModelId, Model, CarRegistrationNumber, 
 *      CheckinTime, CheckoutTime, ChargedAmount, RefundAmount, MinutesToCheckinFromNow, BookingstatusId, 
 *      Bookingstatus, IsProcessed, BookedTime, FeedbackKey, FeedbackId, OverallRating, 
 *      RatingOnStaff, FeedbackText, FeedbackTime
*/
		WorkSpaceBooking booking = new WorkSpaceBooking();
		booking.setBookingId(rs.getInt("BookingId"));
		booking.setCustomerId(rs.getInt("CustomerId"));
		booking.setCustomerFirstName(rs.getString("CustomerFirstName"));
		booking.setCustomerLastName(rs.getString("CustomerLastName"));
		
		booking.setWorkSpaceId(rs.getInt("WorkSpaceId"));
		booking.setLocationId(rs.getInt("LocationId"));
		booking.setLocationName(rs.getString("LocationName"));
		booking.setWorkSpaceName(rs.getString("WorkSpaceName"));
		booking.setHourlyWorkSpacePrice(rs.getInt("HourlyWorkSpacePrice"));
		booking.setStaffId(rs.getInt("StaffId"));
		booking.setStaffFirstName(rs.getString("StaffFirstName"));
		booking.setStaffLastName(rs.getString("StaffLastName"));
		
		booking.setCheckinTime(rs.getTimestamp("CheckinTime"));
		booking.setCheckoutTime(rs.getTimestamp("CheckoutTime"));
		booking.setStrCheckinTime(rs.getString("CheckinTime"));
		booking.setStrCheckoutTime(rs.getString("CheckoutTime"));
		booking.setWorkSpaceBookingCost(rs.getInt("WorkSpaceBookingCost"));
		booking.setChargedAmount(rs.getInt("ChargedAmount"));
		booking.setRefundAmount(rs.getInt("RefundAmount"));
		booking.setMinutesToCheckinFromNow(rs.getLong("MinutesToCheckinFromNow"));
		
		booking.setBookingstatusId(rs.getInt("BookingstatusId"));
		booking.setBookingstatus(rs.getString("Bookingstatus"));
		booking.setIsProcessed(rs.getInt("IsProcessed"));
		booking.setBookedTime(rs.getTimestamp("BookedTime"));
		booking.setFeedbackKey(rs.getLong("FeedbackKey"));
		booking.setFeedbackId(rs.getInt("FeedbackId"));
		booking.setOverallRating(rs.getInt("OverallRating"));
		booking.setRatingOnStaff(rs.getInt("RatingOnStaff"));
		booking.setFeedbackText(rs.getString("FeedbackText"));
		booking.setFeedbackTime(rs.getTimestamp("FeedbackTime"));
		
		return booking;
	}
	
	public WorkSpaceBooking getBooking(int BookingId) {
		WorkSpaceBooking booking = null;
		PreparedStatement st = null;
		try {
			st=con.prepareStatement("Select PB.BookingId, PB.CustomerId, CST.FirstName CustomerFirstName, CST.LastName as CustomerLastName, "
					+ "PB.WorkSpaceId, PL.LocationId, PL.LocationName, PS.WorkSpaceName, PB.HourlyWorkSpacePrice, " 
					+ "PB.StaffId, STF.FirstName StaffFirstName, CST.LastName as StaffLastName, "
					+ "PB.CheckinTime, PB.CheckoutTime, PB.WorkSpaceBookingCost, "
					+ "PB.ChargedAmount, PB.RefundAmount, "
					+ "ROUND(TIME_TO_SEC(TIMEDIFF(PB.checkinTime, Now()))/60) MinutesToCheckinFromNow, "
					+ "PB.BookingstatusId, BS.StatusName AS Bookingstatus, PB.IsProcessed, PB.BookedTime, PB.FeedbackKey, "
					+ "IFNULL(CFB.FeedbackId, 0) FeedbackId, CFB.OverallRating, CFB.RatingOnStaff, CFB.FeedbackText, CFB.FeedbackTime from workSpacebookings PB "
					+ "inner join Customers CST on CST.CustomerId=PB.CustomerId inner join workSpaces PS ON PS.WorkSpaceID=PB.WorkSpaceID "
					+ "inner join Locations PL ON PL.LocationID = PS.LocationId "
					+ "left outer join Staff STF on STF.StaffId=PB.StaffId "
					+ "left outer join customerfeedbacks CFB on CFB.BookingId=PB.BookingId "
					+ "inner join StatusMaster BS on BS.StatusId=PB.BookingstatusId WHERE PB.BookingId=?;"); 
			st.setInt(1, BookingId);
		
			ResultSet rs=st.executeQuery();
			if (rs.next()) {
				booking = setObject(rs);
			}
			rs.close();
			st.close();
		}
		catch(Exception e) {
			e.printStackTrace();
			if (st != null) {
				System.out.print(st.toString());
			}
		}
		
		return booking;
	}
	
	public ArrayList<WorkSpaceBooking> getAllCustomerBookings(int customerId, Boolean excludeFuture, Boolean excludeRunning, Boolean excludePast, Boolean excludeCancelled){
		
		String qryExcludeFuture="";
		String qryExludeRunning="";
		String qryExcludePast="";
		String qryExcludeCancelled="";
		
		if (excludeFuture) {
			qryExcludeFuture=" AND Not (PB.CheckinTime > Now() AND PB.BookingStatusId=1) ";
		}
		
		if(excludeRunning) {
			qryExludeRunning = " AND NOT (Now() between PB.CheckinTime and PB.CheckoutTime AND PB.BookingStatusId=1) ";
		}
		
		if (excludePast) {
			qryExcludePast=" AND NOT (PB.CheckoutTime < Now() OR PB.BookingStatusId=3) ";
		}
		
		if (excludeCancelled) {
			qryExcludeCancelled=" AND NOT PB.BookingStatusId=3 ";
		}
		
		
		PreparedStatement st = null;
		try {
			st=con.prepareStatement("Select PB.BookingId, PB.CustomerId, CST.FirstName CustomerFirstName, CST.LastName as CustomerLastName, "
					+ "PB.WorkSpaceId, PL.LocationId, PL.LocationName, PS.WorkSpaceName, PB.HourlyWorkSpacePrice, "
					+ "PB.StaffId, STF.FirstName StaffFirstName, CST.LastName as StaffLastName, "
					+ "PB.CheckinTime, PB.CheckoutTime,  PB.WorkSpaceBookingCost, "
					+ "PB.ChargedAmount, PB.RefundAmount, "
					+ "ROUND(TIME_TO_SEC(TIMEDIFF(PB.checkinTime, Now()))/60) MinutesToCheckinFromNow, "
					+ "PB.BookingstatusId, BS.StatusName AS Bookingstatus, PB.IsProcessed, PB.BookedTime, PB.FeedbackKey, "
					+ "IFNULL(CFB.FeedbackId, 0) FeedbackId, CFB.OverallRating, CFB.RatingOnStaff, CFB.FeedbackText, CFB.FeedbackTime from workSpacebookings PB "
					+ "inner join Customers CST on CST.CustomerId=PB.CustomerId inner join workSpaces PS ON PS.WorkSpaceID=PB.WorkSpaceID "
					+ "inner join Locations PL ON PL.LocationID = PS.LocationId "
					+ "left outer join Staff STF on STF.StaffId=PB.StaffId "
					+ "left outer join customerfeedbacks CFB on CFB.BookingId=PB.BookingId "
					+ "inner join StatusMaster BS on BS.StatusId=PB.BookingstatusId WHERE PB.CustomerId=? "
					+ qryExcludeFuture + qryExludeRunning + qryExcludePast + qryExcludeCancelled
					+ "Order by CheckinTime DESC;"); 
			st.setInt(1, customerId);
		
			ResultSet rs=st.executeQuery();
			System.out.println(st);
			ArrayList<WorkSpaceBooking> arrBookings = new ArrayList<WorkSpaceBooking>();
			while (rs.next()) {
				arrBookings.add(setObject(rs));
			}
			rs.close();
			st.close();
			return arrBookings; 
		}
		catch(Exception e) {
			e.printStackTrace();
			if (st != null) {
				System.out.print(st.toString());
			}
		}
		
		return null;
	}
	
	public ArrayList<WorkSpaceBooking> getAllBookings(int locationId, Date fromDate, Date toDate, Boolean excludeCancelled ){
		
		String qryExcludeCancelled="";
		
		if (excludeCancelled) {
			qryExcludeCancelled=" AND PB.BookingstatusId=1 ";
		}
		PreparedStatement st = null;
		try {
			st=con.prepareStatement("Select PB.BookingId, PB.CustomerId, CST.FirstName CustomerFirstName, CST.LastName as CustomerLastName, "
					+ "PB.WorkSpaceId, PL.LocationId, PL.LocationName, PS.WorkSpaceName, PB.HourlyWorkSpacePrice, " 
					+ "PB.StaffId, STF.FirstName StaffFirstName, CST.LastName as StaffLastName, "
					+ "PB.CheckinTime, PB.CheckoutTime, PB.WorkSpaceBookingCost, "
					+ "PB.ChargedAmount, PB.RefundAmount, "
					+ "ROUND(TIME_TO_SEC(TIMEDIFF(PB.checkinTime, Now()))/60) MinutesToCheckinFromNow, "
					+ "PB.BookingstatusId, BS.StatusName AS Bookingstatus, PB.IsProcessed, PB.BookedTime, PB.FeedbackKey, "
					+ "IFNULL(CFB.FeedbackId, 0) FeedbackId, CFB.OverallRating, CFB.RatingOnStaff, CFB.FeedbackText, CFB.FeedbackTime from workSpacebookings PB "
					+ "inner join Customers CST on CST.CustomerId=PB.CustomerId inner join workSpaces PS ON PS.WorkSpaceID=PB.WorkSpaceID "
					+ "inner join Locations PL ON PL.LocationID = PS.LocationId "
					+ "left outer join Staff STF on STF.StaffId=PB.StaffId "
					+ "left outer join customerfeedbacks CFB on CFB.BookingId=PB.BookingId "
					+ "inner join StatusMaster BS on BS.StatusId=PB.BookingstatusId WHERE PS.LocationId=? AND PB.CheckinTime BETWEEN ? and ? "
					+ qryExcludeCancelled
					+ "Order by CheckinTime DESC;"); 
			st.setInt(1, locationId);
			st.setDate(2, fromDate);
			st.setDate(3, toDate);
			ResultSet rs=st.executeQuery();
			ArrayList<WorkSpaceBooking> arrBookings = new ArrayList<WorkSpaceBooking>();
			while (rs.next()) {
				arrBookings.add(setObject(rs));
			}
			rs.close();
			st.close();
			return arrBookings; 
		}
		catch(Exception e) {
			e.printStackTrace();
			if (st != null) {
				System.out.print(st.toString());
			}
		}
		
		return null;
		
	}
	
	public int DifferenceInHours(String startTime, String endTime) {
		PreparedStatement st = null;
		int diffHours=0;
		try {
			st=con.prepareStatement("Select CEILING(TIME_TO_SEC(TIMEDIFF( ?, ?))/3600) as DiffHours;"); 
			st.setString(1, startTime);
			st.setString(2, endTime);
			ResultSet rs=st.executeQuery();
			if (rs.next()) {
				diffHours=rs.getInt("DiffHours");
			}
			rs.close();
			st.close();
		}
		catch(Exception e) {
			e.printStackTrace();
			if (st != null) {
				System.out.print(st.toString());
			}
		}
		return diffHours;
	}
	
	public void processBookings() {
		//implementation pending
		//PreparedStatement st=null;
		try {
//			Connection con=Database.getConnection();
//			st=con.prepareStatement("");
//			st.executeUpdate();
			
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(System.out);
		}		
	}
}
