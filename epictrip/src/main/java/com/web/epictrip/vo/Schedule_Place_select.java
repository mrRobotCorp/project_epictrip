package com.web.epictrip.vo;
import java.util.Date;
//  com.web.epictrip.vo.Schedule_Place_select
import java.util.List;

public class Schedule_Place_select {

	private int day_num;
	private List<Schedule_Place_dt> sch;
	
	public Schedule_Place_select() {
		super();
	}

	public List<Schedule_Place_dt> getSch() {
		return sch;
	}

	public void setSch(List<Schedule_Place_dt> sch) {
		this.sch = sch;
	}

	public int getDay_num() {
		return day_num;
	}

	public void setDay_num(int day_num) {
		this.day_num = day_num;
	}

	public Schedule_Place_select(int day_num, List<Schedule_Place_dt> sch) {
		super();
		this.day_num = day_num;
		this.sch = sch;
	}


}
