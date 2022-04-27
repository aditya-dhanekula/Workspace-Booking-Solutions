package bitshyd.dbmsproject.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bitshyd.dbmsproject.web.model.Service;
import bitshyd.dbmsproject.web.model.User;

public class UserDao {
	
	public User getAdmin(String userName) {
		Connection con = null;
		User objUser= new User();
		try {
			con = Database.getConnection();
			// System.out.println("Connection Established");
			PreparedStatement st = con.prepareStatement("Select AdminId from Admin where UserName=? and UserStatusId=1;");
			
			st.setString(1, userName); 
			ResultSet rs = st.executeQuery();
			int AdminId=0; 
			if (rs.next()) {
				AdminId=rs.getInt("AdminId");
			}
			rs.close();
			if (AdminId>0) {
				objUser=getAdmin(AdminId);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return objUser;
	}

	public User getStaff(String userName) {
		Connection con = null;
		User objUser= new User();
		try {
			con = Database.getConnection();
			// System.out.println("Connection Established");
			PreparedStatement st = con.prepareStatement(
					"Select staffId FROM staff where UserName=? and UserStatusId=1;");
			st.setString(1, userName); 
			ResultSet rs = st.executeQuery();
			int staffId=0; 
			if (rs.next()) {
				staffId=rs.getInt("staffId");
			}
			rs.close();
			if (staffId>0) {
				objUser=getStaff(staffId);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return objUser;
	}
	
	public User getCustomer(String userName) {
		Connection con = null;
		User objUser= new User();
		try {
			con = Database.getConnection();
			// System.out.println("Connection Established");
			PreparedStatement st = con.prepareStatement(
					"Select customerId from Customers where UserName=? and UserStatusId=1;");
			
			st.setString(1, userName); 
			ResultSet rs = st.executeQuery();
			int customerId=0; 
			if (rs.next()) {
				customerId=rs.getInt("customerId");
			}
			rs.close();
			if (customerId>0) {
				objUser=getCustomer(customerId);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return objUser;
	}
	
	public User getAdmin(int UserId) {
		Connection con = null;
		User objUser=new User();
		try {
			con = Database.getConnection();
			// System.out.println("Connection Established");
			PreparedStatement st = con.prepareStatement(
					"Select 1 As UserTypeId, A.AdminId as UserId, A.UserName, A.userPassword, A.FirstName, A.LastName, A.EmailID, A.PhoneNo, "
					 + "A.ResetPasswordKey, A.ResetPasswordKeySetOn, " 
					+ "A.UserStatusId, S.StatusName as UserStatus, A.TimeCreate, A.TimeUpdate "
					+ "FROM admin as A inner join statusmaster as S on S.statusId = A.UserStatusId "
					+ "where A.AdminId=? and A.UserStatusId>0;");
			
			st.setInt(1, UserId);
			// System.out.println("Before Query:" + st.toString());
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				setUserObject(objUser, rs);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return objUser;
	}
	
	public User getStaff(int userID) {
		Connection con = null;
		User objUser=new User();
		try {
			con = Database.getConnection();
			// System.out.println("Connection Established");
			//StaffId, Username, UserPassword, UserStatusId, FirstName, LastName, DOB, Gender, ResidentialAddress, 
			//City, Pincode, EmailID, WorkLocationId, PhoneNo, StaffTotalPoints, ServiceTotalPoints, StaffRatedMembersCount, TimeCreate, TimeUpdate
			PreparedStatement st = con.prepareStatement(
					"Select 2 as UserTypeId, St.StaffID as UserId, St.UserName, St.userpassword, St.FirstName, St.LastName, St.DOB, St.Gender, St.EmailID, "
					+ "St.PhoneNo, St.ResidentialAddress, St.City, St.Pincode, St.WorkLocationId, IFnull(L.LocationName, '') As WorkLocationName,"
				    + "St.StaffTotalPoints, St.ServiceTotalPoints, St.StaffRatedMembersCount, "
					+ "St.ResetPasswordKey, St.ResetPasswordKeySetOn, " 
 					+ "St.UserStatusId, S.StatusName as UserStatus, St.TimeCreate, St.TimeUpdate "
					+ "FROM Staff as St inner join StatusMaster as S on S.StatusId = St.UserStatusId "
 					+ "left outer join Locations L ON L.LocationID=St.WorkLocationId "
					+ "where St.StaffId=? and St.UserStatusId>0;");

			
			st.setInt(1, userID);
			// System.out.println(st.toString());
			// System.out.println("Before Query:" + st.toString());
			ResultSet rs = st.executeQuery();
			// System.out.println("After Query");
			if (rs.next()) {
				setUserObject(objUser, rs);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return objUser;
	}
	
	public User getCustomer(int UserId) {
		Connection con = null;
		User objUser=new User();
		try {
			con = Database.getConnection();
			// System.out.println("Connection Established");
			//customerId, Username, UserPassword, UserStatusId, FirstName, LastName, DOB, Gender, EmailID, 
			//PhoneNo, ResidentialAddress, City, Pincode, WalletAmount, TimeCreate, TimeUpdate
			PreparedStatement st = con.prepareStatement(
					"Select 3 as UserTypeId, C.CustomerID as UserId, C.UserName, C.userpassword, C.FirstName, C.LastName, C.DOB, C.Gender, C.EmailID, "
					+ "C.PhoneNo, C.ResidentialAddress, C.City, C.Pincode, C.WalletAmount, "
				 	+ "C.ResetPasswordKey, C.ResetPasswordKeySetOn, " 
 					+ "C.UserStatusId, S.StatusName as UserStatus, C.TimeCreate, C.TimeUpdate "
					+ "FROM Customers as C inner join StatusMaster as S on S.StatusId = C.UserStatusId "
					+ "where C.CustomerId=?  and C.UserStatusId>0;");
			
			st.setInt(1, UserId);
			// System.out.println("Before Query:" + st.toString());
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				setUserObject(objUser, rs);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return objUser;
	}
	
	public void saveResetPasswordKeyDetails(int userId, String resetPasswordKey) {
		Connection con = null;
		try {
			con = Database.getConnection();
			PreparedStatement st = con.prepareStatement(
					"Update users Set ResetPasswordKey=?, ResetPasswordKeySetOn=Now() where UserId=?;");
			st.setString(1, resetPasswordKey);
			st.setInt(2, userId);
			
			st.executeUpdate();
			st.close();
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	private void setUserObject(User user, ResultSet rs) throws Exception { 
		try {
			int userTypeId=rs.getInt("UserTypeId");
			user.setUserTypeId(userTypeId);
			user.setUserId(rs.getInt("UserId"));
			user.setUsername(rs.getString("Username"));
			user.setUserPassword(rs.getString("userpassword"));
			user.setUserStatusId(rs.getInt("UserStatusId"));
			user.setUserStatus(rs.getString("UserStatus"));
			user.setFirstName(rs.getString("FirstName"));
			user.setLastName(rs.getString("LastName"));
			user.setEmailID(rs.getString("EmailID"));
			user.setPhoneNo(rs.getString("PhoneNo"));
		
			user.setResetPasswordKey(rs.getString("ResetPasswordKey"));
			user.setResetPasswordKeySetOn(rs.getDate("ResetPasswordKeySetOn"));
			user.setTimeCreate(rs.getDate("TimeCreate"));
			user.setTimeUpdate(rs.getDate("TimeUpdate"));
			
			if (userTypeId==2) //Staff 
			{
				user.setDOB(rs.getDate("DOB"));
				user.setGender(rs.getString("Gender"));
				user.setResidentialAddress(rs.getString("ResidentialAddress"));
				user.setCity(rs.getString("City"));
				user.setPincode(rs.getString("Pincode"));

				user.setWorkLocationId(rs.getInt("WorkLocationId"));
				user.setWorkLocationName(rs.getString("WorkLocationName"));
				user.setStaffTotalPoints(rs.getInt("StaffTotalPoints"));
				user.setServiceTotalPoints(rs.getInt("ServiceTotalPoints"));  
				user.setStaffRatedMembersCount(rs.getInt("StaffRatedMembersCount"));
				ArrayList<Service> staffServices = (new ServiceDao()).getAllStaffServices(rs.getInt("UserId"));
				user.setStaffServices(staffServices);

			}
			else if (userTypeId==3 ) //Customer
			{
				user.setDOB(rs.getDate("DOB"));
				user.setGender(rs.getString("Gender"));
				user.setResidentialAddress(rs.getString("ResidentialAddress"));
				user.setCity(rs.getString("City"));
				user.setPincode(rs.getString("Pincode"));

				user.setWalletAmount(rs.getInt("WalletAmount"));		
			}
			
			
			
		} catch (Exception ex) {
			//ex.printStackTrace();
			throw (ex);
		}
	}

	public boolean isUsernameUnique(User objUser) {
		Connection con = null;
		
		try {
			con = Database.getConnection();
			// System.out.println("Connection Established");
			PreparedStatement st = con.prepareStatement("Select 1 from " + userTableName(objUser.getUserTypeId()) +" where Username=?");
			st.setString(1, objUser.getUsername());
			// System.out.println("Before Query:" + st.toString());
			ResultSet rs = st.executeQuery();
			// System.out.println("After Query");
			if (!rs.next()) {
				return true;
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public ArrayList<User> GetCustomers(String strField, String strValue) {
		Connection con = null;
		strValue += "%";
		try {
			con = Database.getConnection();
			// System.out.println("Connection Established");
			PreparedStatement st = con.prepareStatement(
					"Select 3 as UserTypeId, u.CustomerId as UserId, u.Username, u.userpassword, u.FirstName, u.LastName, u.DOB, u.Gender, u.EmailID, "
					+ "u.PhoneNo, u.ResidentialAddress, u.City, u.Pincode, "
					+ "u.WalletAmount, u.ResetPasswordKey, u.ResetPasswordKeySetOn, u.UserStatusId, us.StatusName as UserStatus, u.TimeCreate, u.TimeUpdate "
					+ "FROM Customers as u inner join StatusMaster as us on us.StatusId = u.UserStatusId "
					+ "where u.UserStatusId >= 1 and " 
					+  "u." + strField  + " like ? ;");
			st.setString(1, strValue);
			// System.out.println(st.toString());
			// System.out.println("Before Query:" + st.toString());
			ResultSet rs = st.executeQuery();
			// System.out.println("After Query");
			ArrayList<User> arrUsers = new ArrayList<User>();
			while (rs.next()) {

				User objUser = new User();
				setUserObject(objUser, rs);
				arrUsers.add(objUser);
			}
			rs.close();
			return arrUsers;
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}
	
	public ArrayList<User> GetStaff(String strField, String strValue) {
		Connection con = null;
		strValue += "%";
		try {
			con = Database.getConnection();
			// System.out.println("Connection Established");
			String tblPrefix = strField.equalsIgnoreCase("LocationName") ? "L.": "St.";
			
				
			PreparedStatement st = con.prepareStatement(
			"Select 2 as UserTypeId, St.StaffID as UserId, St.UserName, St.userpassword, St.FirstName, St.LastName, St.DOB, St.Gender, St.EmailID, "
					+ "St.PhoneNo, St.ResidentialAddress, St.City, St.Pincode, St.WorkLocationId, IFnull(L.LocationName, '') As WorkLocationName, "
				    + "St.StaffTotalPoints, St.ServiceTotalPoints, St.StaffRatedMembersCount, "
					+ "St.ResetPasswordKey, St.ResetPasswordKeySetOn, " 
 					+ "St.UserStatusId, S.StatusName as UserStatus, St.TimeCreate, St.TimeUpdate "
					+ "FROM Staff as St inner join StatusMaster as S on S.StatusId = St.UserStatusId "
 					+ "left outer join Locations L ON L.LocationID=St.WorkLocationId "
					+ "where St.UserStatusId >= 1 and " 
					+  tblPrefix + strField  + " Like ?;");
			st.setString(1, strValue);
			// System.out.println(st.toString());
			// System.out.println("Before Query:" + st.toString());
			ResultSet rs = st.executeQuery();
			// System.out.println("After Query");
			ArrayList<User> arrUsers = new ArrayList<User>();
			while (rs.next()) {

				User objUser = new User();
				setUserObject(objUser, rs);
				arrUsers.add(objUser);
			}
			rs.close();
			return arrUsers;
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}
	
	public ArrayList<User> getAllStaffbyWorkLocation(int locationId) {
	
		return getAllStaffbyWorkLocation(locationId, "1, 2");
	}
	
	public ArrayList<User> getAllActiveStaffbyWorkLocation(int locationId) {
		
		return getAllStaffbyWorkLocation(locationId, "1");
	}
	
	private ArrayList<User> getAllStaffbyWorkLocation(int locationId, String statusList) {
		Connection con = null;
		try {
			con = Database.getConnection();
			// System.out.println("Connection Established");
			PreparedStatement st = con.prepareStatement(
					"Select 2 as UserTypeId, u.StaffId as UserId, u.Username, u.userpassword, u.FirstName, u.LastName, u.DOB, u.Gender, u.EmailID, u.WorkLocationId, "
					+ "IFnull(pl.LocationName, '') As WorkLocationName, u.PhoneNo, u.ResidentialAddress, u.City, u.Pincode, "
					+ "u.StaffTotalPoints, u.ServiceTotalPoints, u.StaffRatedMembersCount, "
					+ "u.ResetPasswordKey, u.ResetPasswordKeySetOn, u.UserStatusId, us.StatusName as UserStatus, u.TimeCreate, u.TimeUpdate "
					+ "FROM Staff as u inner join StatusMaster as us on us.StatusId = u.UserStatusId "
					+ "inner join Locations As pl on pl.LocationId = u.WorkLocationId "
					+ "where u.WorkLocationId=? and u.UserStatusId in (" + statusList + ") "
					+ " Order by u.FirstName, u.LastName");
			st.setInt(1, locationId);
			// System.out.println(st.toString());
			// System.out.println("Before Query:" + st.toString());
			ResultSet rs = st.executeQuery();
			// System.out.println("After Query");
			ArrayList <User> arrStaff = new ArrayList<User>();
			while (rs.next())
			{
				User objUser = new User();
				setUserObject(objUser, rs);
				arrStaff.add(objUser);
			}
			rs.close();
			st.close();
			return arrStaff;
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}
	
	public int saveCustomerDetails(User objUser) {
		Connection con = null;
		try {
			con = Database.getConnection();
			PreparedStatement st = con.prepareStatement(
					"insert into Customers ( UserName, UserPassword, FirstName, LastName,  DOB, Gender, EmailID, PhoneNo, ResidentialAddress, City, PinCode, UserStatusId, TimeCreate, TimeUpdate) "
							+ "Values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, now(), now());");
			st.setString(1, objUser.getUsername());
			st.setString(2, objUser.getUserPassword());
			st.setString(3, objUser.getFirstName());
			st.setString(4, objUser.getLastName());
			st.setDate(5, objUser.getDOB());
			st.setString(6, objUser.getGender());
			st.setString(7, objUser.getEmailID());
			st.setString(8, objUser.getPhoneNo());
			st.setString(9, objUser.getResidentialAddress());
			st.setString(10, objUser.getCity());
			st.setString(11, objUser.getPincode());
			st.setInt(12, objUser.getUserStatusId());

			return st.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return 0;
	}
	
	public int saveStaffDetails(User objUser) {
		Connection con = null;
		try {
			con = Database.getConnection();
			PreparedStatement st = con.prepareStatement(
					"insert into Staff ( UserName, UserPassword, FirstName, LastName,  DOB, Gender, EmailID, PhoneNo, "
					+ "ResidentialAddress, City, PinCode, WorkLocationId, UserStatusId, TimeCreate, TimeUpdate) "
							+ "Values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, now(), now());");
			st.setString(1, objUser.getUsername());
			st.setString(2, objUser.getUserPassword());
			st.setString(3, objUser.getFirstName());
			st.setString(4, objUser.getLastName());
			st.setDate(5, objUser.getDOB());
			st.setString(6, objUser.getGender());
			st.setString(7, objUser.getEmailID());
			st.setString(8, objUser.getPhoneNo());
			st.setString(9, objUser.getResidentialAddress());
			st.setString(10, objUser.getCity());
			st.setString(11, objUser.getPincode());
			st.setInt(12, objUser.getWorkLocationId());
			st.setInt(13, objUser.getUserStatusId());

			return st.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return 0;
	}
	
	public boolean updateStaffDetails(User objUser) {
		Connection con = null;
		try {
			con = Database.getConnection();
			PreparedStatement st = con.prepareStatement(
					"Update Staff Set FirstName=?, LastName=?,  DOB=?, Gender=?, EmailID=?, WorkLocationId=?, PhoneNo=?, "
					+ "ResidentialAddress=?, City=?, PinCode=?, TimeUpdate=now() where StaffId=?;");
			st.setString(1, objUser.getFirstName());
			st.setString(2, objUser.getLastName());
			st.setDate(3, objUser.getDOB());
			st.setString(4, objUser.getGender());
			st.setString(5, objUser.getEmailID());
			st.setInt(6, objUser.getWorkLocationId());
			st.setString(7, objUser.getPhoneNo());
			st.setString(8, objUser.getResidentialAddress());
			st.setString(9, objUser.getCity());
			st.setString(10, objUser.getPincode());
			st.setInt(11, objUser.getUserId());
			
			//System.out.print(st.toString());
			
			st.executeUpdate();
			st.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return false;
	}

	public boolean updateUserPassword(int userId, int userTypeId, String password) {
		Connection con = null;
		try {
			con = Database.getConnection();
			PreparedStatement st = con.prepareStatement(
					"Update " + userTableName(userTypeId) + " Set UserPassword=?, ResetPasswordKey=null, ResetPasswordKeySetOn=null, TimeUpdate=now() where "
					+ userIdFieldName(userTypeId) + "=?;");
			st.setString(1, password);
			st.setInt(2, userId);
			st.executeUpdate();
			st.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return false;
	}
	
	public int activateUser(int userId, int userTypeId) {
		return changeUserStatus(userId, userTypeId, 1);		
	}
	
	public int blockUser(int userId, int userTypeId) {
		return changeUserStatus(userId, userTypeId, 2);	
	}
	
	public int deleteUser(int userId, int userTypeId) {
		return changeUserStatus(userId, userTypeId, 0); 
	}
	
	private int changeUserStatus(int userId, int userTypeId, int statusId) {
		Connection con = null;
		try {
			con = Database.getConnection();
			// System.out.println("Connection Established");
			PreparedStatement st = con.prepareStatement("Update " + userTableName(userTypeId) + " Set UserStatusId = ?, TimeUpdate = now() where "
					+ userIdFieldName(userTypeId) +"=?;");
			st.setInt(1, statusId);
			st.setInt(2, userId);
			// System.out.println("Before Query:" + st.toString());
			int result = st.executeUpdate();
			st.close();
			return result;
		}
		// System.out.println("After Query");
		catch (Exception e) {
			e.printStackTrace();
		} 
		return 0;
	}
	
	private String userTableName (int userTypeID) {
		String tblName="";
		if (userTypeID==1)
			tblName="Admin";
		else if (userTypeID==2)
			tblName="Staff";
		else if (userTypeID==3)
			tblName="Customers";
		return tblName;
	}
	
	private String userIdFieldName (int userTypeID) {
		String fieldName="";
		if (userTypeID==1)
			fieldName="AdminId";
		else if (userTypeID==2)
			fieldName="StaffId";
		else if (userTypeID==3)
			fieldName="CustomerId";
		return fieldName;
	}
}
