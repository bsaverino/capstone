package edu.ben.cmsc398.model;

public class OilType {
	int oilId;
	String oilType;
	public OilType(int oilId, String oilType) {
		super();
		this.oilId = oilId;
		this.oilType = oilType;
	}
	public int getOilId() {
		return oilId;
	}
	public String getOilType() {
		return oilType;
	}
	@Override
	public String toString() {
		return "OilType [oilId=" + oilId + ", oilType=" + oilType + "]";
	}
	
	

}
