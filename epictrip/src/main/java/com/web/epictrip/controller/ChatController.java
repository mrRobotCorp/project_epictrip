package com.web.epictrip.controller;

import java.time.LocalDateTime;
import java.util.Set;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.epictrip.dao.Mypage_Dao;
import com.web.epictrip.repository.UserinfoRepository;
import com.web.epictrip.service.ChatService;
import com.web.epictrip.service.Mypage_Service;
import com.web.epictrip.vo.ChatMessage;
import com.web.epictrip.vo.ChatMessageDTO;
import com.web.epictrip.vo.Level_Vo;
import com.web.epictrip.vo.User;
import com.web.epictrip.vo.Userinfo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ChatController {

    @Autowired
    private ChatService chatService;
    
    // 세션 처리
    public User getLoginUser(HttpServletRequest request ) {
        HttpSession session = request.getSession();
        User userInfo = (User) session.getAttribute("userInfo");
        return userInfo;
    }
    @GetMapping("/message")
    public String message(HttpServletRequest request, Model model) {
        User loginUser = getLoginUser(request);
        model.addAttribute("loginUser", loginUser);
        return "message";
    }
    
    @GetMapping("/message_userAdChat")
    public String message_userAdChat(HttpServletRequest request, Model model) {
        User loginUser = getLoginUser(request);
        model.addAttribute("loginUser", loginUser);
        return "message_userAdChat";
    }
    //  chatService.saveMessage(chatMessage);

    @Autowired
    private UserinfoRepository userinfoRepository; // Userinfo의 Repository

    @MessageMapping("/send")
    @SendTo("/topic/messages")
    public ChatMessage sendMessage(ChatMessageDTO chatMessageDTO) {
        System.out.println(chatMessageDTO.getContent());
        System.out.println(chatMessageDTO.getSenderId());
        System.out.println(chatMessageDTO.getCpkey());
        Userinfo sender = userinfoRepository.findById(chatMessageDTO.getSenderId()).orElse(null);
        System.out.println(sender.getName());
        if (sender == null) {
            throw new IllegalArgumentException("Sender with ID " + chatMessageDTO.getSenderId() + " not found");
        }

        ChatMessage chatMessage = new ChatMessage();
        chatMessage.setContent(chatMessageDTO.getContent());
        chatMessage.setChatRoomId(chatMessageDTO.getCpkey());
        chatMessage.setSender(sender);
        chatMessage.setTimestamp(LocalDateTime.now());
        // sender의 정보를 ChatMessage 객체에 설정
        chatMessage.setSenderId(sender.getUserid());
        chatMessage.setSenderName(sender.getName());
        chatMessage.setSenderImage(sender.getImage());
        chatMessage.setSenderIntroduce(sender.getUserIntroduce());
        chatMessage.setSenderBirth(sender.getBirth());
        chatMessage.setSenderGender(sender.getGender());

        return chatMessage;
    }
    // 접속자 알림 및 회원정보 객체 할당
    @MessageMapping("/notify")
    @SendTo("/topic/messages")
    public ChatMessage notifyUser(ChatMessageDTO chatMessageDTO) {
        Userinfo sender = userinfoRepository.findById(chatMessageDTO.getSenderId()).orElse(null);
        if (sender == null) {
            throw new IllegalArgumentException("Sender with ID " + chatMessageDTO.getSenderId() + " not found");
        }

        if (chatMessageDTO.getType().equals("JOIN")) {
            chatService.addUser(sender);
        } else if (chatMessageDTO.getType().equals("LEAVE")) {
            chatService.removeUser(sender);
        }

        ChatMessage chatMessage = new ChatMessage();

        switch (chatMessageDTO.getType()) {
            case "JOIN":
                chatMessage.setContent(sender.getName() + "님이 입장하셨습니다.");
                break;
            case "LEAVE":
                chatMessage.setContent(sender.getName() + "님이 나가셨습니다.");
                break;
            default:
                throw new IllegalArgumentException("Unknown notification type: " + chatMessageDTO.getType());
        }

        // ChatMessage 객체에 필요한 사용자 정보 설정
        chatMessage.setChatRoomId(chatMessageDTO.getCpkey());
        chatMessage.setSenderId(sender.getUserid());
        chatMessage.setSenderName(sender.getName());
        chatMessage.setSenderImage(sender.getImage());
        chatMessage.setSenderIntroduce(sender.getUserIntroduce());
        chatMessage.setSenderBirth(sender.getBirth());
        chatMessage.setSenderGender(sender.getGender());

        chatMessage.setType(chatMessageDTO.getType());
        chatMessage.setTimestamp(LocalDateTime.now());
        return chatMessage;
    }



    @MessageMapping("/getUsers")
    @SendTo("/topic/users")
    @ResponseBody
    public Set<Userinfo> getCurrentUsers() {
        return chatService.getCurrentUsers();
    }
    
    @MessageMapping("/leave")
    @SendTo("/topic/users")
    public User leaveRoom(String userId) {
        // userId에 해당하는 사용자의 상태를 '나감'으로 변경
        // 예: chatService.leaveRoom(userId);
        User user = new User();
        user.setUserid(userId);
        user.setStatus("left");
        return user;
    }

    //-------------------------------------------------------
    @Autowired
    private Mypage_Service service;
    
    @Autowired
    private Mypage_Dao dao;
    
    // 0: 아무것도없을 때, 1: 추천, 2: 비추
    // 추천
	// 추천 확인
    @PostMapping("levelCheck")
    @ResponseBody
	public int levelCheck(@Param("userid")String userid, 
				@Param("recommendid")String recommendid) {
		
		return service.levelCheck02(userid,recommendid);
	}

    
    
    // 출력후 추천 비추천
    @PostMapping("levelCheckInsert")
    @ResponseBody
	public int levelCheckInsert(@Param("userid")String userid, 
			@Param("recommendid")String recommendid, 
			@Param("checklev")int checklev) {
    	
    	// 인서트
    	dao.levelCheckInsert(userid,recommendid,checklev);
    	
    	return 0; 
    }
    
    @PostMapping("levelCheckUpt")
    @ResponseBody
    public int levelCheckUpt(@Param("userid")String userid, 
    		@Param("recommendid")String recommendid, 
    		@Param("checklev")int checklev) {
    	
    	// 업데이트
    	dao.levelCheckUpt(userid,recommendid,checklev);
    	
    	return 0; 
    }
    
    @PostMapping("levelCheckDel")
    @ResponseBody
    public int levelCheckDel(@Param("userid")String userid, 
    		@Param("recommendid")String recommendid,
    		@Param("checklev")int checklev) {
    	
    	// 딜리트
    	dao.levelCheckDel(userid,recommendid);
    	
    	return 0; 
    }
    
    
    @RequestMapping(value = "mesLevel", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public Level_Vo mesLevel(@Param("userid") String userid) {
        Level_Vo level = service.Mypage_level(userid);
        return level;
    }

    
    
}