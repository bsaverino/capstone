package edu.ben.cmsc398.model;

import java.sql.Date;
import java.sql.Time;

public class RaceTime {
	
	private int raceId, userId, vehicleId, raceTypeId, speed;
	private String raceType, date;
	private float time, distanceTime;
	
	public RaceTime(int raceId, int raceTypeId, int speed, String date,
			String raceType, float time, float distanceTime) {
		super();
		this.raceId = raceId;
		this.raceTypeId = raceTypeId;
		this.speed = speed;
		this.date = date;
		this.raceType = raceType;
		this.time = time;
		this.distanceTime = distanceTime;
	}

	public RaceTime(int raceId, int userId, int vehicleId, int raceTypeId,
			int speed, String date, float time, float distanceTime) {
		super();
		this.raceId = raceId;
		this.userId = userId;
		this.vehicleId = vehicleId;
		this.raceTypeId = raceTypeId;
		this.speed = speed;
		this.date = date;
		this.time = time;
		this.distanceTime = distanceTime;
	}


	public int getRaceId() {
		return raceId;
	}

	public void setRaceId(int raceId) {
		this.raceId = raceId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getVehicleId() {
		return vehicleId;
	}

	public void setVehicleId(int vehicleId) {
		this.vehicleId = vehicleId;
	}

	public int getRaceTypeId() {
		return raceTypeId;
	}

	public void setRaceTypeId(int raceTypeId) {
		this.raceTypeId = raceTypeId;
	}

	public int getSpeed() {
		return speed;
	}

	public void setSpeed(int speed) {
		this.speed = speed;
	}

	public String getRaceType() {
		return raceType;
	}

	public void setRaceType(String raceType) {
		this.raceType = raceType;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public float getTime() {
		return time;
	}

	public void setTime(float time) {
		this.time = time;
	}

	public float getDistanceTime() {
		return distanceTime;
	}

	public void setDistanceTime(float distanceTime) {
		this.distanceTime = distanceTime;
	}

	@Override
	public String toString() {
		return "RaceTime [raceId=" + raceId + ", userId=" + userId
				+ ", vehicleId=" + vehicleId + ", raceTypeId=" + raceTypeId
				+ ", speed=" + speed + ", date=" + date + ", raceType="
				+ raceType + ", time=" + time + ", distanceTime="
				+ distanceTime + "]";
	}
	
	
	
	

}
