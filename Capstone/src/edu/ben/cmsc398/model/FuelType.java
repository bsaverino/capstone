package edu.ben.cmsc398.model;

public class FuelType {
	int fuelId;
	String fuelType;
	public FuelType(int fuelId, String fuelType) {
		super();
		this.fuelId = fuelId;
		this.fuelType = fuelType;
	}
	public int getFuelId() {
		return fuelId;
	}
	public String getFuelType() {
		return fuelType;
	}
	@Override
	public String toString() {
		return "FuelType [fuelId=" + fuelId + ", fuelType=" + fuelType + "]";
	}

}
