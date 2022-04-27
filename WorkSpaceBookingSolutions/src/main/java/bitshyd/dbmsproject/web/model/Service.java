package bitshyd.dbmsproject.web.model;

import java.util.Date;

public class Service {
	private int serviceID =0;
	private String ServiceName="";
	private int ServicePrice = 0;
	private String UnitType="";
	private int ServiceStatusID = 0;
	private String ServiceStatus ="";
	private Date TimeCreate;
	private Date TimeUpdate;
	
	private boolean Selected= false;
	
	public int getServiceID() {
		return serviceID;
	}
	public void setServiceID(int serviceID) {
		this.serviceID = serviceID;
	}
	public String getServiceName() {
		return ServiceName;
	}
	public void setServiceName(String serviceName) {
		ServiceName = serviceName;
	}
	public int getServicePrice() {
		return ServicePrice;
	}
	public void setServicePrice(int servicePrice) {
		ServicePrice = servicePrice;
	}
	public int getServiceStatusID() {
		return ServiceStatusID;
	}
	public String getUnitType() {
		return UnitType;
	}
	public void setUnitType(String unitType) {
		UnitType = unitType;
	}
	public void setServiceStatusID(int serviceStatusID) {
		ServiceStatusID = serviceStatusID;
	}
	public String getServiceStatus() {
		return ServiceStatus;
	}
	public void setServiceStatus(String serviceStatus) {
		ServiceStatus = serviceStatus;
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
	public boolean isSelected() {
		return Selected;
	}
	public void setSelected(boolean selected) {
		Selected = selected;
	}
}
	
