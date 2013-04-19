package edu.ben.cmsc398.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;

import edu.ben.cmsc398.model.*;

public class VehicleDao extends DBConnector {

	public int addVehicle(Vehicle vehicle) throws SQLException {
		Connection conn = getConnection();
		String sql = "insert into vehicle (user_id, year, make, model, trim, trans, engine_size, color) values (?,?,?,?,?,?,?,?);";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = null;
		int autoId = -1;

		ps.setString(3, vehicle.getMake());
		ps.setString(4, vehicle.getModel());
		ps.setString(5, vehicle.getTrim());
		ps.setString(6, vehicle.getTrans());
		ps.setInt(7, vehicle.getEngine());
		ps.setString(8, vehicle.getColor());
		ps.setInt(2, vehicle.getYear());
		ps.setInt(1, vehicle.getUserId());

		ps.execute();

		ps = conn.prepareStatement("select last_insert_id()");
		rs = ps.executeQuery();

		if (rs.next()) {
			autoId = rs.getInt(1);
			closeConnection();
			return autoId;
		}
		closeConnection();
		return 0;
	}

	public void updateVehicle(Vehicle vehicle) throws SQLException {
		Connection conn = getConnection();
		int userId = vehicle.getUserId();
		String make = vehicle.getMake();
		String model = vehicle.getModel();
		String trim = vehicle.getTrim();
		String trans = vehicle.getTrans();
		int engine = vehicle.getEngine();
		String color = vehicle.getColor();
		int year = vehicle.getYear();
		int vehicleId = vehicle.getVehicleId();

		String sql = "update vehicle set user_id ='" + userId + "',make='"
				+ make + "', model='" + model + "', trim='" + trim
				+ "', trans='" + trans + "',engine_size='" + engine
				+ "',color='" + color + "',year='" + year
				+ "' where vehicle_id='" + vehicleId + "';";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.executeUpdate();
		closeConnection();
	}

	public void deleteVehicle(int vehicleID) throws SQLException {
		Connection conn = getConnection();
		String sql = "Delete from vehicle where vehicle_id=" + vehicleID + ";";
		System.out.println(sql);
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.executeUpdate();
		closeConnection();
	}

	public int getNewVehicleId() throws SQLException {
		Connection conn = getConnection();
		String sql = "select Max(vehicle_id) as vehicle_id from vehicle;";
		int vehicleId = 0;
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		if (rs != null) {
			while (rs.next()) {
				vehicleId = rs.getInt("vehicle_id");
			}
			closeConnection();
			return vehicleId;
		}
		closeConnection();
		return 0;

	}

	public ArrayList<Vehicle> getAllVehicleByUser(int userId)
			throws SQLException {
		Connection conn = getConnection();
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
			closeConnection();
			return vehicleList;
		}
		closeConnection();
		return null;
	}

	public int getVehiclesCount(int userId) throws SQLException {
		Connection conn = getConnection();
		int count = 0;
		String sql = "SELECT COUNT(*) FROM vehicle WHERE user_id='" + userId
				+ "';";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		ResultSetMetaData rsMetaData = rs.getMetaData();
		count = rsMetaData.getColumnCount();
		closeConnection();
		return count;
	}

	public Vehicle getVehicle(int vehicleId) throws SQLException {
		Connection conn = getConnection();
		String sql = "select * from vehicle where vehicle_id='" + vehicleId
				+ "';";
		Vehicle vehicle = null;
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
				int userId = rs.getInt("user_id");
				vehicle = new Vehicle(make, model, trim, trans, engine, color,
						year, vehicleId, userId);
			}
			closeConnection();
			return vehicle;
		}
		closeConnection();
		return null;
	}

	public int getDefaultVehicleId(int userId) throws SQLException {
		Connection conn = getConnection();
		String sql = "select default_vehicle from user where user_id='"
				+ userId + "';";
		int vehicleId = 0;
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		if (rs != null) {
			while (rs.next()) {

				vehicleId = rs.getInt("default_vehicle");

			}
			closeConnection();
			return vehicleId;
		}
		closeConnection();
		return 0;
	}
}
