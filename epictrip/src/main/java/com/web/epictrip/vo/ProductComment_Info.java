package com.web.epictrip.vo;
// com.web.epictrip.vo.ProductComment_Info
import java.util.Date;

public class ProductComment_Info {
	
	private String commentkey;
	private String prodkey;
	private String userid;
	private String comments;
	private Date updatedate;
	private String name;
	private String auth;
	private String image;
	public ProductComment_Info() {
		super();
	}
	public ProductComment_Info(String commentkey, String prodkey, String userid, String comments, Date updatedate,
			String name, String auth, String image) {
		super();
		this.commentkey = commentkey;
		this.prodkey = prodkey;
		this.userid = userid;
		this.comments = comments;
		this.updatedate = updatedate;
		this.name = name;
		this.auth = auth;
		this.image = image;
	}
	public String getCommentkey() {
		return commentkey;
	}
	public void setCommentkey(String commentkey) {
		this.commentkey = commentkey;
	}
	public String getProdkey() {
		return prodkey;
	}
	public void setProdkey(String prodkey) {
		this.prodkey = prodkey;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	
	
}
