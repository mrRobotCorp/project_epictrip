package com.web.epictrip.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.web.epictrip.vo.Admin_Month_Vo;
import com.web.epictrip.vo.Admin_Vo;

@Mapper
public interface Admin_Dao {

	public List<Admin_Vo> admin_List(String startDate,String endDate);
	
	public List<Admin_Month_Vo> admin_Month(String month);
	
}
