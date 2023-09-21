package com.web.epictrip.repository;


import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.web.epictrip.vo.Wishlist;

public interface WishlistRepository extends JpaRepository<Wishlist, String>{
	@Query("SELECT COUNT(w) FROM Wishlist w WHERE w.userid = :userid AND w.prodkey = :prodkey")
	long countByUserid(@Param("userid") String userid, @Param("prodkey") String prodkey); // 동일한 값이 있는지 찾기
	
	@Modifying
    @Query("DELETE FROM Wishlist w WHERE w.userid = :userid AND w.prodkey = :prodkey")
	void deleteByUseridAndProdkey(String userid, String prodkey);
	 
}
