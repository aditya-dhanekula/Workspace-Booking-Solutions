package bitshyd.dbmsproject.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bitshyd.dbmsproject.web.model.Service;

public class ServiceDao {
	public ServiceDao() {
		
	}

	public ServiceDao(Service service) {
	}
	
	private void setServiceObject(Service service, ResultSet rs) throws Exception {
		try {
			service.setServiceID(rs.getInt("ServiceID"));
			service.setServiceName(rs.getString("ServiceName"));
			service.setServicePrice(rs.getInt("ServicePrice"));
			service.setUnitType(rs.getString("UnitType"));
			service.setServiceStatusID(rs.getInt("ServiceStatusID"));
			service.setServiceStatus(rs.getString("ServiceStatus"));
			service.setTimeCreate(rs.getDate("TimeCreate"));
			service.setTimeUpdate(rs.getDate("TimeUpdate"));
		} catch (Exception ex) {
			throw (ex);
		}
	}

	public ArrayList<Service> getAllServices() {
		Connection con = null;
		try {
			con = Database.getConnection();
			
			PreparedStatement st = con.prepareStatement(
					"Select s.ServiceID, s.ServiceName, s.ServicePrice, s.UnitType, s.ServiceStatusID, ss.StatusName as ServiceStatus, s.TimeCreate, s.TimeUpdate "
					+ "FROM services as s inner join StatusMaster as ss on ss.StatusId=s.ServiceStatusID where s.ServiceStatusID >0;");
			// System.out.println(st.toString());
			// System.out.println("Before Query:" + st.toString());
			ResultSet rs = st.executeQuery();
			// System.out.println("After Query");
			ArrayList<Service> arrServices = new ArrayList<Service>();
			while (rs.next()) {
				Service objService = new Service();
				setServiceObject(objService, rs);
				arrServices.add(objService);
			}
			rs.close();
			return arrServices;
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}
	
	public Service getServiceDetails(int serviceId) {
		Connection con = null;
		try {
			con = Database.getConnection();
			//System.out.println("Connection Established");
			
			PreparedStatement st = con.prepareStatement(
					"Select s.ServiceID, s.ServiceName, s.ServicePrice, s.UnitType, s.ServiceStatusID, ss.StatusName as ServiceStatus, s.TimeCreate, s.TimeUpdate "
					+ "FROM services as s inner join StatusMaster as ss on ss.StatusId = s.ServiceStatusID where s.ServiceID = ? and s.ServiceStatusID > 0;");
			st.setInt(1, serviceId);
			//System.out.println(st.toString());
			//System.out.println("Before Query:" + st.toString());
			ResultSet rs = st.executeQuery();
			//System.out.println("After Query");
			
			Service objService = new Service();
			//System.out.println("Before setting service object");
			rs.next();
				setServiceObject(objService, rs);
			rs.close();
			//System.out.println("Before returning ObjService");
			return objService;
		} catch (Exception e) {
			e.printStackTrace();
		} 
		//System.out.println("Before return null");
		return null;
	}

	public ArrayList<Service> getAllStaffServices(int UserId) {
		Connection con = null;
		try {
			con = Database.getConnection();
			// System.out.println("Connection Established");
			PreparedStatement st = con.prepareStatement(
					"Select s.ServiceID, s.ServiceName, s.ServicePrice, s.UnitType, s.ServiceStatusID, ss.StatusName as ServiceStatus, s.TimeCreate, s.TimeUpdate "
							+ "FROM services as s inner join StatusMaster as ss on ss.StatusId=s.ServiceStatusID where s.ServiceStatusID " 
							+ "in (select serviceID from Staffservices where StaffID = ?)");
			st.setInt(1, UserId);
			// System.out.println(st.toString());
			// System.out.println("Before Query:" + st.toString());
			ResultSet rs = st.executeQuery();
			// System.out.println("After Query");
			ArrayList<Service> arrServices = new ArrayList<Service>();
			while (rs.next()) {
				Service objService = new Service();
				setServiceObject(objService, rs);
				arrServices.add(objService);
			}
			rs.close();
			return arrServices;
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}
	
	public ArrayList<Service> getAllStaffServicesOfIds(String serviceIds) {
		Connection con = null;
		if (serviceIds.isEmpty())
			return null;
		try {
			con = Database.getConnection();
			// System.out.println("Connection Established");
			PreparedStatement st = con.prepareStatement(
					"Select s.ServiceID, s.ServiceName, s.ServicePrice, s.UnitType, s.ServiceStatusID, ss.StatusName as ServiceStatus, s.TimeCreate, s.TimeUpdate "
							+ "FROM services as s inner join StatusMaster as ss on ss.StatusId=s.ServiceStatusID where s.ServiceStatusID " 
							+ "in (" + serviceIds + ");");
			// System.out.println(st.toString());
			// System.out.println("Before Query:" + st.toString());
			ResultSet rs = st.executeQuery();
			// System.out.println("After Query");
			ArrayList<Service> arrServices = new ArrayList<Service>();
			while (rs.next()) {
				Service objService = new Service();
				setServiceObject(objService, rs);
				arrServices.add(objService);
			}
			rs.close();
			st.close();
			return arrServices;
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}
	
	public ArrayList<Service> getAllActiveServicesWithStaffSelectedStatus(int staffId) {
		Connection con = null;
		try {
			con = Database.getConnection();
			// System.out.println("Connection Established");
			PreparedStatement st = con.prepareStatement(
					"Select SRV.ServiceID, SRV.ServiceName, SRV.ServicePrice,  SRV.UnitType, "
					+ "case when SS.StaffId is null then false else true end AS IsSelected "
					+ "from services SRV left join staffservices SS on Srv.serviceID = SS.serviceID and StaffId=? "
					+ "where SRV.ServiceStatusID = 1 order by ServiceName");
			st.setInt(1, staffId);
			// System.out.println("Before Execute Query:" + st.toString());
			ResultSet rs = st.executeQuery();
			// System.out.println("After Query");
			ArrayList<Service> arrServices = new ArrayList<Service>();
			while (rs.next()) {

				Service objService = new Service();
				objService.setServiceID(rs.getInt("ServiceID"));
				objService.setServiceName(rs.getString("ServiceName"));
				objService.setServicePrice(rs.getInt("ServicePrice"));
				objService.setUnitType(rs.getString("UnitType"));
				objService.setSelected(rs.getBoolean("IsSelected"));
				arrServices.add(objService);
			}
			rs.close();
			return arrServices;
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}
	
	public int addService(Service service) {
		Connection con = null;
		try {
			con = Database.getConnection();
			// System.out.println("Connection Established");
			PreparedStatement st = con.prepareStatement("Insert into services (ServiceName, ServicePrice, UnitType, ServiceStatusID, TimeCreate, TimeUpdate ) "
					+ "Values (?, ?, ?, 1, now(), now());");
			st.setString(1, service.getServiceName());
			st.setInt(2, service.getServicePrice());
			st.setString(3,  service.getUnitType());
			// System.out.println("Before Query:" + st.toString());
			return st.executeUpdate();
			// System.out.println("After Query");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public void saveStaffServices(int staffId, String serviceList) {
		Connection con = null;
		try {
			con = Database.getConnection();
			// System.out.println("Connection Established");
			PreparedStatement st = con.prepareStatement("delete from staffservices where StaffId=? and serviceId not in ("
					+ serviceList + ");");
			st.setInt(1, staffId);
			// System.out.println("Before Execute Delete Query:" + st.toString());
			st.executeUpdate();
			st.close();
			st = con.prepareStatement("insert into staffservices (staffid, serviceId) select ?, serviceId from services where serviceid in ("
					+ serviceList + ") and serviceId not in (Select serviceId from staffservices where staffId=? and ServiceId in ("
							+ serviceList + "));");
			st.setInt(1, staffId);
			st.setInt(2, staffId);
			// System.out.println("Before Execute Add Query:" + st.toString());
			st.executeUpdate();
			st.close();
			// System.out.println("After Query");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public int updateService(Service service) {
		Connection con = null;
		try {
			con = Database.getConnection();
			// System.out.println("Connection Established");
			PreparedStatement st = con.prepareStatement("Update services Set ServiceName = ?, ServicePrice = ?, UnitType = ?, TimeUpdate = now() where ServiceID=?;");
			st.setString(1, service.getServiceName());
			st.setInt(2, service.getServicePrice());
			st.setString(3, service.getUnitType());
			st.setInt(4, service.getServiceID());
			// System.out.println("Before Query:" + st.toString());
			return st.executeUpdate();
			// System.out.println("After Query");
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return 0;
	}
	
	public int deleteService(int serviceId) {
		return changeServicestatus(serviceId, 0);
	}
	
	public int activateService(int serviceId) {
		return changeServicestatus(serviceId, 1);
	}
	
	public int deactivateService(int serviceId) {
		return changeServicestatus(serviceId, 2);
	}
	
	private int changeServicestatus(int serviceId, int status) {
		Connection con = null;
		try {
			con = Database.getConnection();
			// System.out.println("Connection Established");
			PreparedStatement st = con.prepareStatement("Update services Set ServiceStatusID = ?, TimeUpdate = now() where ServiceID=?;");
			st.setInt(1, status);
			st.setInt(2, serviceId);
			// System.out.println("Before Query:" + st.toString());
			return st.executeUpdate();
		}
		// System.out.println("After Query");
		catch (Exception e) {
			e.printStackTrace();
		} 
		return 0;
	}
}
