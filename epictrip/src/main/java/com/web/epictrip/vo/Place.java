package com.web.epictrip.vo;
// com.web.epictrip.vo.place
public class Place {
	private String  name;
	private String  lat;
	private String  lng;
	private String  loc;
	private String  place_key;
	public Place() {
		super();
	}
	public Place(String name, String lat, String lng, String loc, String place_key) {
		super();
		this.name = name;
		this.lat = lat;
		this.lng = lng;
		this.loc = loc;
		this.place_key = place_key;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public String getPlace_key() {
		return place_key;
	}
	public void setPlace_key(String place_key) {
		this.place_key = place_key;
	}
	
}
