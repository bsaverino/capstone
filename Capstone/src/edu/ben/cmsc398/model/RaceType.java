package edu.ben.cmsc398.model;

public class RaceType {
	int raceId;
	String raceType;
	public RaceType(int raceId, String raceType) {
		super();
		this.raceId = raceId;
		this.raceType = raceType;
	}
	public int getRaceId() {
		return raceId;
	}
	public String getRaceType() {
		return raceType;
	}
	@Override
	public String toString() {
		return "RaceType [raceId=" + raceId + ", raceType=" + raceType + "]";
	}
	
	

}
