package com.web.epictrip.security.config;

import java.io.PrintWriter;

import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        // 세션에서 user 정보를 가져옴
        Object user = request.getSession().getAttribute("userInfo");
        if (user == null) {
            // 사용자가 로그인하지 않았다면 알림 창을 표시하고 로그인 페이지로 리다이렉트
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('잘못된 접근입니다, 로그인 후 이용바랍니다.'); location.href='/login';</script>");
            out.flush();
            return false; // 요청 처리 중단
        }

        return true; // 요청 처리 계속
    }
}


