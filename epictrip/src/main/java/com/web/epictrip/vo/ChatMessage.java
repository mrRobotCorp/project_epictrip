package com.web.epictrip.vo;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
 
@Entity
@Table(name = "chat_messages")
public class ChatMessage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "sender")
    private Userinfo sender;

    private String content;
    @CreationTimestamp
    private LocalDateTime timestamp;
    private String senderName;
    private String senderImage;
    private String senderId;
    private String senderIntroduce;
    private Date senderBirth;
    private String senderGender;
    private String type;
    private String chatRoomId;
    

    public String getFormattedTimestamp() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        return timestamp.format(formatter);
    }
    
	public String getSenderId() {
		return senderId;
	}

	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}

	public String getSenderIntroduce() {
		return senderIntroduce;
	}

	public void setSenderIntroduce(String senderIntroduce) {
		this.senderIntroduce = senderIntroduce;
	}

	public Date getSenderBirth() {
		return senderBirth;
	}

	public void setSenderBirth(Date senderBirth) {
		this.senderBirth = senderBirth;
	}

	public String getSenderGender() {
		return senderGender;
	}

	public void setSenderGender(String senderGender) {
		this.senderGender = senderGender;
	}

	public String getSenderName() {
		return senderName;
	}
	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}
	public String getSenderImage() {
		return senderImage;
	}
	public void setSenderImage(String senderImage) {
		this.senderImage = senderImage;
	}
	public ChatMessage() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Userinfo getSender() {
		return sender;
	}
	public void setSender(Userinfo sender) {
		this.sender = sender;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public LocalDateTime getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(LocalDateTime timestamp) {
		this.timestamp = timestamp;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getChatRoomId() {
		return chatRoomId;
	}

	public void setChatRoomId(String chatRoomId) {
		this.chatRoomId = chatRoomId;
	}

}