package com.web.epictrip.vo;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;

@Entity
@Table(name = "WISHLIST")
public class Wishlist{
	
	@Id
    @Column(name = "WLKEY", nullable = false)	
    private String wlkey;

    @Column(name = "USERID", nullable = false)
    private String userid;

    @Column(name = "PRODKEY", nullable = false)
    private String prodkey;

    @Column(name = "WLDATE", nullable = false)
    private Date wldate;

	public Wishlist() {
		super();
	}

	public Wishlist(String wlkey, String userid, String prodkey, Date wldate) {
		super();
		this.wlkey = wlkey;
		this.userid = userid;
		this.prodkey = prodkey;
		this.wldate = wldate;
	}

	public String getWlkey() {
		return wlkey;
	}

	public void setWlkey(String wlkey) {
		this.wlkey = wlkey;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getProdkey() {
		return prodkey;
	}

	public void setProdkey(String prodkey) {
		this.prodkey = prodkey;
	}

	public Date getWldate() {
		return wldate;
	}

	public void setWldate(Date wldate) {
		this.wldate = wldate;
	}


}
