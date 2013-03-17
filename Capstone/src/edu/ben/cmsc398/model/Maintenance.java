package edu.ben.cmsc398.model;

public class Maintenance {
	int serviceId, userId, vehicleId, maintenanceId;
	float mileage;
	public Maintenance(int serviceId, int userId, int vehicleId,
			int maintenanceId, float mileage) {
		super();
		this.serviceId = serviceId;
		this.userId = userId;
		this.vehicleId = vehicleId;
		this.maintenanceId = maintenanceId;
		this.mileage = mileage;
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
	public int getServiceId() {
		return serviceId;
	}
	public int getUserId() {
		return userId;
	}
	public int getVehicleId() {
		return vehicleId;
	}
	@Override
	public String toString() {
		return "Maintenance [serviceId=" + serviceId + ", userId=" + userId
				+ ", vehicleId=" + vehicleId + ", maintenanceId="
				+ maintenanceId + ", mileage=" + mileage + "]";
	}
	
}
