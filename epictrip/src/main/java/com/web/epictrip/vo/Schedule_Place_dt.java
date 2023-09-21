package com.web.epictrip.vo;

import java.util.Date;

public class Schedule_Place_dt {

	private String schedule_key;
	private String name;
	private String daydate;
	private int day_num;
	private String place_name;
	private String lat;
	private String lng;
	private String loc;
	private int schedule_place_key;
	public Schedule_Place_dt() {
		super();
	}
	public Schedule_Place_dt(String schedule_key, String name, String daydate, int day_num, String place_name, String lat,
			String lng, String loc, int schedule_place_key) {
		super();
		this.schedule_key = schedule_key;
		this.name = name;
		this.daydate = daydate;
		this.day_num = day_num;
		this.place_name = place_name;
		this.lat = lat;
		this.lng = lng;
		this.loc = loc;
		this.schedule_place_key = schedule_place_key;
	}
	public String getSchedule_key() {
		return schedule_key;
	}
	public void setSchedule_key(String schedule_key) {
		this.schedule_key = schedule_key;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDaydate() {
		return daydate;
	}
	public void setDaydate(String daydate) {
		this.daydate = daydate;
	}
	public int getDay_num() {
		return day_num;
	}
	public void setDay_num(int day_num) {
		this.day_num = day_num;
	}
	public String getPlace_name() {
		return place_name;
	}
	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public int getSchedule_place_key() {
		return schedule_place_key;
	}
	public void setSchedule_place_key(int schedule_place_key) {
		this.schedule_place_key = schedule_place_key;
	}
	
	
	
	
}
