package com.web.epictrip.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.RedirectView;

import com.web.epictrip.dao.Login_Dao;
import com.web.epictrip.service.Login_service;
import com.web.epictrip.vo.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class Login_controller {

	@Autowired
	private Login_service service;
	
	@Autowired
	private Login_Dao dao;
	
	
    @Autowired
    private MessageSource messageSource;
    
	// 시작 로그인 페이지
	@GetMapping("login")
	public String boardList() {
		return "login";
	}
	
	// 다국어
	@GetMapping("/changeLang")
    public String changeLanguage(@RequestParam("lang") String lang, Model model, Locale locale) {
	    model.addAttribute("selectedLanguage", lang);
	    
	    // MessageSource를 사용하여 메시지 가져오기
	    String greetingMessage = messageSource.getMessage("greeting.message", null, locale);
	    System.out.println(greetingMessage);
	    model.addAttribute("greetingMessage", greetingMessage);
		
        return "login";
    }
	
	// 로그인 확인 맞으면 Y 아니면 N
	@PostMapping("loginYN")
	@ResponseBody
	public String loginCheck(HttpServletRequest session, User log) {
		String msg = "로그인 실패"; 
		String check = service.loginCheck(log);
		if (check.equals("Y")) { 
			User cgeck02 = dao.userSession(log.getUserid());
			
			if (cgeck02.getAuth().equals("withdrawal")) {
					msg = "탈퇴한 계정입니다.";
			}else {
				HttpSession httpSession = session.getSession();
				httpSession.setAttribute("userInfo", cgeck02);
				msg = "로그인 성공";
			}

		}	
		return msg;
	}
		
			
    // 로그아웃 로직
	@Controller
	@RequestMapping("/user")
	public class UserController {

	    @GetMapping("/logout")
	    public RedirectView logout(HttpSession session) {
	        session.invalidate(); // 세션 무효화
	        return new RedirectView("/EpicTrip"); // http://localhost:4040/EpicTrip 으로 리다이렉트
	    }
	}

	
	// 회원가입 
	@GetMapping("join")
	// http://localhost:4040/join
	public String join() {
		return "join";
	}
	// 회원가입 아이디 중복
	@PostMapping("checkUserId")
	@ResponseBody
	public String checkUserId(User id) {
		return service.checkUserId(id);
	}
	
	// 회원가입
	// birthS 로 꼭 받아야됨 제발 기억해!
	@GetMapping("insertUser")
	@ResponseBody
	public String insertUser(@RequestParam("birthS") @DateTimeFormat(pattern = "yyyy-MM-dd") Date birth,User ins) {
		ins.setBirth(birth);
		
		return service.insertUser(ins);
	}
	
	// 아이디 비밀번호 찾기
	@GetMapping("findAccount")
	public String findAccount() {
		return "find";
	}
	// 아이디 찾기 로직
    @PostMapping("/findUserId")
    public ResponseEntity<Map<String, String>> findUserId(@RequestBody User user) {
        Map<String, String> response = new HashMap<>();
        String userId = service.findUserId(user.getName(), user.getPhnumber());
        if(userId != null) {
            response.put("result", userId);
            return new ResponseEntity<>(response, HttpStatus.OK);
        } else {
            response.put("result", "계정정보가 없습니다.");
            return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
        }
    }
    // 비밀번호 찾기 로직
    @PostMapping("/findUserPassword")
    public ResponseEntity<Map<String, String>> findUserPassword(@RequestBody User user) {
        Map<String, String> response = new HashMap<>();
        String password = service.findUserPass(user.getUserid(), user.getPhnumber());
        if(password != null) {
            response.put("result", password);
            return new ResponseEntity<>(response, HttpStatus.OK);
        } else {
            response.put("result", "계정정보가 없습니다.");
            return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
        }
    }
	
	
	// 인증번호 발송
    String api_key = "NCSOJRMFWZ3HIHIC";
    String api_secret = "2IVT2WICEGYRIPIGLD1MSQRF9JFHI4KR";
    Message coolsms = new Message(api_key, api_secret);
    String checkNum = "";

    @PostMapping("mesgo")
    @ResponseBody
    public void mesgo(@Param("phonenumber") String phonenumber) {
  	  for(int i=1;i<=6;i++) {
  		  int rdNum = (int)(Math.random()*10);
  		  checkNum += ""+rdNum;
  	  }
        // 4 params(to, from, type, text) are mandatory. must be filled
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", phonenumber);
        params.put("from", "01055006332"); //무조건 자기번호 (인증)
        params.put("type", "SMS");
        params.put("text", "\t EpicTrip \n휴대폰 인증번호: "+checkNum);
        params.put("app_version", "test app 1.2"); // application name and version

        try {
        	//send() 는 메시지를 보내는 함수  
          JSONObject obj = (JSONObject) coolsms.send(params);
          System.out.println(obj.toString());
        } catch (CoolsmsException e) {
          System.out.println(e.getMessage());
          System.out.println(e.getCode());
        }
      }
	// 인증번호 체크
    @PostMapping("checkMes")
    public ResponseEntity<String> checkMes(@Param("numberC") String numberC) {
    	String checkOK = "";
    	if(numberC.equals(checkNum)) {
    		checkOK = "Y";
    	}else {
    		checkOK = "N";
    		checkNum = "";
    	}
    	
    	return ResponseEntity.ok(checkOK);
    }
}
