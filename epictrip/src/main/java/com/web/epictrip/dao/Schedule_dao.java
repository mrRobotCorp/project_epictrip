package com.web.epictrip.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.epictrip.vo.Place;
import com.web.epictrip.vo.Product_Page;
import com.web.epictrip.vo.Schedule_List;
import com.web.epictrip.vo.Schedule_List_Info;
import com.web.epictrip.vo.Schedule_Place_dt;
import com.web.epictrip.vo.Schedule_insert01;
import com.web.epictrip.vo.Schedule_insert02;
import com.web.epictrip.vo.Schedule_select;

@Mapper
public interface Schedule_dao {

	public List<Schedule_Place_dt> schedule_Dt(@RequestParam("schedule_key") String schedule_key);
	
	public Schedule_select schedule_Dt02(@RequestParam("schedule_key") String schedule_key);
	
	public int scheduleUpHits(@RequestParam("schedule_key") String schedule_key);
	
	public List<Place> placeInfo(@RequestParam("loc") String loc, @RequestParam("name") String name);

	// 스케쥴 리스트 페이징넘버
	public int schedule_List_PageCnt(Product_Page pg);
	
	// 스케쥴 리스트 페이징넘버
	public List<Schedule_List> schedule_List_Page(Product_Page pg);
	
	// 스케쥴 리스트 상세
	public List<Schedule_List_Info> schedule_list_info(String schedule_key);

	// 스케쥴 포스트 삭제
	public int Schedule_del(Schedule_select del);
	
	//스케쥴 포스트 상세 삭제
	public int Schedule_place_del(Schedule_select del);
	
	// 스케쥴 포스트 업데이트 01
	public int Schedule_Update01(Schedule_insert01 upt);
	
	// 스케쥴 포스트 업데이트 02
	public int Schedule_Update02(String schedule_key);
	
	// 스케쥴 포스트 업데이트 03
	public int Schedule_Update03(Schedule_insert02 upt);
}
