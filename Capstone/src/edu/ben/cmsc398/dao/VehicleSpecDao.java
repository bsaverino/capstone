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
		float pistonDeckHeight = vehicleSpecs.getPistonDeckHeight();
		float resultCubicInch = vehicleSpecs.getResultCubicInch();
		float resultCompressionRatio = vehicleSpecs.getResultCompressionRatio();
		float resultFuelInjector = vehicleSpecs.getResultFuelInjector();

		String sql = "insert into vehicle_specs (vehicle_id, bore, stroke, number_cylinders, piston_deck_height, head_cc, "
				+ "piston_type_id, piston_cc, head_gasket_bore, horse_power, duty_cycle, bsfc, fuel_type_id, oil_type_id, "
				+ "torque, result_ci, result_cr, result_fi, head_gasket_thickness) "
				+ "values ('"
				+ vehicleId
				+ "','"
				+ bore
				+ "','"
				+ stroke
				+ "','"
				+ cylinders
				+ "','"
				+ pistonDeckHeight
				+ "','"
				+ headCC
				+ "','"
				+ pistonType
				+ "','"
				+ pistonCC
				+ "','"
				+ headGasketBore
				+ "','"
				+ hp
				+ "','"
				+ dutyCycle
				+ "','"
				+ bsfc
				+ "','"
				+ octane
				+ "','"
				+ syntheticOil
				+ "','"
				+ torque
				+ "','"
				+ resultCubicInch
				+ "','"
				+ resultCompressionRatio
				+ "','"
				+ resultFuelInjector
				+ "','"
				+ headGasketThickness+ "');";
		System.out.println(sql);
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
				float headGasketThickness = rs.getFloat("head_gasket_thickness");
				float headGasketBore = rs.getFloat("head_gasket_bore");
				float dutyCycle = rs.getFloat("duty_cycle");
				float bsfc = rs.getFloat("bsfc");
				float pistonDeckHeight = rs.getFloat("piston_deck_height");
				float resultCubicInch = rs.getFloat("result_ci");
				float resultCompressionRatio = rs.getFloat("result_cr");
				float resultFuelInjector = rs.getFloat("result_fi");
				vehicle = new VehicleSpecs(vehicleId, octane, cylinders,
						pistonType, headCC, pistonCC, syntheticOil, hp, torque,
						bore, stroke, headGasketThickness, headGasketBore,
						dutyCycle, bsfc, pistonDeckHeight, resultCubicInch, resultCompressionRatio, resultFuelInjector);
			}
		}
		return vehicle;
	}

	public void updateVehicleSpecs(int vehicleID) throws SQLException {
		/*TODO
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.executeUpdate();*/
	}

	public void deleteVehicleSpecs(int vehicleID) throws SQLException {
		String sql = "Delete from vehicle_specs where vehicle_id=" + vehicleID + ";";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.executeUpdate();
	}
	public ArrayList<VehicleSpecs> getAllVehicleSpec()
			throws SQLException {
		String sql = "select * from vehicle_specs;";
		VehicleSpecs vehicle = null;
		ArrayList<VehicleSpecs> vehicleSpecList = new ArrayList<VehicleSpecs>();
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		if (rs != null) {
			while (rs.next()) {
				int vehicleId = rs.getInt("vehicle_id");
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
				float headGasketThickness = rs.getFloat("head_gasket_thickness");
				float headGasketBore = rs.getFloat("head_gasket_bore");
				float dutyCycle = rs.getFloat("duty_cycle");
				float bsfc = rs.getFloat("bsfc");
				float pistonDeckHeight = rs.getFloat("piston_deck_height");
				float resultCubicInch = rs.getFloat("result_ci");
				float resultCompressionRatio = rs.getFloat("result_cr");
				float resultFuelInjector = rs.getFloat("result_fi");
				vehicle = new VehicleSpecs(vehicleId, octane, cylinders,
						pistonType, headCC, pistonCC, syntheticOil, hp, torque,
						bore, stroke, headGasketThickness, headGasketBore,
						dutyCycle, bsfc, pistonDeckHeight, resultCubicInch, resultCompressionRatio, resultFuelInjector);
				vehicleSpecList.add(vehicle);
			}
		}
		return vehicleSpecList;
	}
	public static void main(String []args) throws SQLException{
		VehicleSpecDao v = new VehicleSpecDao();
		ArrayList<VehicleSpecs> test = v.getAllVehicleSpec();
		for(VehicleSpecs a:test)
			System.out.println(a.toString());
		
	}
}
