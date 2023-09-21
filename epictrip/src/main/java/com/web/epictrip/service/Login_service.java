package com.web.epictrip.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.epictrip.dao.Login_Dao;
import com.web.epictrip.vo.User;

@Service
public class Login_service {

	@Autowired
	private Login_Dao dao;
	
	// 로그인 아이디 비밀번호 로직
	public String loginCheck(User log) {
		return dao.loginCheck(log)>0?"Y":"N";
	}
	
	// 회원가입 아이디 중복
	public String checkUserId(User id) {
		return dao.checkUserId(id)>0?"Y":"N";
	}
	
	// 회원가입
	public String insertUser(User ins) {
		if(ins.getUserid()==null) ins.setUserid("");
		if(ins.getPass()==null) ins.setPass("");
		if(ins.getName()==null) ins.setName("");
		if(ins.getPhnumber()==null) ins.setPhnumber("");
		if(ins.getEmail()==null) ins.setEmail("");
		return dao.insertUser(ins)>0?"Y":"N";
	}
    public String findUserId(String name, String phnumber) {
        User user = new User();
        user.setName(name);
        user.setPhnumber(phnumber);
        return dao.findUserId(user);
    }

    public String findUserPass(String userid, String phnumber) {
        User user = new User();
        user.setUserid(userid);
        user.setPhnumber(phnumber);
        return dao.findUserPass(user);
    }
}
