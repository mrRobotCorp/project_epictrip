package com.web.epictrip.vo;
// com.web.epictrip.vo.Level_Vo
import java.util.Date;

public class Level_Vo {

	private String levels_key ;
	private String userid ;
	private String recommendid ;
	private Date recommenddate ;
	private int checklev ;
	private String grade_name;
	private String grade_img;
	private int cnt ;
	public Level_Vo() {
		super();
	}
	public Level_Vo(String levels_key, String userid, String recommendid, Date recommenddate, int checklev,
			String grade_name, String grade_img, int cnt) {
		super();
		this.levels_key = levels_key;
		this.userid = userid;
		this.recommendid = recommendid;
		this.recommenddate = recommenddate;
		this.checklev = checklev;
		this.grade_name = grade_name;
		this.grade_img = grade_img;
		this.cnt = cnt;
	}
	public String getLevels_key() {
		return levels_key;
	}
	public void setLevels_key(String levels_key) {
		this.levels_key = levels_key;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getRecommendid() {
		return recommendid;
	}
	public void setRecommendid(String recommendid) {
		this.recommendid = recommendid;
	}
	public Date getRecommenddate() {
		return recommenddate;
	}
	public void setRecommenddate(Date recommenddate) {
		this.recommenddate = recommenddate;
	}
	public int getChecklev() {
		return checklev;
	}
	public void setChecklev(int checklev) {
		this.checklev = checklev;
	}
	public String getGrade_name() {
		return grade_name;
	}
	public void setGrade_name(String grade_name) {
		this.grade_name = grade_name;
	}
	public String getGrade_img() {
		return grade_img;
	}
	public void setGrade_img(String grade_img) {
		this.grade_img = grade_img;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	

	
	
	
}
