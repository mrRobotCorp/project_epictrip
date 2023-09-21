package com.web.epictrip.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.web.epictrip.vo.CompanionDTO;
import com.web.epictrip.vo.Level_Vo;
import com.web.epictrip.vo.PaymentDTO;
import com.web.epictrip.vo.ReviewDTO;
import com.web.epictrip.vo.ScheduleDTO;
import com.web.epictrip.vo.User;
import com.web.epictrip.vo.WishlistDTO;

@Mapper
public interface Mypage_Dao {


	// 레벨 깃발
	public Level_Vo Mypage_level(@Param("userid")String userid);
	
	// 처음 추천확인
	public int levelCheck02(@Param("userid")String userid, 
			@Param("recommendid")String recommendid);
	
	// 좋아요 싫어요 확인
	public int levelCheck(@Param("userid")String userid, 
			@Param("recommendid")String recommendid);
	
	// 인서트
	public int levelCheckInsert(@Param("userid")String userid, 
			@Param("recommendid")String recommendid, 
			@Param("checklev")int checklev);
	
	// 업데이트
	public int levelCheckUpt(@Param("userid")String userid, 
			@Param("recommendid")String recommendid, 
			@Param("checklev")int checklev);
	
	// 딜리트
	public int levelCheckDel(@Param("userid")String userid, 
			@Param("recommendid")String recommendid);	
	
	//---------------------------------------------------------------
	
    List<PaymentDTO> getPurchaseHistory(String userid);
    List<ReviewDTO> getUserReviews(String userid);
    List<CompanionDTO> getUserCompanions(String userid);
    List<ScheduleDTO> getUserSchedules(String userid);
    List<WishlistDTO> getUserWishlist(String userid);
    
    int updateIntroduce(@Param("userintroduce") String userintroduce, @Param("userid") String userid);
    int changePassword(@Param("newpass") String newpass, @Param("pass") String pass, @Param("userid") String userid);
    int withdrawAccount(@Param("userid") String userid);
    int updateImage(@Param("image") String image, @Param("userid") String userid);
    User getUserById(String userid);
    
    
}




