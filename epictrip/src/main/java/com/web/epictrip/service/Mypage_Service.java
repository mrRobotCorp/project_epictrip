package com.web.epictrip.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.epictrip.dao.Mypage_Dao;
import com.web.epictrip.vo.Level_Vo;

@Service
public class Mypage_Service {

	@Autowired
	private Mypage_Dao dao;
	
	// 레벨 출력
	public Level_Vo Mypage_level(@Param("userid")String userid) {
		
		
		return dao.Mypage_level(userid);
	}
	
	// 추천확인
	public int levelCheck02(@Param("userid")String userid, 
				@Param("recommendid")String recommendid) {
		int msgCh = 0;
		int check = dao.levelCheck02(userid,recommendid);
		System.out.println("있는지 여부"+check);
		if(check > 0) {
			msgCh = dao.levelCheck(userid,recommendid);
		}else {
			msgCh = 0;
		}
		
		return msgCh;
	}
	
    public int updateIntroduce(String userintroduce, String userid) {
        return dao.updateIntroduce(userintroduce, userid);
    }

    public int changePassword(String newpass, String pass, String userid) {
        return dao.changePassword(newpass, pass, userid);
    }

    public int withdrawAccount(String userid) {
        return dao.withdrawAccount(userid);
    }
	
    public int updateImage(String image, String userid) {
    	return dao.updateImage(image, userid);
    }
}
