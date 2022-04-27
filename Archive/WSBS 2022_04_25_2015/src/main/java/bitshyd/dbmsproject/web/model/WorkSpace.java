package bitshyd.dbmsproject.web.model;

import java.util.Date;

public class WorkSpace {
	private int WorkSpaceID;
	private int LocationId;
	private String LocationName;
	private String WorkSpaceSize;
	private int WorkSpacePrice;
	private int WorkSpaceNumber;
	private String WorkSpaceName;
	private User Staff;
	private int WorkSpaceStatusId;
	private String WorkSpaceStatus;
	private Date TimeCreate;
	private Date TimeUpdate;
	
	public int getWorkSpaceID() {
		return WorkSpaceID;
	}
	public void setWorkSpaceID(int workSpaceID) {
		WorkSpaceID = workSpaceID;
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
	public String getWorkSpaceSize() {
		return WorkSpaceSize;
	}
	public void setWorkSpaceSize(String workSpaceSize) {
		WorkSpaceSize = workSpaceSize;
	}
	public int getWorkSpacePrice() {
		return WorkSpacePrice;
	}
	public void setWorkSpacePrice(int workSpacePrice) {
		WorkSpacePrice = workSpacePrice;
	}
	public int getWorkSpaceNumber() {
		return WorkSpaceNumber;
	}
	public void setWorkSpaceNumber(int workSpaceNumber) {
		WorkSpaceNumber = workSpaceNumber;
	}
	public String getWorkSpaceName() {
		return WorkSpaceName;
	}
	public void setWorkSpaceName(String workSpaceName) {
		WorkSpaceName = workSpaceName;
	}
	
	public User getStaff() {
		return Staff;
	}
	public void setStaff(User staff) {
		Staff = staff;
	}
	public int getWorkSpaceStatusId() {
		return WorkSpaceStatusId;
	}
	public void setWorkSpaceStatusId(int workSpaceStatusId) {
		WorkSpaceStatusId = workSpaceStatusId;
	}
	public String getWorkSpaceStatus() {
		return WorkSpaceStatus;
	}
	public void setWorkSpaceStatus(String workSpaceStatus) {
		WorkSpaceStatus = workSpaceStatus;
	}
	public Date getTimeCreate() {
		return TimeCreate;
	}
	public void setTimeCreate(Date timeCreate) {
		TimeCreate = timeCreate;
	}
	public Date getTimeUpdate() {
		return TimeUpdate;
	}
	public void setTimeUpdate(Date timeUpdate) {
		TimeUpdate = timeUpdate;
	}
}
