package com.web.epictrip.vo;

import java.util.Date;

public class Product_List {

	private String prodkey;
	private String country;
	private String prodloc;
	private int price;
	private String prodtitle;
	private String titleimage;
	private int hits;
	private Date updtdate;
	private Date startdate;
	private Date enddate;
	public Product_List() {
		super();
	}
	public Product_List(String prodkey, String country, String prodloc, int price, String prodtitle, String titleimage,
			int hits, Date updtdate, Date startdate, Date enddate) {
		super();
		this.prodkey = prodkey;
		this.country = country;
		this.prodloc = prodloc;
		this.price = price;
		this.prodtitle = prodtitle;
		this.titleimage = titleimage;
		this.hits = hits;
		this.updtdate = updtdate;
		this.startdate = startdate;
		this.enddate = enddate;
	}
	public String getProdkey() {
		return prodkey;
	}
	public void setProdkey(String prodkey) {
		this.prodkey = prodkey;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getProdloc() {
		return prodloc;
	}
	public void setProdloc(String prodloc) {
		this.prodloc = prodloc;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getProdtitle() {
		return prodtitle;
	}
	public void setProdtitle(String prodtitle) {
		this.prodtitle = prodtitle;
	}
	public String getTitleimage() {
		return titleimage;
	}
	public void setTitleimage(String titleimage) {
		this.titleimage = titleimage;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public Date getUpdtdate() {
		return updtdate;
	}
	public void setUpdtdate(Date updtdate) {
		this.updtdate = updtdate;
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
