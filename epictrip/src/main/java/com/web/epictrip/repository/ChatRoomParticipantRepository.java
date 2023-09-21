package com.web.epictrip.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.web.epictrip.vo.ChatRoom;
import com.web.epictrip.vo.ChatRoomParticipant;

@Repository
public interface ChatRoomParticipantRepository extends JpaRepository<ChatRoomParticipant, Long> {
    List<ChatRoomParticipant> findByChatRoom(ChatRoom chatRoom);
    List<ChatRoomParticipant> findByUserId(String userId);
    Optional<ChatRoomParticipant> findByChatRoomAndUserId(ChatRoom chatRoom, String userId);
    
}

