package edu.ben.cmsc398.model;

import java.sql.Date;

public class Performance {
	int userId, vehicleId, raceTypeId;
	float time;
	Date birthday;
	public Performance(int userId, int vehicleId, int raceTypeId, float time,
			Date birthday) {
		super();
		this.userId = userId;
		this.vehicleId = vehicleId;
		this.raceTypeId = raceTypeId;
		this.time = time;
		this.birthday = birthday;
	}
	public float getTime() {
		return time;
	}
	public void setTime(float time) {
		this.time = time;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public int getUserId() {
		return userId;
	}
	public int getVehicleId() {
		return vehicleId;
	}
	public int getRaceTypeId() {
		return raceTypeId;
	}
	@Override
	public String toString() {
		return "Performance [userId=" + userId + ", vehicleId=" + vehicleId
				+ ", raceTypeId=" + raceTypeId + ", time=" + time
				+ ", birthday=" + birthday + "]";
	}
	
}
