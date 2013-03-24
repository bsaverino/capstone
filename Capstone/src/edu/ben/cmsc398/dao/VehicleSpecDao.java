package edu.ben.cmsc398.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import edu.ben.cmsc398.model.*;

public class VehicleSpecDao extends DBConnector {

	public void getPistonType() {

	}

	public ArrayList<FuelType> getFuelType() {

		try {
			String sql = "SELECT * FROM fuel_lookup;";
			ArrayList<FuelType> fuel = new ArrayList<FuelType>();
			FuelType gas = null;
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					int fuelId = rs.getInt("fuel_type_id");
					String fuelType = rs.getString("fuel_type");
					gas = new FuelType(fuelId, fuelType);
					fuel.add(gas);
				}
				return fuel;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

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

	public void addVehicleSpecs(VehicleSpecs vehicleSpecs) throws SQLException {
		int vehicleId = vehicleSpecs.getVehicleId();
		int octane = vehicleSpecs.getOctane();
		int cylinders = vehicleSpecs.getCylinders();
		int pistonType = vehicleSpecs.getPistonType();
		int headCC = vehicleSpecs.getHeadCC();
		int pistonCC = vehicleSpecs.getPistonCC();
		int syntheticOil = vehicleSpecs.getSyntheticOil();
		float hp = vehicleSpecs.getHp();
		float torque = vehicleSpecs.getTorque();
		float bore = vehicleSpecs.getBore();
		float stroke = vehicleSpecs.getStroke();
		float headGasketThickness = vehicleSpecs.getHeadGasketThickness();
		float headGasketBore = vehicleSpecs.getHeadGasketBore();
		float dutyCycle = vehicleSpecs.getDutyCycle();
		float bsfc = vehicleSpecs.getBsfc();
		int oilType = 2;

		String sql = "insert into vehicle_specs (vehicle_id, bore, stroke, number_cylinders, piston_deck_height, head_cc, piston_type_id, piston_cc, head_gasket_bore, horse_power, duty_cycle, bsfc, fuel_type_id, oil_type_id, torque) values ("
				+ vehicleId
				+ ","
				+ bore
				+ ",'"
				+ stroke
				+ "','"
				+ cylinders
				+ "','"
				+ headGasketThickness
				+ ","
				+ headCC
				+ ",'"
				+ pistonType
				+ "','"
				+ pistonCC
				+ "','"
				+ headGasketBore
				+ "','"
				+ hp
				+ "','"
				+ dutyCycle
				+ "',"
				+ bsfc
				+ ",'"
				+ octane
				+ "','" + oilType + "," + torque + "');";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.executeUpdate();

	}

	public VehicleSpecs getVehicleSpec(int vehicleId) throws SQLException {
		String sql = "select * from vehicle_specs where vehicle_id='"
				+ vehicleId + "';";
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
				int syntheticOil = rs.getInt("oil_type_id");
				float hp = rs.getFloat("horse_power");
				float torque = rs.getFloat("torque");
				float bore = rs.getFloat("bore");
				float stroke = rs.getFloat("stroke");
				float headGasketThickness = rs.getFloat("piston_deck_height");
				float headGasketBore = rs.getFloat("head_gasket_bore");
				float dutyCycle = rs.getFloat("duty_cycle");
				float bsfc = rs.getFloat("bsfc");
				vehicle = new VehicleSpecs(vehicleId, octane, cylinders,
						pistonType, headCC, pistonCC, syntheticOil, hp, torque,
						bore, stroke, headGasketThickness, headGasketBore,
						dutyCycle, bsfc);
			}
		}
		return vehicle;
	}

	public void updateVehicleSpecs() {

	}

	public void deleteVehicleSpecs() {

	}

	public static void main(String[] args) throws SQLException {
		VehicleSpecDao test = new VehicleSpecDao();
		VehicleSpecs v = test.getVehicleSpec(1);
		test.addVehicleSpecs(v);
	}
}
