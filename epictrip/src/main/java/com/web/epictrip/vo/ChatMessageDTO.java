package com.web.epictrip.vo;

public class ChatMessageDTO {
    private String content;
    private String senderId;
    private String senderName;
    private String type;
    private String senderImage;
    private String cpkey;
    
    
	public ChatMessageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSenderId() {
		return senderId;
	}
	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}
	public String getSenderName() {
		return senderName;
	}
	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSenderImage() {
		return senderImage;
	}
	public void setSenderImage(String senderImage) {
		this.senderImage = senderImage;
	}
	public String getCpkey() {
		return cpkey;
	}
	public void setCpkey(String cpkey) {
		this.cpkey = cpkey;
	}
}
