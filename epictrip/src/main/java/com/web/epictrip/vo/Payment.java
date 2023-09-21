package com.web.epictrip.vo;
// com.web.epictrip.vo.Payment
import java.util.Date;

public class Payment {
	private String patkey;
	private String userid;
	private String prodkey;
	private int savedpoint;
	private int usepoint;
	private int totprice;
	private int poinsSum;
	private String paymethod;
	private Date choiceDate;
	private Date paydate;
	private int people;
	
	public Payment() {
		super();
	}


	public Payment(String patkey, String userid, String prodkey, int savedpoint, int usepoint, int totprice,
			int poinsSum, String paymethod, Date choiceDate, Date paydate, int people) {
		super();
		this.patkey = patkey;
		this.userid = userid;
		this.prodkey = prodkey;
		this.savedpoint = savedpoint;
		this.usepoint = usepoint;
		this.totprice = totprice;
		this.poinsSum = poinsSum;
		this.paymethod = paymethod;
		this.choiceDate = choiceDate;
		this.paydate = paydate;
		this.people = people;
	}


	public int getUsepoint() {
		return usepoint;
	}
	public void setUsepoint(int usepoint) {
		this.usepoint = usepoint;
	}
	public String getPatkey() {
		return patkey;
	}
	public void setPatkey(String patkey) {
		this.patkey = patkey;
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
	public int getSavedpoint() {
		return savedpoint;
	}
	public void setSavedpoint(int savedpoint) {
		this.savedpoint = savedpoint;
	}
	public int getTotprice() {
		return totprice;
	}
	public void setTotprice(int totprice) {
		this.totprice = totprice;
	}
	public Date getPaydate() {
		return paydate;
	}
	public void setPaydate(Date paydate) {
		this.paydate = paydate;
	}
	public String getPaymethod() {
		return paymethod;
	}
	public void setPaymethod(String paymethod) {
		this.paymethod = paymethod;
	}
	public int getPoinsSum() {
		return poinsSum;
	}
	public void setPoinsSum(int poinsSum) {
		this.poinsSum = poinsSum;
	}


	public Date getChoiceDate() {
		return choiceDate;
	}


	public void setChoiceDate(Date choiceDate) {
		this.choiceDate = choiceDate;
	}


	public int getPeople() {
		return people;
	}


	public void setPeople(int people) {
		this.people = people;
	}
	
	
}
