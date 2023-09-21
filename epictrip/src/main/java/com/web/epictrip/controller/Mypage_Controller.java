package com.web.epictrip.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.epictrip.dao.Mypage_Dao;
import com.web.epictrip.service.Mypage_Service;
import com.web.epictrip.vo.Level_Vo;
import com.web.epictrip.vo.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class Mypage_Controller {

	@Autowired
	private Mypage_Service service;
	@Autowired
	private Mypage_Dao dao;
	
	
	// 레벨 출력 + @@...
	@RequestMapping("Mypage_mymain")
	public String Mypage_level(@Param("userid")String userid,Model d, HttpServletRequest request) {
		Level_Vo level = service.Mypage_level(userid);
		
		
		// 동행 글 갯수
		int CompanionCnt = dao.getUserCompanions(userid).size();
		d.addAttribute("CompanionCnt", CompanionCnt);
		// 일정 글 갯수
		int ScheduleCnt = dao.getUserSchedules(userid).size();
		d.addAttribute("ScheduleCnt", ScheduleCnt);
		// 후기 글 갯수
		int ReviewCnt = dao.getUserReviews(userid).size();
		d.addAttribute("ReviewCnt", ReviewCnt);
		
		// 마이페이지 접속 시 세션 업데이트
	    HttpSession session = request.getSession();
	    User currentSessionUser = (User) session.getAttribute("userInfo");
	    if (currentSessionUser != null && currentSessionUser.getUserid().equals(userid)) {
	        User updatedUser = dao.getUserById(userid);
	        session.setAttribute("userInfo", updatedUser);   // 세션에 최신 사용자 정보를 설정
	    }
		
		d.addAttribute("levelInfo", level); // 레벨 깃발 이미지 이름
		return "Mypage_mymain";
	}
	// 구매내역
	@GetMapping("Mypage_mybill")
	public String Mypage_mybill(@RequestParam("userid") String userid, Model model) {
		Level_Vo level = service.Mypage_level(userid);
		
		model.addAttribute("levelImg", level.getGrade_img()); // 레벨이름
		model.addAttribute("Payment", dao.getPurchaseHistory(userid));
		return "Mypage_mybill";
	}
	// 내 일정
	@GetMapping("Mypage_mycal")
	public String Mypage_mycal(@RequestParam("userid") String userid, Model model) {
		Level_Vo level = service.Mypage_level(userid);
		
		model.addAttribute("levelImg", level.getGrade_img()); // 레벨이름
		model.addAttribute("Schedule", dao.getUserSchedules(userid));
		return "Mypage_mycal";
	}
	// 내 동행
	@GetMapping("Mypage_mygroup")
	public String Mypage_mygroup(@RequestParam("userid") String userid, Model model) {
		Level_Vo level = service.Mypage_level(userid);
		
		model.addAttribute("levelImg", level.getGrade_img()); // 레벨이름
		model.addAttribute("Companion", dao.getUserCompanions(userid));
		return "Mypage_mygroup";
	}
	// 내 후기
	@GetMapping("Mypage_myreview")
	public String Mypage_myreview(@RequestParam("userid") String userid, Model model) {
		Level_Vo level = service.Mypage_level(userid);
		
		model.addAttribute("levelImg", level.getGrade_img()); // 레벨이름
		model.addAttribute("Review", dao.getUserReviews(userid));
		return "Mypage_myreview";
	}
	// 위시리스트
	@GetMapping("Mypage_mywish")
	public String Mypage_mywish(@RequestParam("userid") String userid, Model model) {
		Level_Vo level = service.Mypage_level(userid);
		
		model.addAttribute("levelImg", level.getGrade_img()); // 레벨이름
		model.addAttribute("Wishlist", dao.getUserWishlist(userid));
		return "Mypage_mywish";
	}
	// 계정설정
	@GetMapping("Mypage_mysetting")
	public String Mypage_mysetting(@RequestParam("userid") String userid, Model model) {
		Level_Vo level = service.Mypage_level(userid);
		
		model.addAttribute("leveltitle", level.getGrade_name()); // 레벨 칭호
		model.addAttribute("levelImg", level.getGrade_img()); // 레벨이름
		return "Mypage_mysetting";
	}
	// 소개글 수정
	   @PostMapping("/updateIntroduce")
	    public ResponseEntity<String> updateIntroduce(@RequestParam String userintroduce, @RequestParam String userid, HttpServletRequest request) {
	        int result = service.updateIntroduce(userintroduce, userid);
	        
	        if (result > 0) {
	            // 세션 업데이트
	            HttpSession session = request.getSession();
	            User user = (User) session.getAttribute("userInfo");
	            if (user != null && user.getUserid().equals(userid)) {
	                user.setUserintroduce(userintroduce);
	                session.setAttribute("userInfo", user);
	            }
	            
	            return new ResponseEntity<String>("소개글이 수정되었습니다.", HttpStatus.OK);
	        } else {
	            return new ResponseEntity<String>("소개글 수정에 실패했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
	        }
	    }
	   // 이미지 수정
	   @PostMapping("/updateImage")
	   public ResponseEntity<String> updateImage(@RequestParam String image, @RequestParam String userid, HttpServletRequest request) {
		   int result = service.updateImage(image, userid);
		   
		   if (result > 0) {
			   // 세션 업데이트
			   HttpSession session = request.getSession();
			   User user = (User) session.getAttribute("userInfo");
			   if (user != null && user.getUserid().equals(userid)) {
				   user.setImage(image);
				   session.setAttribute("userInfo", user);
			   }
			   
			   return new ResponseEntity<String>("이미지가 수정되었습니다.", HttpStatus.OK);
		   } else {
			   return new ResponseEntity<String>("이미지 수정에 실패했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		   }
	   }

    // 비밀번호 변경
    @PostMapping("/changePassword")
    public ResponseEntity<String> changePassword(@RequestParam String oldPassword, @RequestParam String newPassword, @RequestParam String userid) {
        int result = service.changePassword(newPassword, oldPassword, userid);
        if (result > 0) {
            return new ResponseEntity<String>("비밀번호가 변경되었습니다.", HttpStatus.OK);
        } else {
            return new ResponseEntity<String>("비밀번호 변경에 실패했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // 회원탈퇴
    @PostMapping("/withdraw")
    public ResponseEntity<String> withdrawAccount(@RequestParam String userid) {
        int result = service.withdrawAccount(userid);
        if (result > 0) {
            return new ResponseEntity<String>("계정이 탈퇴 처리되었습니다.", HttpStatus.OK);
        } else {
            return new ResponseEntity<String>("계정 탈퇴 처리에 실패했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
