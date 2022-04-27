package bitshyd.dbmsproject.web.model;

import java.sql.Timestamp;
import java.util.ArrayList;

public class WorkSpaceBooking {
	private int BookingId=0;
	private int CustomerId=0;
	private String CustomerFirstName ="";
	private String CustomerLastName ="";
	private String CustomerEmailId="";
	private int WorkSpaceId=0;
	private int LocationId=0;
	private String LocationName="";
	private String WorkSpaceName="";
	private int HourlyWorkSpacePrice=0;
	private WorkSpace Space;
	private int StaffId=0;
	private String StaffFirstName ="";
	private String StaffLastName ="";
	private String strCheckinTime;
	private Timestamp CheckinTime;
	private String strCheckoutTime;
	private Timestamp CheckoutTime;
	private long MinutesToCheckinFromNow;
	private int ChargedAmount=0;
	private int RefundAmount=0;
	private int BookingstatusId=1;
	private String Bookingstatus ="";
	private Timestamp BookedTime;
	private long FeedbackKey=0; 
	private int FeedbackId=0;
	private int RatingOnService=0;
	private int RatingOnStaff=0;
	private String FeedbackText="";
	private Timestamp FeedbackTime;
	
	
	private String ServiceIds="";
	private ArrayList<Service> arrServices;

	
	public int getBookingId() {
		return BookingId;
	}
	public void setBookingId(int bookingId) {
		BookingId = bookingId;
	}
	public int getCustomerId() {
		return CustomerId;
	}
	public void setCustomerId(int customerId) {
		CustomerId = customerId;
	}
	public String getCustomerFirstName() {
		return CustomerFirstName;
	}
	public void setCustomerFirstName(String customerFirstName) {
		CustomerFirstName = customerFirstName;
	}
	public String getCustomerLastName() {
		return CustomerLastName;
	}
	public void setCustomerLastName(String customerLastName) {
		CustomerLastName = customerLastName;
	}
	public String getCustomerEmailId() {
		return CustomerEmailId;
	}
	public void setCustomerEmailId(String customerEmailId) {
		CustomerEmailId = customerEmailId;
	}
	public int getWorkSpaceId() {
		return WorkSpaceId;
	}
	public void setWorkSpaceId(int workSpaceId) {
		WorkSpaceId = workSpaceId;
	}
	
	public int getLocationId() {
		return LocationId;
	}
	public void setLocationId(int locationId) {
		LocationId = locationId;
	}
	public String getLocationName() {
		return LocationName;
	}
	public void setLocationName(String locationName) {
		LocationName = locationName;
	}
	public String getWorkSpaceName() {
		return WorkSpaceName;
	}
	public void setWorkSpaceName(String workSpaceName) {
		WorkSpaceName = workSpaceName;
	}
	public int getHourlyWorkSpacePrice() {
		return HourlyWorkSpacePrice;
	}
	public void setHourlyWorkSpacePrice(int hourlyWorkSpacePrice) {
		HourlyWorkSpacePrice = hourlyWorkSpacePrice;
	}
	public WorkSpace getSpace() {
		return Space;
	}
	public void setSpace(WorkSpace space) {
		Space = space;
	}
	public int getStaffId() {
		return StaffId;
	}
	public void setStaffId(int staffId) {
		StaffId = staffId;
	}
	public String getStaffFirstName() {
		return StaffFirstName;
	}
	public void setStaffFirstName(String staffFirstName) {
		StaffFirstName = staffFirstName;
	}
	public String getStaffLastName() {
		return StaffLastName;
	}
	public void setStaffLastName(String staffLastName) {
		StaffLastName = staffLastName;
	}
	public Timestamp getCheckinTime() {
		return CheckinTime;
	}
	public void setCheckinTime(Timestamp checkinTime) {
		CheckinTime = checkinTime;
	}
		
	public String getStrCheckinTime() {
		return strCheckinTime;
	}
	public void setStrCheckinTime(String strCheckinTime) {
		this.strCheckinTime = strCheckinTime;
	}
	public String getStrCheckoutTime() {
		return strCheckoutTime;
	}
	public void setStrCheckoutTime(String strCheckoutTime) {
		this.strCheckoutTime = strCheckoutTime;
	}
	public Timestamp getCheckoutTime() {
		return CheckoutTime;
	}
	public void setCheckoutTime(Timestamp checkoutTime) {
		CheckoutTime = checkoutTime;
	}
	public long getMinutesToCheckinFromNow() {
		return MinutesToCheckinFromNow;
	}
	public void setMinutesToCheckinFromNow(long minutesToCheckinFromNow) {
		MinutesToCheckinFromNow = minutesToCheckinFromNow;
	}
	public int getChargedAmount() {
		return ChargedAmount;
	}
	public void setChargedAmount(int chargedAmount) {
		ChargedAmount = chargedAmount;
	}
	public int getRefundAmount() {
		return RefundAmount;
	}
	public void setRefundAmount(int refundAmount) {
		RefundAmount = refundAmount;
	}
	public int getBookingstatusId() {
		return BookingstatusId;
	}
	public void setBookingstatusId(int bookingstatusId) {
		BookingstatusId = bookingstatusId;
	}
	public String getBookingstatus() {
		return Bookingstatus;
	}
	public void setBookingstatus(String bookingstatus) {
		Bookingstatus = bookingstatus;
	}
	public Timestamp getBookedTime() {
		return BookedTime;
	}
	public void setBookedTime(Timestamp bookedTime) {
		BookedTime = bookedTime;
	}
	
	public long getFeedbackKey() {
		return FeedbackKey;
	}
	public void setFeedbackKey(long feedbackKey) {
		FeedbackKey = feedbackKey;
	}
	public void setFeedbackId(int feedbackId) {
		FeedbackId = feedbackId;
	}
	public int getFeedbackId() {
		return FeedbackId;
	}
	public int getRatingOnService() {
		return RatingOnService;
	}
	public void setRatingOnService(int ratingOnService) {
		RatingOnService = ratingOnService;
	}
	public int getRatingOnStaff() {
		return RatingOnStaff;
	}
	public void setRatingOnStaff(int ratingOnStaff) {
		RatingOnStaff = ratingOnStaff;
	}
	
	public String getFeedbackText() {
		return FeedbackText;
	}
	public void setFeedbackText(String feedbackText) {
		FeedbackText = feedbackText;
	}
	public Timestamp getFeedbackTime() {
		return FeedbackTime;
	}
	public void setFeedbackTime(Timestamp feedbackTime) {
		FeedbackTime = feedbackTime;
	}
	public String getServiceIds() {
		return ServiceIds;
	}
	public void setServiceIds(String serviceIds) {
		ServiceIds = serviceIds;
	}
	public ArrayList<Service> getArrServices() {
		return arrServices;
	}
	public void setArrServices(ArrayList<Service> arrServices) {
		this.arrServices = arrServices;
	}
}
