package com.web.epictrip.vo;
// com.web.epictrip.vo.Schedule_insert02
public class Schedule_insert02 {
	// schedule_place 저장
	private String schedule_key;
	private String place_key;
	private int day_num;
	
	public Schedule_insert02() {
		super();
	}
	public Schedule_insert02(String schedule_key, String place_key, int day_num) {
		super();
		this.schedule_key = schedule_key;
		this.place_key = place_key;
		this.day_num = day_num;
	}
	public String getSchedule_key() {
		return schedule_key;
	}
	public void setSchedule_key(String schedule_key) {
		this.schedule_key = schedule_key;
	}
	public String getPlace_key() {
		return place_key;
	}
	public void setPlace_key(String place_key) {
		this.place_key = place_key;
	}
	public int getday_num() {
		return day_num;
	}
	public void setday_num(int day_num) {
		this.day_num = day_num;
	}
	
	
	
}
