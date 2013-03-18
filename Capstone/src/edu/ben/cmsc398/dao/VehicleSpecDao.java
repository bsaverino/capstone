package edu.ben.cmsc398.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import edu.ben.cmsc398.model.*;

public class VehicleSpecDao extends DBConnector{

	public void getPistonType() {

	}

	public void getFuelType() {

	}

	public void getOilType() {

	}

	public void getRaceType() {

	}
	
	public void getService() {
		
	}

	public void getVehicleYearMakeModel() {

	}
	
	public void getVehicleYear() {

	}

	public void getVehicleMake() {

	}
	
	public void getVehicleModel() {

	}

	public void addVehicleSpecs() {

	}
	
	public VehicleSpecs getVehicleSpec(int vehicleId) throws SQLException {
		String sql = "select * from vehicle_specs where vehicle_id='"+vehicleId+"';";
		VehicleSpecs vehicle = null;
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		if (rs != null) {
			while (rs.next()) {
				int pwrAdder = rs.getInt("bsfc");
				int octane = rs.getInt("fuel_type_id");
				int cylinders = rs.getInt("number_cylinders");
				int pistonType = rs.getInt("piston_type_id");
				int headCC = rs.getInt("head_cc");
				int pistonCC = rs.getInt("piston_cc");
				Boolean syntheticOil = rs.getBoolean("oil_type_id");
				float hp = rs.getFloat("horse_power");
				float torque = rs.getFloat("torque");
				float bore = rs.getFloat("bore");
				float stroke = rs.getFloat("stroke");
				float headGasketThickness = rs.getFloat("piston_deck_height");
				float headGasketBore = rs.getFloat("head_gasket_bore");
				float dutyCycle = rs.getFloat("duty_cycle");
				float bsfc = rs.getFloat("bsfc");
				vehicle = new VehicleSpecs(vehicleId,pwrAdder,octane,cylinders,pistonType,headCC,pistonCC,syntheticOil,hp,torque,bore,stroke,headGasketThickness,headGasketBore,dutyCycle,bsfc);
			}
		}
		return vehicle;
	}
	
	public void updateVehicleSpecs() {

	}

	public void deleteVehicleSpecs() {

	}
}
