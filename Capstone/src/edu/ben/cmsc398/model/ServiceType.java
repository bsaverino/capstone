package edu.ben.cmsc398.model;

public class ServiceType {
	int serviceId, vehicleId, mileage, maintenanceId;

	public ServiceType(int serviceId, int vehicleId, int mileage,
			int maintenanceId) {
		super();
		this.serviceId = serviceId;
		this.vehicleId = vehicleId;
		this.mileage = mileage;
		this.maintenanceId = maintenanceId;
	}

	public int getMaintenanceId() {
		return maintenanceId;
	}

	public void setMaintenanceId(int maintenanceId) {
		this.maintenanceId = maintenanceId;
	}

	public int getServiceId() {
		return serviceId;
	}

	public int getVehicleId() {
		return vehicleId;
	}

	public int getMileage() {
		return mileage;
	}

	@Override
	public String toString() {
		return "ServiceType [serviceId=" + serviceId + ", vehicleId="
				+ vehicleId + ", mileage=" + mileage + ", maintenanceId="
				+ maintenanceId + "]";
	}
	
	

}
