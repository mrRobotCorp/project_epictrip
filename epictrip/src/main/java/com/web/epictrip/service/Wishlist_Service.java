package com.web.epictrip.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.epictrip.repository.WishlistRepository;

@Service
public class Wishlist_Service {

	private final WishlistRepository wishlistRepository;

	@Autowired
	public Wishlist_Service(WishlistRepository wishlistRepository) {
	    this.wishlistRepository = wishlistRepository;
	}

	// JPA 위시리스트
	public long countByUserid(@RequestParam String userid, @RequestParam String prodkey) {
	    return wishlistRepository.countByUserid(userid,prodkey);
	}
	
	// JPA 위시리스트 삭제
    public void deleteByUseridAndProdkey(@RequestParam String userid, @RequestParam String prodkey) {
    	wishlistRepository.deleteByUseridAndProdkey(userid,prodkey);
    }
}
