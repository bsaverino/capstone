package edu.ben.cmsc398.model;

public class VehicleSpecs {
	private int vehicleId, pwrAdder, octane, cylinders, pistonType, headCC;
	private Boolean syntheticOil;
	private float hp, torque, bore, stroke, headGasketThickness, headGasketBore;
	public VehicleSpecs(int vehicleId, int pwrAdder, int octane, int cylinders,
			int pistonType, int headCC, Boolean syntheticOil, float hp,
			float torque, float bore, float stroke, float headGasketThickness,
			float headGasketBore) {
		super();
		this.vehicleId = vehicleId;
		this.pwrAdder = pwrAdder;
		this.octane = octane;
		this.cylinders = cylinders;
		this.pistonType = pistonType;
		this.headCC = headCC;
		this.syntheticOil = syntheticOil;
		this.hp = hp;
		this.torque = torque;
		this.bore = bore;
		this.stroke = stroke;
		this.headGasketThickness = headGasketThickness;
		this.headGasketBore = headGasketBore;
	}
	public int getPwrAdder() {
		return pwrAdder;
	}
	public void setPwrAdder(int pwrAdder) {
		this.pwrAdder = pwrAdder;
	}
	public int getOctane() {
		return octane;
	}
	public void setOctane(int octane) {
		this.octane = octane;
	}
	public int getCylinders() {
		return cylinders;
	}
	public void setCylinders(int cylinders) {
		this.cylinders = cylinders;
	}
	public int getPistonType() {
		return pistonType;
	}
	public void setPistonType(int pistonType) {
		this.pistonType = pistonType;
	}
	public int getHeadCC() {
		return headCC;
	}
	public void setHeadCC(int headCC) {
		this.headCC = headCC;
	}
	public Boolean getSyntheticOil() {
		return syntheticOil;
	}
	public void setSyntheticOil(Boolean syntheticOil) {
		this.syntheticOil = syntheticOil;
	}
	public float getHp() {
		return hp;
	}
	public void setHp(float hp) {
		this.hp = hp;
	}
	public float getTorque() {
		return torque;
	}
	public void setTorque(float torque) {
		this.torque = torque;
	}
	public float getBore() {
		return bore;
	}
	public void setBore(float bore) {
		this.bore = bore;
	}
	public float getStroke() {
		return stroke;
	}
	public void setStroke(float stroke) {
		this.stroke = stroke;
	}
	public float getHeadGasketThickness() {
		return headGasketThickness;
	}
	public void setHeadGasketThickness(float headGasketThickness) {
		this.headGasketThickness = headGasketThickness;
	}
	public float getHeadGasketBore() {
		return headGasketBore;
	}
	public void setHeadGasketBore(float headGasketBore) {
		this.headGasketBore = headGasketBore;
	}
	public int getVehicleId() {
		return vehicleId;
	}
	@Override
	public String toString() {
		return "VehicleSpecs [vehicleId=" + vehicleId + ", pwrAdder="
				+ pwrAdder + ", octane=" + octane + ", cylinders=" + cylinders
				+ ", pistonType=" + pistonType + ", headCC=" + headCC
				+ ", syntheticOil=" + syntheticOil + ", hp=" + hp + ", torque="
				+ torque + ", bore=" + bore + ", stroke=" + stroke
				+ ", headGasketThickness=" + headGasketThickness
				+ ", headGasketBore=" + headGasketBore + "]";
	}

}