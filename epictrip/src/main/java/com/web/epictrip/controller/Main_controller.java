package com.web.epictrip.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.epictrip.dao.Main_Dao;
import com.web.epictrip.vo.Product_Page;
import com.web.epictrip.vo.Schedule_List;
import com.web.epictrip.vo.Schedule_List_Info;

@Controller
public class Main_controller {

	@Autowired
	private Main_Dao dao;
	
	@RequestMapping("EpicTrip") //ModelAndView
	@ResponseBody
	public ModelAndView Main(ModelAndView mod) {
		
		
		// 일정 리스트
		// 메인 일정-리스트01 
		// 메인 일정-리스트02 
		List<Schedule_List> schedule_List = dao.Main_List_Schedule01();
		int number = 1; 
		for (Schedule_List slist : schedule_List) {
			String schedule_key = slist.getSchedule_key();
			
			Map<String, List<Schedule_List_Info>> infoData = new HashMap<>();
				
				List<Schedule_List_Info> schedule_List_Info = dao.Main_List_Schedule02(schedule_key);		
				for(Schedule_List_Info sinfo:schedule_List_Info) {
					String dayNum = sinfo.getDay_num()+""; 
					
					if (!infoData.containsKey(dayNum)) {
						infoData.put(dayNum, new ArrayList<>());
		            }
					infoData.get(dayNum).add(sinfo);
					
			}

			slist.setSchedule_List_Info(infoData);
		}
		
		// 일정 리스트
		mod.addObject("schedule_List",schedule_List); 
		
		// 스토어 리스트 
		mod.addObject("storeInfo",dao.Main_List_Store());
		
		mod.setViewName("main");
		return mod;
	}
	
	
	
}
