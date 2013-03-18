package edu.ben.cmsc398.model;

public class Vehicle {
	private String make, model, trim, trans, color;
	private int engine, year, vehicleId, userId;
	public Vehicle(String make, String model, String trim, String trans,
			int engine, String color, int year, int vehicleId, int userId) {
		super();
		this.make = make;
		this.model = model;
		this.trim = trim;
		this.trans = trans;
		this.engine = engine;
		this.color = color;
		this.year = year;
		this.vehicleId = vehicleId;
		this.userId = userId;
	}
	public String getMake() {
		return make;
	}
	public void setMake(String make) {
		this.make = make;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getTrim() {
		return trim;
	}
	public void setTrim(String trim) {
		this.trim = trim;
	}
	public String getTrans() {
		return trans;
	}
	public void setTrans(String trans) {
		this.trans = trans;
	}
	public int getEngine() {
		return engine;
	}
	public void setEngine(int engine) {
		this.engine = engine;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getVehicleId() {
		return vehicleId;
	}
	public void setVehicleId(int vehicleId) {
		this.vehicleId = vehicleId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "Vehicle [make=" + make + ", model=" + model + ", trim=" + trim
				+ ", trans=" + trans + ", engine=" + engine + ", color="
				+ color + ", year=" + year + ", vehicleId=" + vehicleId + "]";
	}
	
	
}