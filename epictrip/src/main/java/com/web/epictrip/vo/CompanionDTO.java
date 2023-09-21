package com.web.epictrip.vo;

import java.util.Date;

public class CompanionDTO {
    private String image;
    private String name;
    private Date birth;
    private String gender;
    private String cpImage;
    private Date startDate;
    private Date endDate;
    private String cpTitle;
    private int cpNum;
    private int hits;
    private int currentNum;
    private int cpkey;
    
	public CompanionDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getCpImage() {
		return cpImage;
	}
	public void setCpImage(String cpImage) {
		this.cpImage = cpImage;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getCpTitle() {
		return cpTitle;
	}
	public void setCpTitle(String cpTitle) {
		this.cpTitle = cpTitle;
	}
	public int getCpNum() {
		return cpNum;
	}
	public void setCpNum(int cpNum) {
		this.cpNum = cpNum;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public int getCurrentNum() {
		return currentNum;
	}
	public void setCurrentNum(int currentNum) {
		this.currentNum = currentNum;
	}
	public int getCpkey() {
		return cpkey;
	}
	public void setCpkey(int cpkey) {
		this.cpkey = cpkey;
	}
}
