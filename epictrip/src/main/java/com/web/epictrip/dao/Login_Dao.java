package com.web.epictrip.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.format.annotation.DateTimeFormat;

import com.web.epictrip.vo.User;

@Mapper
public interface Login_Dao {
	
	// 로그인
	public int loginCheck(User log);
	
	// 회원가입 아이디 중복
	public int checkUserId(User id);
	// 회원가입 인서트
	public int insertUser(User ins);
	
	// 아아디 찾기
	public String findUserId(User user);
	// 비밀번호 찾기
	public String findUserPass(User user);
	// 세션 처리
	public User userSession(String id); 
}
