package com.web.epictrip.vo;

import java.util.Date;

public class Company {
    private String cpkey;
    private String userid;
    private String cpimage;
    private String cptitle;
    private String cpcontent;
    private String cploc;
    private int cpnum; // 모집인원
    private int currentnum; // 현재 모집인원
    private int hits;
    private Date startdate;
    private Date enddate;
    private Date creatdate;
    private String name;
    private String gender;
    private Date birth;
    private String image;
    private String userIntroduce;
    
	public Company() {
		super();
	}
	public Company(String cpkey, String userid, String cpimage, String cptitle, String cpcontent, String cploc,
			int cpnum, int currentnum, int hits, Date startdate, Date enddate, Date creatdate, String name,
			String gender, Date birth, String image) {
		super();
		this.cpkey = cpkey;
		this.userid = userid;
		this.cpimage = cpimage;
		this.cptitle = cptitle;
		this.cpcontent = cpcontent;
		this.cploc = cploc;
		this.cpnum = cpnum;
		this.currentnum = currentnum;
		this.hits = hits;
		this.startdate = startdate;
		this.enddate = enddate;
		this.creatdate = creatdate;
		this.name = name;
		this.gender = gender;
		this.birth = birth;
		this.image = image;
	}
	public String getCpkey() {
		return cpkey;
	}
	public void setCpkey(String cpkey) {
		this.cpkey = cpkey;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getCpimage() {
		return cpimage;
	}
	public void setCpimage(String cpimage) {
		this.cpimage = cpimage;
	}
	public String getCptitle() {
		return cptitle;
	}
	public void setCptitle(String cptitle) {
		this.cptitle = cptitle;
	}
	public String getCpcontent() {
		return cpcontent;
	}
	public void setCpcontent(String cpcontent) {
		this.cpcontent = cpcontent;
	}
	public String getCploc() {
		return cploc;
	}
	public void setCploc(String cploc) {
		this.cploc = cploc;
	}
	public int getCpnum() {
		return cpnum;
	}
	public void setCpnum(int cpnum) {
		this.cpnum = cpnum;
	}
	public int getCurrentnum() {
		return currentnum;
	}
	public void setCurrentnum(int currentnum) {
		this.currentnum = currentnum;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
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
	public Date getCreatdate() {
		return creatdate;
	}
	public void setCreatdate(Date creatdate) {
		this.creatdate = creatdate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getUserIntroduce() {
		return userIntroduce;
	}
	public void setUserIntroduce(String userIntroduce) {
		this.userIntroduce = userIntroduce;
	}

}

