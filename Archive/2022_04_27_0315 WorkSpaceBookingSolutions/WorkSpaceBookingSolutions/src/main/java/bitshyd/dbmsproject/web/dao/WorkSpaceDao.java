package bitshyd.dbmsproject.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bitshyd.dbmsproject.web.model.WorkSpace;
import bitshyd.dbmsproject.web.model.User;

public class WorkSpaceDao {
	
	public ArrayList<WorkSpace> getAllWorkSpaces(){
		return getAllWorkSpaces (false, false, 0, 0);
	}
	
	public ArrayList<WorkSpace> getAllActiveWorkSpaces(){
		return getAllWorkSpaces (true, true, 0, 0);
	}
		
	public ArrayList<WorkSpace> getAllWorkSpacesOfLocation(int locationId){
		return getAllWorkSpaces (false, false, locationId, 0);
	}
		
	public ArrayList<WorkSpace> getAllActiveWorkSpacesOfLocation(int locationId){
		return getAllWorkSpaces (true, false, locationId, 0);
	}
	
	public ArrayList<WorkSpace> getAllWorkSpacesOfStaff(int StaffId){
		return getAllWorkSpaces (true, false, 0, StaffId);
	}
	
	public ArrayList<WorkSpace> getAllWorkSpaces(Boolean activeSpacesOnly, Boolean activeLocationsOnly, int locationId, int staffId){
		Connection con = null;
		ArrayList<WorkSpace> psArrayList = new ArrayList<WorkSpace>();
		String strSpaceStatusqry = activeSpacesOnly ? " AND PS.WorkSpaceStatusId=1 ": " AND PS.WorkSpaceStatusId >=1 "; 
		String strLocationStatusqry = activeLocationsOnly ? " AND PL.LocationStatusId = 1": "AND PL.LocationStatusId >= 1"; 
		String strLocationqry = locationId == 0 ? "": " AND PS.LocationId = " +locationId;
		String strStaffqry = staffId == 0 ? "": " AND PS.StaffId = " + staffId;
		try {
			con = Database.getConnection();
			String strQry = "SELECT PS.WorkSpaceID, PS.LocationId, PL.LocationName, PS.WorkSpaceSizeId, WSM.WorkSpacePrice, PS.WorkSpaceNumber, PS.WorkSpaceName, "
					+ "PS.StaffId, PS.WorkSpaceStatusId, SM.StatusName AS WorkSpaceStatus, PS.TimeCreate, PS.TimeUpdate "
					+ "FROM WorkSpaces PS inner join Locations PL on PL.LocationID = PS.LocationID "
					+ "inner join StatusMaster SM on SM.StatusId = PS.WorkSpaceStatusId "
					+ "inner join WorkSpaceSizeMaster WSM on WSM.WorkSpaceSizeId=PS.WorkSpaceSizeId "
					+ "Where 1=1 "
					+ strLocationStatusqry + strSpaceStatusqry + strLocationqry + strStaffqry
					+ " Order BY PL.LocationName;";
			PreparedStatement st = con.prepareStatement(strQry);
			
			//System.out.print("\n " + st.toString());
			ResultSet rs= st.executeQuery();
			while (rs.next()) {
				WorkSpace WorkSpace = setWorkSpaceObject(rs);
				psArrayList.add(WorkSpace);
			}
			
			rs.close();
			st.close();
			return psArrayList; 
		}
		catch(Exception e) {
			
			System.out.println("\n Error From getAllWorkSpaces -" + e);
		}
		return null;
	}
	
	public WorkSpace getWorkSpace(int spaceId){
		Connection con = null;
		try {
			con = Database.getConnection();
			WorkSpace WorkSpace =null;
			String strQry = "SELECT PS.WorkSpaceID, PS.LocationId, PL.LocationName, PS.WorkSpaceSizeId, WSM.WorkSpacePrice, PS.WorkSpaceNumber, PS.WorkSpaceName, "
					+ "PS.StaffId, PS.WorkSpaceStatusId, SM.StatusName AS WorkSpaceStatus, PS.TimeCreate, PS.TimeUpdate "
					+ "FROM WorkSpaces PS inner join Locations PL on PL.LocationID = PS.LocationID "
					+ "inner join StatusMaster SM on SM.StatusId = PS.WorkSpaceStatusId "
					+ "inner join WorkSpaceSizeMaster WSM on WSM.WorkSpaceSizeId=PS.WorkSpaceSizeId "
					+ "Where PS.WorkSpaceID=?;";
				
			PreparedStatement st = con.prepareStatement(strQry);
			st.setInt(1, spaceId);
			//System.out.print("\n " + st.toString());
			ResultSet rs= st.executeQuery();
			if (rs.next()) {
				WorkSpace = setWorkSpaceObject(rs);
			}
			
			rs.close();
			st.close();
			return WorkSpace; 
		}
		catch(Exception e) {
			
			System.out.println("\n Error From getWorkSpace -" + e);
		}
		return null;
	}
	
	private WorkSpace setWorkSpaceObject(ResultSet rs) throws SQLException {
	
		WorkSpace ps = null;
		try {
			ps = new WorkSpace();
			ps.setWorkSpaceID(rs.getInt("WorkSpaceID"));
			ps.setLocationId(rs.getInt("LocationId"));
			ps.setLocationName(rs.getString("LocationName"));
			ps.setWorkSpaceSize(rs.getString("WorkSpaceSizeId"));
			ps.setWorkSpacePrice(rs.getInt("WorkSpacePrice"));
			ps.setWorkSpaceNumber(rs.getInt("WorkSpaceNumber"));
			ps.setWorkSpaceName(rs.getString("WorkSpaceName"));
			if (rs.getInt("StaffId") >0) {
				UserDao objUserDao = new UserDao();
				ps.setStaff(objUserDao.getStaff(rs.getInt("StaffId")));
			}
			ps.setWorkSpaceStatusId(rs.getInt("WorkSpaceStatusId"));
			ps.setWorkSpaceStatus(rs.getString("WorkSpaceStatus"));
			ps.setTimeCreate(rs.getDate("TimeCreate"));
			ps.setTimeUpdate(rs.getDate("TimeUpdate"));
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return ps;
	}
		
	public void updateStaffToWorkSpaces(int staffId, String workSpaceIds)
	{
		Connection con = null;
		try {
			con = Database.getConnection();
			// System.out.println("Connection Established");
			PreparedStatement st = con.prepareStatement("Update WorkSpaces Set StaffId=?, TimeUpdate=now() "
					+ "where WorkSpaceID IN (" + workSpaceIds + ");");
			st.setInt(1, staffId);
			// System.out.println("Before Query:" + st.toString());
			st.executeUpdate();
			st.close();
		}
		// System.out.println("After Query");
		catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	public User getStaffOfWorkSpace(int SpaceId) {
		Connection con = null;
		User staff = null;
		try {
			con = Database.getConnection();
			PreparedStatement st = con.prepareStatement("Select StaffId from WorkSpaces where WorkSpaceID=?;");
			st.setInt(1, SpaceId);
			// System.out.println("Before Query:" + st.toString());
			ResultSet rs= st.executeQuery();
			if (rs.next()) {
				staff= (new UserDao()).getStaff(rs.getInt("StaffId"));
			}
			st.close();
		}
		// System.out.println("After Query");
		catch (Exception e) {
			e.printStackTrace();
		} 
		return staff;
	}
	
	public int activate(int spaceId) {
		return changeSpaceStatus(spaceId, 1);
	}

	public int block(int spaceId) {

		return changeSpaceStatus(spaceId, 2);
	}
	
	private int changeSpaceStatus(int spaceId, int status) {
		Connection con = null;
		try {
			con = Database.getConnection();
			// System.out.println("Connection Established");
			PreparedStatement st = con.prepareStatement("Update WorkSpaces Set WorkSpaceStatusID = ?, TimeUpdate = now() where WorkSpaceID=?;");
			st.setInt(1, status);
			st.setInt(2, spaceId);
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
	
	//Booking Related procedures
	public ArrayList<WorkSpace> getAllBookingAvailable(int locationId, String checkin, String checkout){
		Connection con = null;
		ArrayList<WorkSpace> psArrayList = new ArrayList<WorkSpace>();
		try {
			con = Database.getConnection();
			String strQry = "SELECT PS.WorkSpaceID, PS.LocationId, PL.LocationName, PS.WorkSpaceSizeId, WSM.WorkSpacePrice, PS.WorkSpaceNumber, PS.WorkSpaceName, "
					+ "PS.StaffId, PS.WorkSpaceStatusId, SM.StatusName AS WorkSpaceStatus, PS.TimeCreate, PS.TimeUpdate "
					+ "FROM WorkSpaces PS inner join Locations PL on PL.LocationID = PS.LocationID "
					+ "inner join StatusMaster SM on SM.StatusId = PS.WorkSpaceStatusId "
					+ "inner join WorkSpaceSizeMaster WSM on WSM.WorkSpaceSizeId=PS.WorkSpaceSizeId "
					+ "Where PS.LocationId=? AND PS.StaffId IS NOT NULL AND PS.WorkSpaceStatusId = 1 "
					+ "AND PS.WorkSpaceID NOT IN ( SELECT WorkSpaceID FROM workSpacebookings where BookingstatusId=1 "
					+ "and checkinTime < ? and checkoutTime > ?) "
					+ " Order BY PL.LocationName, PS.WorkSpaceName;";
			PreparedStatement st = con.prepareStatement(strQry);
			st.setInt(1, locationId);
			st.setString(2, checkout);
			st.setString(3, checkin);
			
			//System.out.print("\n " + st.toString());
			ResultSet rs= st.executeQuery();
			while (rs.next()) {
				WorkSpace WorkSpace = setWorkSpaceObject(rs);
				psArrayList.add(WorkSpace);
			}
			
			rs.close();
			st.close();
		}
		catch(Exception e) {
			
			System.out.println("\n Error From getAllWorkSpaces -" + e);
		}
		return psArrayList;
	}
	
	
}
