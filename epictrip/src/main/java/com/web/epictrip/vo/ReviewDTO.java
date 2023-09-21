package com.web.epictrip.vo;

import java.util.Date;

public class ReviewDTO {
	private String prodkey;
    private String prodTitle;
    private String comments;
    private Date uploadDate;
	public ReviewDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getProdTitle() {
		return prodTitle;
	}
	public void setProdTitle(String prodTitle) {
		this.prodTitle = prodTitle;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public Date getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}
	public String getProdkey() {
		return prodkey;
	}
	public void setProdkey(String prodkey) {
		this.prodkey = prodkey;
	}
}
