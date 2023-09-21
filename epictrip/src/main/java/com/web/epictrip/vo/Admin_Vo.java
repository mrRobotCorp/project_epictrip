package com.web.epictrip.vo;

import java.util.Date;

// com.web.epictrip.vo.Admin_Vo
public class Admin_Vo {

	private String paydate;
	private String prodtitle;
	private String userid;
	private String choicedate;
	private String people;
	private String totprice;
	private String prodkey;
	private String paykey;
	
	public Admin_Vo() {
		super();
	}

	public Admin_Vo(String paydate, String prodtitle, String userid, String choicedate, String people, String totprice,
			String prodkey, String paykey) {
		super();
		this.paydate = paydate;
		this.prodtitle = prodtitle;
		this.userid = userid;
		this.choicedate = choicedate;
		this.people = people;
		this.totprice = totprice;
		this.prodkey = prodkey;
		this.paykey = paykey;
	}

	public String getPaydate() {
		return paydate;
	}

	public void setPaydate(String paydate) {
		this.paydate = paydate;
	}

	public String getProdtitle() {
		return prodtitle;
	}

	public void setProdtitle(String prodtitle) {
		this.prodtitle = prodtitle;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getChoicedate() {
		return choicedate;
	}

	public void setChoicedate(String choicedate) {
		this.choicedate = choicedate;
	}

	public String getPeople() {
		return people;
	}

	public void setPeople(String people) {
		this.people = people;
	}

	public String getTotprice() {
		return totprice;
	}

	public void setTotprice(String totprice) {
		this.totprice = totprice;
	}

	public String getProdkey() {
		return prodkey;
	}

	public void setProdkey(String prodkey) {
		this.prodkey = prodkey;
	}

	public String getPaykey() {
		return paykey;
	}

	public void setPaykey(String paykey) {
		this.paykey = paykey;
	}
	
	
	
	
}
