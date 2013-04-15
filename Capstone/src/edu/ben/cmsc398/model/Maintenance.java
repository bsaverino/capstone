package edu.ben.cmsc398.model;

public class Maintenance {
	private int maintenanceId, serviceId, vehicleId, userId;
	private float mileage;
	private String service, discription, date;

	public Maintenance(int maintenanceId, float mileage, String service,
			String discription, String date) {
		super();
		this.maintenanceId = maintenanceId;
		this.mileage = mileage;
		this.service = service;
		this.discription = discription;
		this.date = date;
	}

	public Maintenance(int maintenanceId, int serviceId, int vehicleId,
			int userId, float mileage, String date) {
		super();
		this.maintenanceId = maintenanceId;
		this.serviceId = serviceId;
		this.vehicleId = vehicleId;
		this.userId = userId;
		this.mileage = mileage;
		this.date = date;
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

	public int getServiceId() {
		return serviceId;
	}

	public void setServiceId(int serviceId) {
		this.serviceId = serviceId;
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Maintenance [maintenanceId=" + maintenanceId + ", serviceId="
				+ serviceId + ", mileage=" + mileage + ", service=" + service
				+ ", discription=" + discription + ", date=" + date + "]";
	}

}
