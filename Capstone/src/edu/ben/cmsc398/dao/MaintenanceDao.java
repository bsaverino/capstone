package edu.ben.cmsc398.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import edu.ben.cmsc398.model.Maintenance;

public class MaintenanceDao extends DBConnector {

	public void getMaintenanceRec() {

	}

	public ArrayList<Maintenance> getMaintenanceByUser(int userId, int vehicleId)
			throws SQLException {
		String sql = "Select m.maintenance_id, m.mileage, s.service, s.service_discription, m.date " +
				"FROM maintenance m, service_lookup s WHERE user_id = "
				+ userId
				+ " AND vehicle_id = "
				+ vehicleId
				+ " AND m.service_id = s.service_id;";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<Maintenance> records = new ArrayList<Maintenance>();

		if (rs != null) {
			while (rs.next()) {
				int maintenance = rs.getInt("m.maintenance_id");
				int mileage = rs.getInt("m.mileage");
				String service = rs.getString("s.service");
				String discription = rs.getString("s.service_discription");
				String date = rs.getString("m.date");

				Maintenance m = new Maintenance(maintenance, mileage, service,
						discription, date);
				records.add(m);

			}
		}
		return records;
	}
}
