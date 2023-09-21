package com.web.epictrip.vo;

public class ChatRoomRequestDTO {
    private String userid;
    private String postOwnerId;
    private String cptitle;
	public ChatRoomRequestDTO() {
		// TODO Auto-generated constructor stub
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPostOwnerId() {
		return postOwnerId;
	}
	public void setPostOwnerId(String postOwnerId) {
		this.postOwnerId = postOwnerId;
	}
	public String getCptitle() {
		return cptitle;
	}
	public void setCptitle(String cptitle) {
		this.cptitle = cptitle;
	}
}
