package edu.ben.cmsc398.model;

public class Modification {
	int modificationId, vehicleId, userId, modLookupId;
	String brand, part, modType;
	float price;
	public Modification(int modificationId, int modLookupId, String brand,
			String part, String modType, float price) {
		super();
		this.modificationId = modificationId;
		this.modLookupId = modLookupId;
		this.brand = brand;
		this.part = part;
		this.modType = modType;
		this.price = price;
	}
	public Modification(int modificationId, int vehicleId, int userId,
			String brand, String part, int modLookupId, float price) {
		super();
		this.modificationId = modificationId;
		this.vehicleId = vehicleId;
		this.userId = userId;
		this.brand = brand;
		this.part = part;
		this.modLookupId = modLookupId;
		this.price = price;
	}
	public int getModificationId() {
		return modificationId;
	}
	public void setModificationId(int modificationId) {
		this.modificationId = modificationId;
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
	public int getModLookupId() {
		return modLookupId;
	}
	public void setModLookupId(int modLookupId) {
		this.modLookupId = modLookupId;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getModType() {
		return modType;
	}
	public void setModType(String modType) {
		this.modType = modType;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "Modification [modificationId=" + modificationId
				+ ", vehicleId=" + vehicleId + ", userId=" + userId
				+ ", modLookupId=" + modLookupId + ", brand=" + brand
				+ ", part=" + part + ", modType=" + modType + ", price="
				+ price + "]";
	}
	
	

}
