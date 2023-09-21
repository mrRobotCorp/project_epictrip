package com.web.epictrip.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.epictrip.vo.ChatRoom;
import com.web.epictrip.vo.Message;

public interface MessageRepository extends JpaRepository<Message, Long> {
    List<Message> findByChatRoom(ChatRoom chatRoom);
}
