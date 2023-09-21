package com.web.epictrip.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.web.epictrip.vo.Userinfo;

@Repository
public interface UserinfoRepository extends JpaRepository<Userinfo, String> {
    // 필요한 추가적인 메서드가 있다면 여기에 정의
}

