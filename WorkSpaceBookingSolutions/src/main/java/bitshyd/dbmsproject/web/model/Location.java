package bitshyd.dbmsproject.web.model;

public class Location {
	private int LocationID =0 ;
	private String LocationName="";
	private int BigWorkSpaces =0;
	private int SmallWorkSpaces=0;
	private int LocationStatusID=0;
	private String LocationStatus="";
	
	public int getBigWorkSpaces() {
		return BigWorkSpaces;
	}
	
	
	public int getLocationID() {
		return LocationID;
	}

	public void setLocationID(int locationID) {
		LocationID = locationID;
	}

	public String getLocationName() {
		return LocationName;
	}

	public void setLocationName(String locationName) {
		LocationName = locationName;
	}

	public void setBigWorkSpaces(int bigWorkSpaces) {
		BigWorkSpaces = bigWorkSpaces;
	}

	public int getSmallWorkSpaces() {
		return SmallWorkSpaces;
	}

	public void setSmallWorkSpaces(int smallWorkSpaces) {
		SmallWorkSpaces = smallWorkSpaces;
	}



	public int getLocationStatusID() {
		return LocationStatusID;
	}

	public void setLocationStatusID(int locationStatusID) {
		LocationStatusID = locationStatusID;
	}

	public String getLocationStatus() {
		return LocationStatus;
	}

	public void setLocationStatus(String locationStatus) {
		LocationStatus = locationStatus;
	}

	public String getStrWorkSpaceLocationID() {
		return String.valueOf(LocationID);
	}
	
	public String getStrBigWorkSpaces() {
		return String.valueOf(BigWorkSpaces);
	}
	
	public String getStrSmallWorkSpaces() {
		return String.valueOf(SmallWorkSpaces);
	}

	public String getSelectIfLocationMatches(int locationId)
	{
		if (locationId == LocationID)
			return "selected";
		else
			return "";
	}
	
	
}
