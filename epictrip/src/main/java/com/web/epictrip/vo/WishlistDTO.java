package com.web.epictrip.vo;

public class WishlistDTO {
    private String titleImage;
    private String prodTitle;
    private String prodLoc;
    private String prodKey;
    private int price;
	public WishlistDTO() {
		// TODO Auto-generated constructor stub
	}
	public String getTitleImage() {
		return titleImage;
	}
	public void setTitleImage(String titleImage) {
		this.titleImage = titleImage;
	}
	public String getProdTitle() {
		return prodTitle;
	}
	public void setProdTitle(String prodTitle) {
		this.prodTitle = prodTitle;
	}
	public String getProdLoc() {
		return prodLoc;
	}
	public void setProdLoc(String prodLoc) {
		this.prodLoc = prodLoc;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getProdKey() {
		return prodKey;
	}
	public void setProdKey(String prodKey) {
		this.prodKey = prodKey;
	}
}
