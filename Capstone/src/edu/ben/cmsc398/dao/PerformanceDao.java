package edu.ben.cmsc398.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;

import edu.ben.cmsc398.model.Modification;
import edu.ben.cmsc398.model.RaceTime;
import edu.ben.cmsc398.model.RaceType;

public class PerformanceDao extends DBConnector {
	
	public void getPerformanceRec() {
		
	}
	
	public ArrayList<RaceTime> getRaceTimeById(int userId, int vehicleId) throws SQLException {
		Connection conn = getConnection();
		String sql = "SELECT p.race_type_id, p.speed, p.time, p.date, p.distance_time, p.performance_id, r.race_type " +
				"FROM performance p, race_type_lookup r " +
				"WHERE p.race_type_id = r.race_type_id AND p.user_id = " + userId + " AND p.vehicle_id = " + vehicleId + ";";
		ArrayList<RaceTime> times = new ArrayList<RaceTime>();
		
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		if(rs != null) {
			while(rs.next()) {
				Time time = rs.getTime("p.time");
				Time distanceTime = rs.getTime("p.distance_time");
				Date date = rs.getDate("p.date");
				int raceTypeId = rs.getInt("p.race_type_id");
				int speed = rs.getInt("p.speed");
				int raceId = rs.getInt("p.performance_id");
				String raceType = rs.getString("r.race_type");
				
				RaceTime r = new RaceTime(raceId, raceTypeId, speed, date, raceType, time, distanceTime);
				
				times.add(r);
				
			}
			return times;
		}
		conn.close();
		return null;
		
	}
	
	public ArrayList<Modification> getModificationById(int userId, int vehicleId) throws SQLException{
		Connection conn = getConnection();
		String sql = "SELECT m.brand, m.part, m.price, m.mod_id, m.mod_lookup_id, l.modification " +
				"FROM modification m, modification_lookup l " +
				"WHERE m.user_id = " + userId + " AND m.vehicle_id = " + vehicleId + " AND m.mod_lookup_id = l.mod_id";
		ArrayList<Modification> mods = new ArrayList<Modification>();
		
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		if(rs != null) {
			while(rs.next()) {
				int modificationId = rs.getInt("m.mod_id");
				int modLookupId = rs.getInt("mod_lookup_id");
				String brand = rs.getString("m.brand");
				String part = rs.getString("m.part");
				String modType = rs.getString("l.modification");
				float price = rs.getFloat("m.price");
				
				Modification m = new Modification(modificationId, modLookupId, brand, part, modType, price);
				
				mods.add(m);
			}
			return mods;
		}
		conn.close();
		return null;
		
	}
	
	public ArrayList<RaceType> getRaceType() throws SQLException {
		Connection conn = getConnection();
		String sql = "SELECT * from race_type_lookup;";
		ArrayList<RaceType> list = new ArrayList<RaceType>();
		
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		if(rs != null) {
			while(rs.next()) {
				int raceId = rs.getInt("race_type_id");
				String race = rs.getString("race_type");
				
				RaceType r = new RaceType(raceId, race);
				
				list.add(r);
				
			}
			return list;
		}
		conn.close();
		return null;
	}

}
