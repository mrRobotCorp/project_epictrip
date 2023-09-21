package com.web.epictrip.vo;
// com.web.epictrip.vo.StoreCountryNum
public class StoreCountryNum {
    private String country;
    private int prodnum;
    
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public int getprodnum() {
		return prodnum;
	}
	public void setprodnum(int prodnum) {
		this.prodnum = prodnum;
	}
	public StoreCountryNum() {
		super();
	}
    public StoreCountryNum(String country, int prodnum) {
        this.country = country;
        this.prodnum = prodnum;
    }
	

}
