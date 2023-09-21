package com.web.epictrip.vo;

import java.util.Date;

// com.web.epictrip.vo.Schedule_insert01
public class Schedule_insert01 {
	// Schedule 저장
	
	private String schedule_key;
	private String userid;
	private String loc;
	private String loc02;
	private Date startdate;
	private Date enddate;
	public Schedule_insert01() {
		super();
	}

	public String getSchedule_key() {
		return schedule_key;
	}

	public void setSchedule_key(String schedule_key) {
		this.schedule_key = schedule_key;
	}

	public Schedule_insert01(String schedule_key, String userid, String loc, Date startdate, Date enddate) {
		super();
		this.schedule_key = schedule_key;
		this.userid = userid;
		this.loc = loc;
		this.startdate = startdate;
		this.enddate = enddate;
	}

	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public String getLoc02() {
		return loc02;
	}
	public void setLoc02(String loc02) {
		this.loc02 = loc02;
	}
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	
}
