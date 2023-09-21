package com.web.epictrip.vo;
// com.web.epictrip.vo.Schedule_List_Info
public class Schedule_List_Info {
	
	private String schedule_key;
	private int day_num;
	private String name;
	private String lat;
	private String lng;
	public Schedule_List_Info() {
		super();
	}
    @Override
    public String toString() {
        return "Schedule_List_Info{" +
                "schedule_key='" + schedule_key + '\'' +
                ", day_num=" + day_num +
                ", name='" + name + '\'' +
                ", lat='" + lat + '\'' +
                ", lng='" + lng + '\'' +
                '}';
    }
	public Schedule_List_Info(String schedule_key, int day_num, String name, String lat, String lng) {
		super();
		this.schedule_key = schedule_key;
		this.day_num = day_num;
		this.name = name;
		this.lat = lat;
		this.lng = lng;
	}
	public String getSchedule_key() {
		return schedule_key;
	}
	public void setSchedule_key(String schedule_key) {
		this.schedule_key = schedule_key;
	}
	public int getDay_num() {
		return day_num;
	}
	public void setDay_num(int day_num) {
		this.day_num = day_num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	
}
