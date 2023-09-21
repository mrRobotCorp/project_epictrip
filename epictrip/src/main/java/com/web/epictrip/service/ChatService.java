package com.web.epictrip.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.epictrip.repository.ChatMessageRepository;
import com.web.epictrip.repository.ChatRoomParticipantRepository;
import com.web.epictrip.repository.ChatRoomRepository;
import com.web.epictrip.repository.MessageRepository;
import com.web.epictrip.vo.ChatMessage;
import com.web.epictrip.vo.ChatRoom;
import com.web.epictrip.vo.ChatRoomParticipant;
import com.web.epictrip.vo.Message;
import com.web.epictrip.vo.Userinfo;

import jakarta.transaction.Transactional;

@Service
public class ChatService {

    @Autowired
    private ChatMessageRepository chatMessageRepository;

    // 메시지 저장
    public ChatMessage saveMessage(ChatMessage chatMessage) {
        return chatMessageRepository.save(chatMessage);
    }

    @Transactional
    public ChatMessage getMessageWithUser(Long messageId) {
        ChatMessage chatMessage = chatMessageRepository.findById(messageId).orElse(null);
        Userinfo sender = chatMessage.getSender();
        String senderName = sender.getName();  // 예를 들어, sender의 이름에 액세스
        return chatMessage;
    }


    // 사용자 추가
    public void addUser(Userinfo user) {
        if(!currentUsers.contains(user)) {
            currentUsers.add(user);
        }
    }

    // 사용자 제거
    public void removeUser(Userinfo user) {
        currentUsers.remove(user);
    }
    // 현재 채팅방에 접속 중인 사용자들의 목록
    private Set<Userinfo> currentUsers = Collections.synchronizedSet(new HashSet<>());

    // 현재 사용자 목록 반환
    public Set<Userinfo> getCurrentUsers() {
        return currentUsers;
    }
    
    @Autowired
    private ChatRoomRepository chatRoomRepository;

    @Autowired
    private ChatRoomParticipantRepository chatRoomParticipantRepository;
    // 채팅방 생성 로직
    public ChatRoom createChatRoom(String cptitle) {
        ChatRoom chatRoom = new ChatRoom();
        chatRoom.setTitle(cptitle); // 채팅방 제목 설정
        return chatRoomRepository.save(chatRoom);
    }


    @Autowired
    private MessageRepository messageRepository;  // Message 엔터티에 대한 Repository
    // 채팅방 입장 시 메시지 로딩
    public List<Message> getChatRoomMessages(Long chatroomId) {
        return messageRepository.findByChatRoom(chatRoomRepository.findById(chatroomId).orElse(null));
    }
    // 메시지 저장
    public Message sendMessage(Long chatroomId, String senderId, String content) {
        Message message = new Message();
        
        ChatRoom chatRoom = chatRoomRepository.findById(chatroomId).orElse(null);
        if (chatRoom == null) {
            throw new IllegalArgumentException("ChatRoom with id " + chatroomId + " not found");
        }

        message.setChatRoom(chatRoom);  // chatRoom 객체를 message에 설정
        message.setSenderId(senderId);
        message.setContent(content);
        
        return messageRepository.save(message);
    }
    // 채팅방 목록 조회
    public List<ChatRoom> getChatRoomsForUser(String userId) {
        List<ChatRoomParticipant> participants = chatRoomParticipantRepository.findByUserId(userId);
        List<ChatRoom> chatRooms = new ArrayList<>();
        for (ChatRoomParticipant participant : participants) {
            ChatRoom chatRoom = participant.getChatRoom();
            if (chatRoom != null) {
                chatRooms.add(chatRoom);
            }
        }
        return chatRooms;
    }

    // 게시글 작성자 확인
    private boolean isAuthorOfPost(String userId, Long chatroomId) {
        ChatRoom chatRoom = chatRoomRepository.findById(chatroomId).orElse(null);
        if (chatRoom != null) {
            return chatRoom.getAuthorId().equals(userId);
        }
        return false;
    }
    
    // 동행 확정
    public void confirmGroupon(Long chatroomId, String userId, String participantId) {
        if (isAuthorOfPost(userId, chatroomId)) {
            Optional<ChatRoomParticipant> participantOpt = chatRoomParticipantRepository.findByChatRoomAndUserId(chatRoomRepository.findById(chatroomId).orElse(null), participantId);
            if (participantOpt.isPresent()) {
                ChatRoomParticipant participant = participantOpt.get();
                participant.setIsGroupon(true);
                chatRoomParticipantRepository.save(participant);
            } else {
                throw new IllegalArgumentException("No participant found for chatroom ID: " + chatroomId + " and user ID: " + participantId);
            }
        } else {
            throw new IllegalArgumentException("User ID: " + userId + " is not the author of the post for chatroom ID: " + chatroomId);
        }
    }

    // 동행 확정 취소
    public void cancelGroupon(Long chatroomId, String userId, String participantId) {
        if (isAuthorOfPost(userId, chatroomId)) {
            Optional<ChatRoomParticipant> participantOpt = chatRoomParticipantRepository.findByChatRoomAndUserId(chatRoomRepository.findById(chatroomId).orElse(null), participantId);
            if (participantOpt.isPresent()) {
                ChatRoomParticipant participant = participantOpt.get();
                participant.setIsGroupon(false);
                chatRoomParticipantRepository.save(participant);
            } else {
                throw new IllegalArgumentException("No participant found for chatroom ID: " + chatroomId + " and user ID: " + participantId);
            }
        } else {
            throw new IllegalArgumentException("User ID: " + userId + " is not the author of the post for chatroom ID: " + chatroomId);
        }
    }

    public ChatRoom findOrCreateChatRoom(String userid, String postOwnerId, String cptitle) {
        // 이미 존재하는 채팅방인지 확인
        List<ChatRoom> existingRooms = chatRoomRepository.findByTitle(cptitle);
        for (ChatRoom chatRoom : existingRooms) {
            List<ChatRoomParticipant> participants = chatRoomParticipantRepository.findByChatRoom(chatRoom);
            for (ChatRoomParticipant participant : participants) {
                if (participant.getUserId().equals(userid) || participant.getUserId().equals(postOwnerId)) {
                    return chatRoom; // 해당 사용자들과 관련된 채팅방이 이미 존재하면 반환
                }
            }
        }

        // 존재하지 않는다면 새로운 채팅방 생성
        return createChatRoom(cptitle);
    }

    @Transactional
    public void addParticipantToChatRoom(Long chatRoomId, String userId) {
        ChatRoom chatRoom = chatRoomRepository.findById(chatRoomId).orElse(null);
        if (chatRoom == null) {
            throw new IllegalArgumentException("ChatRoom with id " + chatRoomId + " not found");
        }

        ChatRoomParticipant participant = new ChatRoomParticipant();
        participant.setChatRoom(chatRoom);
        participant.setUserId(userId);
        chatRoomParticipantRepository.save(participant);
    }


}
