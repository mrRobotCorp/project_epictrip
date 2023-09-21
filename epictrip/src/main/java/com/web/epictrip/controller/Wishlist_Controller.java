package com.web.epictrip.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.epictrip.service.Wishlist_Service;

import jakarta.transaction.Transactional;

@Controller
public class Wishlist_Controller {

	private final Wishlist_Service wishlist_Service;

	@Autowired
	public Wishlist_Controller(Wishlist_Service wishlist_Service) {
	    this.wishlist_Service = wishlist_Service;
	}
	
	// JPA 위시리스트
	@PostMapping("WishlistFind")
	@ResponseBody
    public String findByUserid(@RequestParam String userid, @RequestParam String prodkey) {
		String msg = "";
    	long count = wishlist_Service.countByUserid(userid,prodkey);
			if(count > 0) {
				msg = "Y";
			}else {
				msg = "N";
			}
        return msg;
    }
	
	// 위시리스트 아이디 삭제
	@PostMapping("WishlistDelete")
	@ResponseBody
	@Transactional
	public String deleteUserById(@RequestParam String userid, @RequestParam String prodkey) {
		String msg = "JPA 짜증나";
		wishlist_Service.deleteByUseridAndProdkey(userid,prodkey);
		System.out.println(msg);
		return "msg";
	}
}
