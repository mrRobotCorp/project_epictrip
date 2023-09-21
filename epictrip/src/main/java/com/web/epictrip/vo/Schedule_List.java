package com.web.epictrip.vo;
// com.web.epictrip.vo.Schedule_List
import java.util.Date;
import java.util.List;
import java.util.Map;

public class Schedule_List {

	private String schedule_key;
	private String userid;
	private Date creatdate;
	private String loc;
	private String startdate;
	private String enddate;
	private int period;
	private int hits;
	private String name;
	private int age;
	private String image;
	private String gender;
	private Map<String, List<Schedule_List_Info>> Schedule_List_Info; //세부정보 저장
	public Schedule_List() {
		super();
	}

	public Schedule_List(String schedule_key, String userid, Date creatdate, String loc, String startdate,
			String enddate, int period, int hits, String name, int age, String image, String gender,
			Map<String, List<com.web.epictrip.vo.Schedule_List_Info>> schedule_List_Info) {
		super();
		this.schedule_key = schedule_key;
		this.userid = userid;
		this.creatdate = creatdate;
		this.loc = loc;
		this.startdate = startdate;
		this.enddate = enddate;
		this.period = period;
		this.hits = hits;
		this.name = name;
		this.age = age;
		this.image = image;
		this.gender = gender;
		Schedule_List_Info = schedule_List_Info;
	}

	public String getSchedule_key() {
		return schedule_key;
	}
	public void setSchedule_key(String schedule_key) {
		this.schedule_key = schedule_key;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Date getCreatdate() {
		return creatdate;
	}
	public void setCreatdate(Date creatdate) {
		this.creatdate = creatdate;
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
	public int getPeriod() {
		return period;
	}
	public void setPeriod(int period) {
		this.period = period;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}

	public Map<String, List<Schedule_List_Info>> getSchedule_List_Info() {
		return Schedule_List_Info;
	}

	public void setSchedule_List_Info(Map<String, List<Schedule_List_Info>> schedule_List_Info) {
		Schedule_List_Info = schedule_List_Info;
	}



	
	
	
}
