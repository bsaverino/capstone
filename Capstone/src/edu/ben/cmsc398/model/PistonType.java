package edu.ben.cmsc398.model;

public class PistonType {
	int pistonId, pistonValue;
	String pistonType;
	public PistonType(int pistonId, int pistonValue, String pistonType) {
		super();
		this.pistonId = pistonId;
		this.pistonValue = pistonValue;
		this.pistonType = pistonType;
	}
	public int getPistonId() {
		return pistonId;
	}
	public int getPistonValue() {
		return pistonValue;
	}
	public String getPistonType() {
		return pistonType;
	}
	@Override
	public String toString() {
		return "PistonType [pistonId=" + pistonId + ", pistonValue="
				+ pistonValue + ", pistonType=" + pistonType + "]";
	}
	
	

}
