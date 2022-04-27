package bitshyd.dbmsproject.web.model;
import java.util.ArrayList;

public class LocationsSpacesAndStaff {
	private int selectedLocationId = 0;
	private int selectedStaffId = 0;
	private ArrayList<Location> arrLocations;
	private ArrayList<WorkSpace> arrWorkSpaces;
	private ArrayList<User> arrStaff;
	
	
	public int getSelectedLocationId() {
		return selectedLocationId;
	}
	public void setSelectedLocationId(int selectedLocationId) {
		this.selectedLocationId = selectedLocationId;
	}
	
	
	public int getSelectedStaffId() {
		return selectedStaffId;
	}
	public void setSelectedStaffId(int selectedStaffId) {
		this.selectedStaffId = selectedStaffId;
	}
	public ArrayList<Location> getArrLocations() {
		return arrLocations;
	}
	public void setArrLocations(ArrayList<Location> arrLocations) {
		this.arrLocations = arrLocations;
	}
	public ArrayList<WorkSpace> getArrWorkSpaces() {
		return arrWorkSpaces;
	}
	public void setArrWorkSpaces(ArrayList<WorkSpace> arrWorkSpaces) {
		this.arrWorkSpaces = arrWorkSpaces;
	}
	public ArrayList<User> getArrStaff() {
		return arrStaff;
	}
	public void setArrStaff(ArrayList<User> arrStaff) {
		this.arrStaff = arrStaff;
	}

}
