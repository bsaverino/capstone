package edu.ben.cmsc398.model;

public class Maintenance {
	private int maintenanceId;
	private float mileage;
	private String service, discription;

	public Maintenance(int maintenanceId,
			float mileage, String service, String discription) {
		super();
		this.maintenanceId = maintenanceId;
		this.mileage = mileage;
		this.service = service;
		this.discription = discription;
	}

	public int getMaintenanceId() {
		return maintenanceId;
	}

	public void setMaintenanceId(int maintenanceId) {
		this.maintenanceId = maintenanceId;
	}

	public float getMileage() {
		return mileage;
	}

	public void setMileage(float mileage) {
		this.mileage = mileage;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getDiscription() {
		return discription;
	}

	public void setDiscription(String discription) {
		this.discription = discription;
	}

	@Override
	public String toString() {
		return "Maintenance [maintenanceId=" + maintenanceId + ", mileage=" + mileage
				+ ", service=" + service + ", discription=" + discription + "]";
	}

}
