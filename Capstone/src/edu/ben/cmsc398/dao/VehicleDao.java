package edu.ben.cmsc398.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import edu.ben.cmsc398.dao.*;
import edu.ben.cmsc398.model.*;

public class VehicleDao extends DBConnector{
	
	public void addVehicle(Vehicle vehicle) throws SQLException {
		String make = vehicle.getMake();
		String model = vehicle.getModel();
		String trim = vehicle.getTrim();
		String trans = vehicle.getTrans();
		int engine = vehicle.getEngine();
		String color = vehicle.getColor();
		int year = vehicle.getYear();
		int userId = vehicle.getUserId();
		
		String sql = "insert into vehicle (user_id, year, make, model, trim, trans, engine_size, color) values ("+userId+","+year+",'"+make+"','"+model+"','"+trim+"','"+trans+"',"+engine+",'"+color+"');";		
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
		
		String sql = "update vehicle set userId ="+userId+",make='"+make+"', model='"+model+"', trim='"+trim+"', trans="+trans+",engine="+engine+",color='"+color+"',year="+year+" where vehicleId='"+vehicleId+"';";		
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.executeUpdate();
	}

	public void deleteVehicle(int vehicleID) throws SQLException {
		String sql = "Delete from vehicle where vehicleID="+vehicleID+";";		
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.executeUpdate();
	}

}
