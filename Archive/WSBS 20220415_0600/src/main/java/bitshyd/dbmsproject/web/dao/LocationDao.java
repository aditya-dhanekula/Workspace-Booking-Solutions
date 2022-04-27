package bitshyd.dbmsproject.web.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bitshyd.dbmsproject.web.model.Location;

public class LocationDao {
	
	public Location getLocation(int LocationId) {
		Connection con = null;
		Location loc= null;
		try {
			con = Database.getConnection();
			// System.out.println("Connection Established");
			PreparedStatement st = con.prepareStatement(
					"Select PL.LocationID, PL.LocationName, PL.BigWorkSpaces, PL.SmallWorkSpaces, PL.LocationStatusID, SM.StatusName as LocationStatus "
					+ "from Locations PL inner join StatusMaster SM on SM.StatusId = PL.LocationStatusID where PL.LocationStatusID > 0 AND PL.LocationID = ?");
			st.setInt(1, LocationId);
			// System.out.println(st.toString());
			// System.out.println("Before Query:" + st.toString());
			
			ResultSet rs = st.executeQuery();
			// System.out.println("After Query");
			if (rs.next()) {
				loc = getLocation(rs);
			}
			rs.close();
			return loc;
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}
	
	public ArrayList<Location> getAllActiveLocations(){
		return getAllLocations("1");
	}
	
	public ArrayList<Location> getAllLocations() {
		return getAllLocations("1, 2");	
	}
	private ArrayList<Location> getAllLocations(String StatusList ) {
		Connection con = null;
		try {
			con = Database.getConnection();
			// System.out.println("Connection Established");
			PreparedStatement st = con.prepareStatement(
					"Select PL.LocationID, PL.LocationName, PL.BigWorkSpaces, PL.SmallWorkSpaces, "
					+ "PL.LocationStatusID, SM.StatusName as LocationStatus from Locations PL "
					+ "inner join StatusMaster SM on SM.StatusId = PL.LocationStatusID where PL.LocationStatusID IN "
					+ "(" + StatusList + ")");
			// System.out.println(st.toString());
			// System.out.println("Before Query:" + st.toString());
			ResultSet rs = st.executeQuery();
			// System.out.println("After Query");
			ArrayList<Location> arrLocations = new ArrayList<Location>();
			while (rs.next()) {
				Location loc = getLocation(rs);
				arrLocations.add(loc);
			}
			rs.close();
			return arrLocations;
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}
	
	private Location getLocation(ResultSet rs) throws SQLException
	{
		Location pl= new Location();
		pl.setLocationID(rs.getInt("LocationID"));
		pl.setLocationName(rs.getString("LocationName"));
		pl.setBigWorkSpaces(rs.getInt("BigWorkSpaces"));
		pl.setSmallWorkSpaces(rs.getInt("SmallWorkSpaces"));
		pl.setLocationStatusID(rs.getInt("LocationStatusID"));
		pl.setLocationStatus(rs.getString("LocationStatus"));
		return pl;
	}
	
	public void add(Location loc) {
		int newId;
		Connection con = null;
		try {
			con = Database.getConnection();
			// System.out.println("Connection Established");
			PreparedStatement st = con.prepareStatement(
					"Insert into Locations (LocationName, BigWorkSpaces, SmallWorkSpaces, LocationStatusID, TimeCreate, TimeUpdate) "
					+ " Values (?, ?, ?, 1, Now(), Now())", java.sql.Statement.RETURN_GENERATED_KEYS);
			st.setString(1, loc.getLocationName());
			st.setInt(2, loc.getBigWorkSpaces());
			st.setInt(3, loc.getSmallWorkSpaces());

			// System.out.println(st.toString());
			// System.out.println("Before Query:" + st.toString());
			st.executeUpdate();
			
			//Getting newly created Location Id
			ResultSet rs= st.getGeneratedKeys();
			rs.next();
			newId = rs.getInt(1);
			loc.setLocationID(newId);
			rs.close();
			st.close();
			//Revise the WorkSpace lots based on given Big Spaces and Small spaces
			resetWorkSpaces(loc);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	private int resetWorkSpaces(Location loc){
		int result;
		Connection con = null;
		try {
			con = Database.getConnection();
			// System.out.println("Connection Established");
			
			//remove Big WorkSpace spaces more than specified if exist
			PreparedStatement st = con.prepareStatement(
					"Update WorkSpaces set WorkSpaceStatusID=0, TimeUpdate= NOW() WHERE LocationId=? AND WorkSpaceStatusID > 0 AND WorkSpaceSizeId='BIG' AND WorkSpaceNumber>?;");
			st.setInt(1, loc.getLocationID());
			st.setInt(2, loc.getBigWorkSpaces());
			result = st.executeUpdate();
			st.close();
			// System.out.println(st.toString());
			// System.out.println("Before Query:" + st.toString());

			//remove Small WorkSpace spaces more than specified if exist
			st = con.prepareStatement(
					"Update WorkSpaces set WorkSpaceStatusID=0, TimeUpdate= NOW() WHERE LocationId=? AND WorkSpaceStatusID > 0 AND WorkSpaceSizeId='Small' AND WorkSpaceNumber>?;");
			
			st.setInt(1, loc.getLocationID());
			st.setInt(2, loc.getSmallWorkSpaces());
			result = st.executeUpdate();
			st.close();
			// System.out.println(st.toString());
			// System.out.println("Before Query:" + st.toString());
			
			st = con.prepareStatement("Select WorkSpaceSizeId, Max(WorkSpaceNumber) AS MaxSpaceNumber from WorkSpaces where LocationId = ? AND WorkSpaceStatusID > 0 "
					+ "Group by WorkSpaceSizeId Order by WorkSpaceSizeId;"); 
			st.setInt(1, loc.getLocationID());
			ResultSet rs = st.executeQuery();
			int maxBigSpaceNumber = 0, maxSmallSpaceNumber = 0;
			while (rs.next()) {
				if(rs.getString("WorkSpaceSizeId").equalsIgnoreCase("Big")) {
					maxBigSpaceNumber = rs.getInt("maxSpaceNumber");
				}
				else {
					maxSmallSpaceNumber = rs.getInt("maxSpaceNumber");
				}
			}
			rs.close();
			st.close();
			//if given spaces are more than available spaces, creating additional spaces;  
			if (maxBigSpaceNumber< loc.getBigWorkSpaces() || maxSmallSpaceNumber < loc.getSmallWorkSpaces()) {
				StringBuffer Str = new StringBuffer();
				Str.append("Insert into WorkSpaces (LocationId, WorkSpaceSizeId, WorkSpaceNumber, WorkSpaceName, WorkSpaceStatusId, TimeCreate, TimeUpdate) Values ");
				//Preparing query to insert additional BIG Spaces
				for (int ctr=maxBigSpaceNumber+1; ctr <= loc.getBigWorkSpaces();ctr++) {
					Str.append("(");
					Str.append(loc.getLocationID());
					Str.append(", 'Big', ");
					Str.append(ctr);
					Str.append(", 'B" + ctr);
					Str.append("', 1, Now(), Now()),");
				}
				
				//Preparing query to insert additional SMALL Spaces
				for (int ctr=maxSmallSpaceNumber+1; ctr <= loc.getSmallWorkSpaces();ctr++) {
					Str.append("(");
					Str.append(loc.getLocationID());
					Str.append(", 'Small', ");
					Str.append(ctr);
					Str.append(", 'S" + ctr);
					Str.append("', 1, Now(), Now()),");
				}
				
				Str.deleteCharAt(Str.length()-1);
				st= con.prepareStatement(Str.toString());	
				 //System.out.println("Before Query:" + st.toString());
				result = st.executeUpdate();
				st.close();
			}			
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return 0;
	}
	
	public int update(Location loc) {
		int result;
		Connection con = null;
		try {
			con = Database.getConnection();
			PreparedStatement st = con.prepareStatement(
					"Update Locations set LocationName=?, BigWorkSpaces=?, SmallWorkSpaces=?, TimeUpdate= Now() where LocationID = ?");
			st.setString(1, loc.getLocationName());
			st.setInt(2, loc.getBigWorkSpaces());
			st.setInt(3, loc.getSmallWorkSpaces());
			st.setInt(4, loc.getLocationID());

			// System.out.println(st.toString());
			// System.out.println("Before Query:" + st.toString());
			result = st.executeUpdate();
			st.close();
			
			resetWorkSpaces(loc);
			return result;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int delete(int locationId) {
		return changeLocationStatus(locationId, 0);
	}
	
	public int activate(int locationId) {
		return changeLocationStatus(locationId, 1);
	}

	public int block(int locationId) {

		return changeLocationStatus(locationId, 2);
	}
	
	private int changeLocationStatus(int LocationId, int status) {
		Connection con = null;
		try {
			con = Database.getConnection();
			// System.out.println("Connection Established");
			PreparedStatement st = con.prepareStatement("Update WorkSpacelocations Set LocationStatusID = ?, TimeUpdate = now() where LocationID=?;");
			st.setInt(1, status);
			st.setInt(2, LocationId);
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
	
}
