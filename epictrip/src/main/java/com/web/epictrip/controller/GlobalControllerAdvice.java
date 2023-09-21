package com.web.epictrip.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.web.epictrip.vo.User;

import jakarta.servlet.http.HttpServletRequest;

@ControllerAdvice
public class GlobalControllerAdvice {
    @ModelAttribute("user")
    public User getUserFromSession(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("userInfo");
        if (user == null) {
            user = new User(); 
        }
        return user;
    }
}
