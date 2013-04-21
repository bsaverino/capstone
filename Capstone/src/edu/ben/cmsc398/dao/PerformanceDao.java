package edu.ben.cmsc398.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;

import edu.ben.cmsc398.model.Maintenance;
import edu.ben.cmsc398.model.Modification;
import edu.ben.cmsc398.model.RaceTime;
import edu.ben.cmsc398.model.RaceType;

public class PerformanceDao extends DBConnector {

	public void getPerformanceRec() {

	}

	public ArrayList<RaceTime> getRaceTimeById(int userId, int vehicleId)
			throws SQLException {
		Connection conn = getConnection();
		String sql = "SELECT p.race_type_id, p.speed, p.time, p.date, p.distance_time, p.performance_id, r.race_type "
				+ "FROM performance p, race_type_lookup r "
				+ "WHERE p.race_type_id = r.race_type_id AND p.user_id = "
				+ userId + " AND p.vehicle_id = " + vehicleId + ";";
		ArrayList<RaceTime> times = new ArrayList<RaceTime>();

		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		if (rs != null) {
			while (rs.next()) {
				float time = rs.getFloat("p.time");
				float distanceTime = rs.getFloat("p.distance_time");
				String date = rs.getString("p.date");
				int raceTypeId = rs.getInt("p.race_type_id");
				int speed = rs.getInt("p.speed");
				int raceId = rs.getInt("p.performance_id");
				String raceType = rs.getString("r.race_type");

				RaceTime r = new RaceTime(raceId, raceTypeId, speed, date,
						raceType, time, distanceTime);

				times.add(r);

			}
			closeConnection();
			return times;
		}
		closeConnection();
		return null;

	}

	public RaceTime getSingleRaceTime(int raceId) throws SQLException {
		Connection conn = getConnection();
		String sql = "SELECT p.race_type_id, p.speed, p.time, p.date, p.distance_time, r.race_type "
				+ "FROM performance p, race_type_lookup r "
				+ "WHERE p.race_type_id = r.race_type_id AND p.performance_id = "
				+ raceId + ";";
		RaceTime times = null;

		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		if (rs != null) {
			while (rs.next()) {
				float time = rs.getFloat("p.time");
				float distanceTime = rs.getFloat("p.distance_time");
				String date = rs.getString("p.date");
				int raceTypeId = rs.getInt("p.race_type_id");
				int speed = rs.getInt("p.speed");
				String raceType = rs.getString("r.race_type");

				times = new RaceTime(raceId, raceTypeId, speed, date, raceType,
						time, distanceTime);

			}
			closeConnection();
			return times;
		}
		closeConnection();
		return null;

	}

	public ArrayList<Modification> getModificationById(int userId, int vehicleId)
			throws SQLException {
		Connection conn = getConnection();
		String sql = "SELECT m.brand, m.part, m.price, m.mod_id, m.mod_lookup_id, l.modification "
				+ "FROM modification m, modification_lookup l "
				+ "WHERE m.user_id = "
				+ userId
				+ " AND m.vehicle_id = "
				+ vehicleId + " AND m.mod_lookup_id = l.mod_id;";
		ArrayList<Modification> mods = new ArrayList<Modification>();

		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		if (rs != null) {
			while (rs.next()) {
				int modificationId = rs.getInt("m.mod_id");
				int modLookupId = rs.getInt("mod_lookup_id");
				String brand = rs.getString("m.brand");
				String part = rs.getString("m.part");
				String modType = rs.getString("l.modification");
				float price = rs.getFloat("m.price");

				Modification m = new Modification(modificationId, modLookupId,
						brand, part, modType, price);

				mods.add(m);
			}
			closeConnection();
			return mods;
		}
		closeConnection();
		return null;

	}

	public Modification getSingleModification(int modId) throws SQLException {
		Connection conn = getConnection();
		String sql = "SELECT m.brand, m.part, m.price, m.mod_id, m.mod_lookup_id, l.modification "
				+ "FROM modification m, modification_lookup l "
				+ "WHERE m.mod_id = " + modId + ";";
		Modification mods = null;

		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		if (rs != null) {
			while (rs.next()) {
				int modificationId = rs.getInt("m.mod_id");
				int modLookupId = rs.getInt("mod_lookup_id");
				String brand = rs.getString("m.brand");
				String part = rs.getString("m.part");
				String modType = rs.getString("l.modification");
				float price = rs.getFloat("m.price");

				mods = new Modification(modificationId, modLookupId, brand,
						part, modType, price);

			}
			closeConnection();
			return mods;
		}
		closeConnection();
		return null;

	}

	public void insertRaceTime(RaceTime r) throws SQLException {
		Connection conn = getConnection();
		String sql = "insert into performance (performance_id, user_id, vehicle_id, race_type_id, speed, date, time, distance_time) values (?,?,?,?,?,?,?,?);";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = null;

		ps.setInt(1, r.getRaceId());
		ps.setInt(2, r.getUserId());
		ps.setInt(3, r.getVehicleId());
		ps.setInt(4, r.getRaceTypeId());
		ps.setInt(5, r.getSpeed());
		ps.setString(6, r.getDate());
		ps.setFloat(7, r.getTime());
		ps.setFloat(8, r.getDistanceTime());

		ps.execute();
		closeConnection();

	}
	
	public void updateRaceTime(RaceTime r) throws SQLException {
		Connection conn = getConnection();
		String sql = "update performance set race_type_id = '" + r.getRaceTypeId()
				+ "', speed = '" + r.getSpeed() + "', date = '"
				+ r.getDate() + "', time = '" + r.getTime() + "', distance_time = '" + r.getDistanceTime()
				+ "' where performance_id = " + r.getRaceId() + ";";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.executeUpdate();
		closeConnection();

	}

	public void insertModification(Modification m) throws SQLException {
		Connection conn = getConnection();
		String sql = "insert into modification (mod_id, vehicle_id, user_id, brand, part, mod_lookup_id, price) values (?,?,?,?,?,?,?);";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = null;

		ps.setInt(1, m.getModificationId());
		ps.setInt(2, m.getVehicleId());
		ps.setInt(3, m.getUserId());
		ps.setString(4, m.getBrand());
		ps.setString(5, m.getPart());
		ps.setInt(6, m.getModLookupId());
		ps.setFloat(7, m.getPrice());

		ps.execute();
		closeConnection();

	}

	public void updateModification(Modification m) throws SQLException {
		Connection conn = getConnection();
		String sql = "update modification set brand = '" + m.getBrand()
				+ "', part = '" + m.getPart() + "', mod_lookup_id = '"
				+ m.getModLookupId() + "', price = '" + m.getPrice()
				+ "' where mod_id = " + m.getModificationId() + ";";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.executeUpdate();
		closeConnection();

	}

	public void deleteSingleModification(int modId) throws SQLException {
		Connection conn = getConnection();
		String sql = "DELETE FROM modification WHERE maintenance_id = " + modId
				+ ";";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.executeUpdate();
		closeConnection();

	}

	public void deleteSingleRaceTime(int timeId) throws SQLException {
		Connection conn = getConnection();
		String sql = "DELETE FROM performance WHERE maintenance_id = " + timeId
				+ ";";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.executeUpdate();
		closeConnection();

	}

	public ArrayList<RaceType> getRaceType() throws SQLException {
		Connection conn = getConnection();
		String sql = "SELECT * from race_type_lookup;";
		ArrayList<RaceType> list = new ArrayList<RaceType>();

		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		if (rs != null) {
			while (rs.next()) {
				int raceId = rs.getInt("race_type_id");
				String race = rs.getString("race_type");

				RaceType r = new RaceType(raceId, race);

				list.add(r);

			}
			closeConnection();
			return list;
		}
		closeConnection();
		return null;
	}

}
