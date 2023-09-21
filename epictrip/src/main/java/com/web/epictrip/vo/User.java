package com.web.epictrip.vo;


import java.util.Date;

public class User{

    private String userid;
    private String pass;
    private String name;
    private String phnumber;
    private String gender;
    private Date birth;
    private String email;
    private int point;
    private String image;
    private String auth;
    private Date joindate;
    private String userintroduce;
    private String status;

    public User() {
		super();
	}
    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhnumber() {
        return phnumber;
    }

    public void setPhnumber(String phnumber) {
        this.phnumber = phnumber;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }


	public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getAuth() {
        return auth;
    }

    public void setAuth(String auth) {
        this.auth = auth;
    }

    public Date getJoindate() {
        return joindate;
    }

    public void setJoindate(Date joindate) {
        this.joindate = joindate;
    }

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public User(String userid, String name, String image) {
		super();
		this.userid = userid;
		this.name = name;
		this.image = image;
	}

	public User(String userid, String pass, String name, String phnumber, String gender, Date birth, String email,
			int point, String image, String auth, Date joindate) {
		super();
		this.userid = userid;
		this.pass = pass;
		this.name = name;
		this.phnumber = phnumber;
		this.gender = gender;
		this.birth = birth;
		this.email = email;
		this.point = point;
		this.image = image;
		this.auth = auth;
		this.joindate = joindate;
	}

	public String getUserintroduce() {
		return userintroduce;
	}

	public void setUserintroduce(String userintroduce) {
		this.userintroduce = userintroduce;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

    
}
