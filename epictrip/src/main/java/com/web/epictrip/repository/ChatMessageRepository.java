package com.web.epictrip.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.epictrip.vo.ChatMessage;

public interface ChatMessageRepository extends JpaRepository<ChatMessage, Long> {
    // 필요한 쿼리 메서드를 추가합니다.
}

