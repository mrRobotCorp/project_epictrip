package com.web.epictrip.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.web.epictrip.vo.Product_List;
import com.web.epictrip.vo.Schedule_List;
import com.web.epictrip.vo.Schedule_List_Info;

@Mapper
public interface Main_Dao {

	// 메인 상품-리스트
	public List<Product_List> Main_List_Store();
	
	// 메인 일정-리스트01 
	public List<Schedule_List> Main_List_Schedule01();
	// 메인 일정-리스트02 
	public List<Schedule_List_Info> Main_List_Schedule02(String schedule_key);
	
}
