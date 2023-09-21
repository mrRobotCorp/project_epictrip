package com.web.epictrip.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.epictrip.dao.Schedule_dao;
import com.web.epictrip.vo.Place;
import com.web.epictrip.vo.Product_Page;
import com.web.epictrip.vo.Schedule_List;
import com.web.epictrip.vo.Schedule_Place_dt;
import com.web.epictrip.vo.Schedule_Place_select;
import com.web.epictrip.vo.Schedule_insert01;
import com.web.epictrip.vo.Schedule_insert02;
import com.web.epictrip.vo.Schedule_select;

@Service
public class Schedule_service {

	@Autowired
	private Schedule_dao dao;

	// 상세보기 1
	public List<Schedule_Place_select> schedule_Dt(String schedule_key) {
		List<Schedule_Place_dt> dataList = dao.schedule_Dt(schedule_key);
		Map<Integer, List<Schedule_Place_dt>> groupedData = new HashMap<>();

		for (Schedule_Place_dt item : dataList) {
			int dayNum = item.getDay_num();
			if (!groupedData.containsKey(dayNum)) {
				groupedData.put(dayNum, new ArrayList<>());
			}
			groupedData.get(dayNum).add(item);
		}

		List<Schedule_Place_select> result = new ArrayList<>();
		for (Map.Entry<Integer, List<Schedule_Place_dt>> entry : groupedData.entrySet()) {
			int dayNum = entry.getKey();
			List<Schedule_Place_dt> dayData = entry.getValue();
			result.add(new Schedule_Place_select(dayNum, dayData));
		}

		return result;
	}

	// 상세보기 2
	public Schedule_select schedule_Dt02(@RequestParam("schedule_key") String schedule_key) {
		return dao.schedule_Dt02(schedule_key);
	}

	// 조회수 업
	public int scheduleUpHits(@RequestParam("schedule_key") String schedule_key) {
		return dao.scheduleUpHits(schedule_key);
	}

	// 검색 관광지
	public List<Place> placeInfo(@RequestParam("loc") String loc, @RequestParam("name") String name) {
		if (loc == null)
			loc = "";
		if (name == null)
			name = "";
		return dao.placeInfo(loc, name);
	}

	
	// 스케쥴 리스트 페이징넘버
	public int schedule_List_PageCnt(Product_Page pg) {
		return dao.schedule_List_PageCnt(pg);
	}
	
	// 스케쥴 리스트 페이징넘버
	public List<Schedule_List> schedule_List_Page(Product_Page pg){
		return dao.schedule_List_Page(pg);
	}
}
