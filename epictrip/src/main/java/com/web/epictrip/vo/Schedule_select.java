package com.web.epictrip.vo;
// com.web.epictrip.vo.Schedule_select
public class Schedule_select {
	
	private String  schedule_key;
	private String  name;
	private String  userid;
	private String  loc;
	private String  loc02;
	private String  startdate;
	private String  enddate;
	private int  hits;
	public Schedule_select(String schedule_key, String name, String userid, String loc, String startdate,
			String enddate, int hits) {
		super();
		this.schedule_key = schedule_key;
		this.name = name;
		this.userid = userid;
		this.loc = loc;
		this.startdate = startdate;
		this.enddate = enddate;
		this.hits = hits;
	}
	public Schedule_select() {
		super();
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
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public String getLoc02() {
		return loc02;
	}
	public void setLoc02(String loc02) {
		this.loc02 = loc02;
	}
	
}
