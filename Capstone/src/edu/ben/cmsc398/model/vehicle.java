package edu.ben.cmsc398.model;

public class vehicle {
	private int year;
	private String make;
	private String model;
	private String trim;
	private String trans;
	private String engine;
	private String color;
	private int pwrAdder;
	private Boolean syntheticOil;
	private int octane;
	private int cylinders;
	private float hp;
	private float torque;
	private float bore;
	private float stroke;
	private int pistonType;
	private float headGasketThickness;
	private float headGasketBore;
	private int headCC;
	
	public vehicle(int year, String make, String model, String trim,
			String trans, String engine, String color, int pwrAdder,
			Boolean syntheticOil, int octane, int cylinders, float hp,
			float torque, float bore, float stroke, int pistonType,
			float headGasketThickness, float headGasketBore, int headCC) {
		super();
		this.year = year;
		this.make = make;
		this.model = model;
		this.trim = trim;
		this.trans = trans;
		this.engine = engine;
		this.color = color;
		this.pwrAdder = pwrAdder;
		this.syntheticOil = syntheticOil;
		this.octane = octane;
		this.cylinders = cylinders;
		this.hp = hp;
		this.torque = torque;
		this.bore = bore;
		this.stroke = stroke;
		this.pistonType = pistonType;
		this.headGasketThickness = headGasketThickness;
		this.headGasketBore = headGasketBore;
		this.headCC = headCC;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
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

	public String getEngine() {
		return engine;
	}

	public void setEngine(String engine) {
		this.engine = engine;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public int getPwrAdder() {
		return pwrAdder;
	}

	public void setPwrAdder(int pwrAdder) {
		this.pwrAdder = pwrAdder;
	}

	public Boolean getSyntheticOil() {
		return syntheticOil;
	}

	public void setSyntheticOil(Boolean syntheticOil) {
		this.syntheticOil = syntheticOil;
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

	public int getPistonType() {
		return pistonType;
	}

	public void setPistonType(int pistonType) {
		this.pistonType = pistonType;
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

	public int getHeadCC() {
		return headCC;
	}

	public void setHeadCC(int headCC) {
		this.headCC = headCC;
	}
	

}
