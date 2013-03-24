package edu.ben.cmsc398.model;

public class VehicleSpecs {
	private int vehicleId, octane, cylinders, pistonType, headCC, pistonCC, syntheticOil;
	private float hp, torque, bore, stroke, headGasketThickness, headGasketBore, dutyCycle, bsfc, pistonDeckHeight;
	private float resultCubicInch, resultCompressionRatio, resultFuelInjector;
	public VehicleSpecs(int vehicleId, int octane, int cylinders,
			int pistonType, int headCC, int pistonCC, int syntheticOil, float hp,
			float torque, float bore, float stroke, float headGasketThickness,
			float headGasketBore, float dutyCycle, float bsfc, float pistonDeckHeight, float resultCubicInch, float resultCompressionRatio, float resultFuelInjector) {
		super();
		this.vehicleId = vehicleId;
		this.octane = octane;
		this.cylinders = cylinders;
		this.pistonType = pistonType;
		this.headCC = headCC;
		this.pistonCC = pistonCC;
		this.syntheticOil = syntheticOil;
		this.hp = hp;
		this.torque = torque;
		this.bore = bore;
		this.stroke = stroke;
		this.headGasketThickness = headGasketThickness;
		this.headGasketBore = headGasketBore;
		this.dutyCycle = dutyCycle;
		this.bsfc = bsfc;
		this.pistonDeckHeight = pistonDeckHeight;
		this.resultCubicInch = resultCubicInch;
		this.resultCompressionRatio = resultCompressionRatio;
		this.resultFuelInjector = resultFuelInjector;
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
	public int getPistonCC() {
		return pistonCC;
	}
	public void setPistonCC(int pistonCC) {
		this.pistonCC = pistonCC;
	}
	public int getSyntheticOil() {
		return syntheticOil;
	}
	public void setSyntheticOil(int syntheticOil) {
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
	public float getDutyCycle() {
		return dutyCycle;
	}
	public void setDutyCycle(float dutyCycle) {
		this.dutyCycle = dutyCycle;
	}
	public float getBsfc() {
		return bsfc;
	}
	public void setBsfc(float bsfc) {
		this.bsfc = bsfc;
	}
	public float getPistonDeckHeight() {
		return pistonDeckHeight;
	}
	public void setPistonDeckHeight(float pistonDeckHeight) {
		this.pistonDeckHeight = pistonDeckHeight;
	}
	public float getResultCubicInch() {
		return resultCubicInch;
	}
	public void setResultCubicInch(float resultCubicInch) {
		this.resultCubicInch = resultCubicInch;
	}
	public float getResultCompressionRatio() {
		return resultCompressionRatio;
	}
	public void setResultCompressionRatio(float resultCompressionRatio) {
		this.resultCompressionRatio = resultCompressionRatio;
	}
	public float getResultFuelInjector() {
		return resultFuelInjector;
	}
	public void setResultFuelInjector(float resultFuelInjector) {
		this.resultFuelInjector = resultFuelInjector;
	}
	@Override
	public String toString() {
		return "VehicleSpecs [vehicleId=" + vehicleId + ", octane=" + octane
				+ ", cylinders=" + cylinders + ", pistonType=" + pistonType
				+ ", headCC=" + headCC + ", pistonCC=" + pistonCC
				+ ", syntheticOil=" + syntheticOil + ", hp=" + hp + ", torque="
				+ torque + ", bore=" + bore + ", stroke=" + stroke
				+ ", headGasketThickness=" + headGasketThickness
				+ ", headGasketBore=" + headGasketBore + ", dutyCycle="
				+ dutyCycle + ", bsfc=" + bsfc + ", pistonDeckHeight="
				+ pistonDeckHeight + ", resultCubicInch=" + resultCubicInch
				+ ", resultCompressionRatio=" + resultCompressionRatio
				+ ", resultFuelInjector=" + resultFuelInjector + "]";
	}
	

}
