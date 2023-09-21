package com.web.epictrip.dao;
import java.util.List;

// com.web.epictrip.dao.Store_Dao
import org.apache.ibatis.annotations.Mapper;

import com.web.epictrip.vo.Payment;
import com.web.epictrip.vo.Product;
import com.web.epictrip.vo.ProductComment_Info;
import com.web.epictrip.vo.ProductComment_Page;
import com.web.epictrip.vo.Product_List;
import com.web.epictrip.vo.Product_Page;
import com.web.epictrip.vo.User;

@Mapper
public interface Store_Dao {
	
	// 상품 인서트 
	public int Store_Prod_Insert(Product ins);
	
	// 상품 페이징
	public int Store_Prod_Main_Cnt(Product_Page pg);
	
	// 상품 상품 페이징 후
	public List<Product_List> Store_Prod_Main_List(Product_Page pg);
	
	// 상품 메인페이지 상품 갯수
	public int store_Main_Num(String country);
	
	// 상품 디테일
	public Product Store_Detail(String key);
	
	// 조회수 up
	public int Store_Detail_HitsUp(ProductComment_Page pg);
	
	// 상품 디테일 댓글 페이징
	public int Store_Detail_Comment_cnt(ProductComment_Page pg);
	
	// 상품 디테일 댓글 페이징 후
	public List<ProductComment_Info> Store_Detail_Comment_list(ProductComment_Page pg);
	

	
	// 상품 디테일 댓글 입력
	public int Store_Detail_Comment_Insert(ProductComment_Info ins);
	
	// 상품 삭제
	public int Store_Del(Product del);
	public int Store_comment_Del(Product del);
	
	// 상품 댓글 삭제
	public int Store_comment_Del2(ProductComment_Info del);
	
	// 상품 업데이트 조회
	public Product Store_Posting_uptsle(Product sel);
	
	// 상품 업데이트 등록
	public int Store_Posting_upt(Product upt);
	
	// 결제 sel
	public User Store_Pay_sel(String id);
	
	// 결제 ins
	public int Store_Pay_insert(Payment ins);
	
	// 결제 ins
	public int Store_Pay_Point(Payment point);
	
	// 위시리스트 ins
	public int Wishlist_Inset(String userid, String prodkey);
}
