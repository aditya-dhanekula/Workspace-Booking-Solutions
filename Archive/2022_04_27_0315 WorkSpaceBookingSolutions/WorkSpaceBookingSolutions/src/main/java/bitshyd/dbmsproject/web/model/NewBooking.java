package bitshyd.dbmsproject.web.model;

import java.util.ArrayList;

public class NewBooking {
	private WorkSpaceBooking booking;
	private int LocationId = 0;
	private String LocationName="";
	private ArrayList<Location> ArrLocations;
	private String Checkin;
	private String Checkout;
	private ArrayList<WorkSpace> ArrWorkSpaces;
	private User Staff;
	private String optedServices="";
	private ArrayList<Service> ArrOptedServices;
	private User Customer;
	private String actionType="";
	
	public NewBooking() {
		booking=new WorkSpaceBooking();
	}

	public WorkSpaceBooking getBooking() {
		return booking;
	}

	public void setBooking(WorkSpaceBooking booking) {
		this.booking = booking;
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

	public ArrayList<Location> getArrLocations() {
		return ArrLocations;
	}

	public void setArrLocations(ArrayList<Location> arrLocations) {
		ArrLocations = arrLocations;
	}

	public String getCheckin() {
		return Checkin;
	}

	public void setCheckin(String checkin) {
		Checkin = checkin;
	}

	public String getCheckout() {
		return Checkout;
	}

	public void setCheckout(String checkout) {
		Checkout = checkout;
	}

	public ArrayList<WorkSpace> getArrWorkSpaces() {
		return ArrWorkSpaces;
	}

	public void setArrWorkSpaces(ArrayList<WorkSpace> arrWorkSpaces) {
		ArrWorkSpaces = arrWorkSpaces;
	}

	public User getStaff() {
		return Staff;
	}

	public void setStaff(User staff) {
		Staff = staff;
	}

	public String getOptedServices() {
		return optedServices;
	}

	public void setOptedServices(String optedServices) {
		this.optedServices = optedServices;
	}

	public ArrayList<Service> getArrOptedServices() {
		return ArrOptedServices;
	}

	public void setArrOptedServices(ArrayList<Service> arrOptedServices) {
		ArrOptedServices = arrOptedServices;
	}
	
	public User getCustomer() {
		return Customer;
	}

	public void setCustomer(User customer) {
		Customer = customer;
	}

	public String getActionType() {
		return actionType;
	}

	public void setActionType(String actionType) {
		this.actionType = actionType;
	}
}
