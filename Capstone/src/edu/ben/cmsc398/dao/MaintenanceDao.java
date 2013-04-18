package edu.ben.cmsc398.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import java.sql.Connection;

import edu.ben.cmsc398.model.Maintenance;
import edu.ben.cmsc398.model.Services;

public class MaintenanceDao extends DBConnector {

	public void getMaintenanceRec() {

	}

	public ArrayList<Maintenance> getMaintenanceByUser(int userId, int vehicleId)
			throws SQLException {
		Connection conn = getConnection();
		String sql = "Select m.maintenance_id, m.mileage, s.service, s.service_id, s.service_discription, m.date "
				+ "FROM maintenance m, service_lookup s WHERE user_id = "
				+ userId
				+ " AND vehicle_id = "
				+ vehicleId
				+ " AND m.service_id = s.service_id;";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<Maintenance> records = new ArrayList<Maintenance>();

		if (rs != null) {
			while (rs.next()) {
				int serviceId = rs.getInt("s.service_id");
				int maintenance = rs.getInt("m.maintenance_id");
				float mileage = rs.getFloat("m.mileage");
				String service = rs.getString("s.service");
				String discription = rs.getString("s.service_discription");
				String date = rs.getString("m.date");

				Maintenance m = new Maintenance(maintenance, mileage,
						serviceId, service, discription, date);
				records.add(m);

			}
			return records;
		}
		conn.close();
		return null;
		
		
		
	}

	public ArrayList<Services> getServices() throws SQLException {
		Connection conn = getConnection();
		String sql = "SELECT * FROM service_lookup";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<Services> services = new ArrayList<Services>();

		if (rs != null) {
			while (rs.next()) {
				int serviceId = rs.getInt("service_id");
				String service = rs.getString("service");

				Services s = new Services(serviceId, service);

				services.add(s);
			}
			return services;
		}
		conn.close();
		return null;

	}

	public Maintenance getSingleMaintenance(int id) throws SQLException {
		Connection conn = getConnection();
		String sql = "Select m.maintenance_id, m.mileage, m.service_id, s.service, s.service_discription, m.date " +
				"FROM maintenance m, service_lookup s " +
				"WHERE m.maintenance_id = " + id + " AND m.service_id = s.service_id;";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		if (rs != null) {
			while (rs.next()) {
				int serviceId = rs.getInt("m.service_id");
				int maintenance = rs.getInt("m.maintenance_id");
				float mileage = rs.getFloat("m.mileage");
				String service = rs.getString("s.service");
				String discription = rs.getString("s.service_discription");
				String date = rs.getString("m.date");
				System.out.println(serviceId);
				Maintenance m = new Maintenance(maintenance, mileage,
						serviceId, service, discription, date);
				System.out.println(m);
				return m;
			}
		}
		conn.close();
		return null;

	}

	public void insertMaintenance(Maintenance m) throws SQLException {
		Connection conn = getConnection();
		String sql = "insert into maintenance (vehicle_id, user_id, date, mileage, service_id) values (?,?,?,?,?);";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = null;

		ps.setString(3, m.getDate());
		ps.setFloat(4, m.getMileage());
		ps.setInt(5, m.getServiceId());
		ps.setInt(2, m.getUserId());
		ps.setInt(1, m.getVehicleId());

		ps.execute();
		
		conn.close();

	}
	
	public void updateMaintenance(Maintenance m) throws SQLException {
		Connection conn = getConnection();
		String sql = "update maintenance set vehicle_id = '" + m.getVehicleId()
				+ "', user_id = '" + m.getUserId() + "', date = '"
				+ m.getDate() + "', mileage = '" + m.getMileage()
				+ "', service_id = '" + m.getServiceId() + "' where maintenance_id = " + m.getMaintenanceId() + ";";

		PreparedStatement ps = conn.prepareStatement(sql);
		ps.executeUpdate();
		conn.close();
	}
	
	public void deleteMaintenanceRecord(int id) throws SQLException {
		Connection conn = getConnection();
		String sql ="DELETE FROM maintenance WHERE maintenance_id = " + id + ";";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.executeUpdate();
		conn.close();
	}

}
