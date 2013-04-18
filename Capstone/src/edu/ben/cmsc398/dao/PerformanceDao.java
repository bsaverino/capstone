package edu.ben.cmsc398.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import edu.ben.cmsc398.model.RaceType;

public class PerformanceDao extends DBConnector {
	
	public void getPerformanceRec() {
		
	}
	
	public ArrayList<RaceType> getRaceTimeById(int Id) {
		Connection conn = getConnection();
		String sql = "SELECT "
		
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
