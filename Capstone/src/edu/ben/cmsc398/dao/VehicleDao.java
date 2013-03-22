package edu.ben.cmsc398.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;

import edu.ben.cmsc398.model.*;

public class VehicleDao extends DBConnector {

	public void addVehicle(Vehicle vehicle) throws SQLException {
		String make = vehicle.getMake();
		String model = vehicle.getModel();
		String trim = vehicle.getTrim();
		String trans = vehicle.getTrans();
		int engine = vehicle.getEngine();
		String color = vehicle.getColor();
		int year = vehicle.getYear();
		int userId = vehicle.getUserId();

		String sql = "insert into vehicle (user_id, year, make, model, trim, trans, engine_size, color) values ("
				+ userId
				+ ","
				+ year
				+ ",'"
				+ make
				+ "','"
				+ model
				+ "','"
				+ trim + "','" + trans + "'," + engine + ",'" + color + "');";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.executeUpdate();
	}

	public void updateVehicle(Vehicle vehicle) throws SQLException {
		int userId = vehicle.getUserId();
		String make = vehicle.getMake();
		String model = vehicle.getModel();
		String trim = vehicle.getTrim();
		String trans = vehicle.getTrans();
		int engine = vehicle.getEngine();
		String color = vehicle.getColor();
		int year = vehicle.getYear();
		int vehicleId = vehicle.getVehicleId();

		String sql = "update vehicle set userId =" + userId + ",make='" + make
				+ "', model='" + model + "', trim='" + trim + "', trans="
				+ trans + ",engine=" + engine + ",color='" + color + "',year="
				+ year + " where vehicleId='" + vehicleId + "';";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.executeUpdate();
	}

	public void deleteVehicle(int vehicleID) throws SQLException {
		String sql = "Delete from vehicle where vehicleID=" + vehicleID + ";";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.executeUpdate();
	}

	public int getNewVehicleId() throws SQLException {
		String sql = "select Max(vehicle_id) as vehicle_id from vehicle;";
		int vehicleId = 0;
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		if (rs != null) {
			while (rs.next()) {
				vehicleId = rs.getInt("vehicle_id");
			}
		}
		return vehicleId + 1;
	}

	public ArrayList<Vehicle> getAllVehicleByUser(int userId) throws SQLException {
		String sql = "select * from vehicle where user_id='" + userId + "';";
		Vehicle vehicle = null;
		ArrayList<Vehicle> vehicleList = new ArrayList<Vehicle>();
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		if (rs != null) {
			while (rs.next()) {
				String make = rs.getString("make");
				String model = rs.getString("model");
				String trim = rs.getString("trim");
				String trans = rs.getString("trans");
				int engine = rs.getInt("engine_size");
				String color = rs.getString("color");
				int year = rs.getInt("year");
				int vehicleId = rs.getInt("vehicle_id");
				vehicle = new Vehicle(make, model, trim, trans, engine, color,
						year, vehicleId, userId);
				vehicleList.add(vehicle);
			}
		}
		return vehicleList;
	}
	
	public int getVehiclesCount(int userId) {
		String sql = "SELECT COUNT(*) FROM vehicle WHERE user_id='" + userId + "';";
		try {
		PreparedStatement ps;
		ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		ResultSetMetaData rsMetaData = rs.getMetaData();
		int count = rsMetaData.getColumnCount();
		return count;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
		
	}
}
