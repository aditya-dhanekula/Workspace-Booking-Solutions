package bitshyd.dbmsproject.web.model;

import java.sql.Date;
import java.util.ArrayList;

public class User {
	private int UserId=0;
	private String Username="";
	private String UserPassword="";
	private String FirstName="";
	private String LastName="";
	private Date DOB = new Date(0);
	private String Gender="Male";
	private String City="";
	private String Pincode="";
	private String EmailID="";
	private int WorkLocationId=0;
	private String WorkLocationName="";
	private String PhoneNo="";
	private String ResidentialAddress="";

	private int WalletAmount=0;
	
	private int StaffTotalPoints = 0;
	private int StaffRatedMembersCount = 0;	
	private String ResetPasswordKey="";
	private Date ResetPasswordKeySetOn;
	
	private ArrayList<Service> StaffServices = new ArrayList<Service>(); 
	private int UserTypeId=0;
	private int UserStatusId=0;
	private String UserStatus="";
	private Date TimeCreate = new Date(0);
	private Date TimeUpdate=new Date(0);
	private String ErrorMsg="";
	private String OTP="";
	
	public User()
	{
		
	}

	public int getUserId() {
		return UserId;
	}

	public void setUserId(int userId) {
		UserId = userId;
	}

	public String getUsername() {
		return Username;
	}

	public void setUsername(String username) {
		Username = username;
	}

	public String getUserPassword() {
		return UserPassword;
	}

	public void setUserPassword(String userPassword) {
		UserPassword = userPassword;
	}

	public String getFirstName() {
		return FirstName;
	}

	public void setFirstName(String firstName) {
		FirstName = firstName;
	}

	public String getLastName() {
		return LastName;
	}

	public void setLastName(String lastName) {
		LastName = lastName;
	}

	public Date getDOB() {
		return DOB;
	}

	public void setDOB(Date dOB) {
		DOB = dOB;
	}

	public String getGender() {
		return Gender;
	}

	public void setGender(String gender) {
		Gender = gender;
	}

	public String getCity() {
		return City;
	}

	public void setCity(String city) {
		City = city;
	}

	public String getPincode() {
		return Pincode;
	}

	public void setPincode(String pincode) {
		Pincode = pincode;
	}

	public String getEmailID() {
		return EmailID;
	}

	public void setEmailID(String emailID) {
		EmailID = emailID;
	}

	public String getPhoneNo() {
		return PhoneNo;
	}

	public int getWorkLocationId() {
		return WorkLocationId;
	}

	public void setWorkLocationId(int workLocationId) {
		WorkLocationId = workLocationId;
	}

	public String getWorkLocationName() {
		return WorkLocationName;
	}

	public void setWorkLocationName(String workLocationName) {
		WorkLocationName = workLocationName;
	}

	public void setPhoneNo(String phoneNo) {
		PhoneNo = phoneNo;
	}

	public String getResidentialAddress() {
		return ResidentialAddress;
	}

	public void setResidentialAddress(String residentialAddress) {
		ResidentialAddress = residentialAddress;
	}

	public int getWalletAmount() {
		return WalletAmount;
	}

	public void setWalletAmount(int walletAmount) {
		WalletAmount = walletAmount;
	}

	public double getRating() {
		return Math.round((10.0d *StaffTotalPoints) /StaffRatedMembersCount)/10 ;
	}


	public ArrayList<Service> getStaffServices() {
		return StaffServices;
	}

	public void setStaffServices(ArrayList<Service> staffServices) {
		StaffServices = staffServices;
	}

	public int getUserTypeId() {
		return UserTypeId;
	}

	public void setUserTypeId(int userTypeId) {
		UserTypeId = userTypeId;
	}

	public String getUserType() {
		String userType="";
		if (UserTypeId==1)
			userType= "Admin";
		else if (UserTypeId==2)
			userType= "Staff";
		else if (UserTypeId==3)
			userType="Customer";
		return userType;
	}

	public int getStaffTotalPoints() {
		return StaffTotalPoints;
	}

	public void setStaffTotalPoints(int staffTotalPoints) {
		StaffTotalPoints = staffTotalPoints;
	}

	public int getStaffRatedMembersCount() {
		return StaffRatedMembersCount;
	}

	public void setStaffRatedMembersCount(int staffRatedMembersCount) {
		StaffRatedMembersCount = staffRatedMembersCount;
	}
	
	public String getResetPasswordKey() {
		return ResetPasswordKey;
	}

	public void setResetPasswordKey(String resetPasswordKey) {
		ResetPasswordKey = resetPasswordKey;
	}

	public Date getResetPasswordKeySetOn() {
		return ResetPasswordKeySetOn;
	}

	public void setResetPasswordKeySetOn(Date resetPasswordKeySetOn) {
		ResetPasswordKeySetOn = resetPasswordKeySetOn;
	}

	public int getUserStatusId() {
		return UserStatusId;
	}

	public void setUserStatusId(int userStatusId) {
		UserStatusId = userStatusId;
	}

	public String getUserStatus() {
		return UserStatus;
	}

	public void setUserStatus(String userStatus) {
		UserStatus = userStatus;
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

	public String getErrorMsg() {
		return ErrorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		ErrorMsg = errorMsg;
	}

	public String getOTP() {
		return OTP;
	}

	public void setOTP(String oTP) {
		OTP = oTP;
	}
}
