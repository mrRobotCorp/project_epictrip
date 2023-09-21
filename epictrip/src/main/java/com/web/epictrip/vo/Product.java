package com.web.epictrip.vo;
// com.web.epictrip.vo.Product
import java.util.Date;

public class Product {
	private String prodkey;
	private String prodloc;
	private String dcday; // 할인 요일
	private int dcprice; // 할인 가격
	private int price;
	private String prodtitle;
	private String prodcontent;
	private String titleimage;
	private String detailimage;
	private int hits;
	private Date startdate;
	private Date enddate;
	private Date updtdate;
	private Date creatdate;
	private String writer;
	private String country;
	public Product() {
		super();
	}
	public Product(String prodkey, String prodloc, String dcday, int dcprice, int price, String prodtitle,
			String prodcontent, String titleimage, String detailimage, int hits, Date startdate, Date enddate,
			Date updtdate, Date creatdate, String writer, String country) {
		super();
		this.prodkey = prodkey;
		this.prodloc = prodloc;
		this.dcday = dcday;
		this.dcprice = dcprice;
		this.price = price;
		this.prodtitle = prodtitle;
		this.prodcontent = prodcontent;
		this.titleimage = titleimage;
		this.detailimage = detailimage;
		this.hits = hits;
		this.startdate = startdate;
		this.enddate = enddate;
		this.updtdate = updtdate;
		this.creatdate = creatdate;
		this.writer = writer;
		this.country = country;
	}
	public String getProdkey() {
		return prodkey;
	}
	public void setProdkey(String prodkey) {
		this.prodkey = prodkey;
	}
	public String getProdloc() {
		return prodloc;
	}
	public void setProdloc(String prodloc) {
		this.prodloc = prodloc;
	}
	public String getDcday() {
		return dcday;
	}
	public void setDcday(String dcday) {
		this.dcday = dcday;
	}
	public int getDcprice() {
		return dcprice;
	}
	public void setDcprice(int dcprice) {
		this.dcprice = dcprice;
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
	public String getProdcontent() {
		return prodcontent;
	}
	public void setProdcontent(String prodcontent) {
		this.prodcontent = prodcontent;
	}
	public String getTitleimage() {
		return titleimage;
	}
	public void setTitleimage(String titleimage) {
		this.titleimage = titleimage;
	}
	public String getDetailimage() {
		return detailimage;
	}
	public void setDetailimage(String detailimage) {
		this.detailimage = detailimage;
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
	public Date getUpdtdate() {
		return updtdate;
	}
	public void setUpdtdate(Date updtdate) {
		this.updtdate = updtdate;
	}
	public Date getCreatdate() {
		return creatdate;
	}
	public void setCreatdate(Date creatdate) {
		this.creatdate = creatdate;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}


	
}
