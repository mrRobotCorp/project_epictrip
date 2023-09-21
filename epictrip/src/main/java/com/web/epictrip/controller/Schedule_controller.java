package com.web.epictrip.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.epictrip.dao.Schedule_dao;
import com.web.epictrip.service.Schedule_service;
import com.web.epictrip.vo.Place;
import com.web.epictrip.vo.Product_Page;
import com.web.epictrip.vo.Schedule_List;
import com.web.epictrip.vo.Schedule_List_Info;
import com.web.epictrip.vo.Schedule_insert01;
import com.web.epictrip.vo.Schedule_insert02;
import com.web.epictrip.vo.Schedule_select;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class Schedule_controller {

	@Autowired
	private Schedule_service service;

	@Autowired
	private Schedule_dao dao;

	@Autowired
	private SqlSessionFactory sqlSessionFactory;

// -------------------------------------------------------------------------------------
	// 상세화면
	@GetMapping("schedule_detail")
	public String showDetailPage(@RequestParam("schedule_key") String scheduleKey, Model model) {
		// 조회수 up
		service.scheduleUpHits(scheduleKey);
		// 모델에 데이터 추가
		model.addAttribute("scheduleDetails", service.schedule_Dt(scheduleKey));
		model.addAttribute("scheduleIns", service.schedule_Dt02(scheduleKey));

		return "CommunityDetail";
	}

//-------------------------------------------------------------------------------------
	// 작성 페이지
	@GetMapping("Community_WriteSch")
	public String showSchPage() {

		return "Community_WriteSch";
	}

	// 작성페이지 관광지 서치
	@GetMapping("placeInfo")
	@ResponseBody 
	public List<Place> placeInfo(@RequestParam("loc") String loc, @RequestParam("name") String name) {
		return service.placeInfo(loc, name);
	}

	// 스케쥴 인서트 메서드
	@PostMapping("Community_Insert")
	@ResponseBody
	public String insertSch(@RequestBody Map<String, Object> requestData) {
		String msg = "작성 실패";
		SqlSession sqlSession = null;
		System.out.println(requestData);

		try {
			String startdateStr = (String) requestData.get("startdateS"); // 문자열 형식으로 날짜 수신
			String enddateStr = (String) requestData.get("enddateS"); // 문자열 형식으로 날짜 수신

			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date startdate = dateFormat.parse(startdateStr); // 문자열을 Date 형식으로 변환
			Date enddate = dateFormat.parse(enddateStr); // 문자열을 Date 형식으로 변환

			String userid = (String) requestData.get("userid");
			String loc = (String) requestData.get("loc");
			String loc02 = (String) requestData.get("loc02");
			List<Map<String, Object>> ins02List = (List<Map<String, Object>>) requestData.get("Schedule_insert02");

			sqlSession = sqlSessionFactory.openSession();

			Schedule_insert01 ins01 = new Schedule_insert01(); // ins01 객체 생성

			ins01.setStartdate(startdate);
			ins01.setEnddate(enddate);
			ins01.setUserid(userid);
			ins01.setLoc(loc);
			ins01.setLoc02(loc02);

			sqlSession.insert("scheduleIns01", ins01); // ins01 삽입

			String generatedKey = ins01.getSchedule_key();

			for (Map<String, Object> ins02Data : ins02List) {
				Schedule_insert02 ins02 = new Schedule_insert02(); // ins02 객체 생성

				ins02.setSchedule_key(generatedKey);
				ins02.setday_num((int) ins02Data.get("daynum"));
				if ((String) ins02Data.get("place_key") != null) {
					ins02.setPlace_key((String) ins02Data.get("place_key"));
				} else {
					ins02.setPlace_key("");
				}

				sqlSession.insert("scheduleIns02", ins02); // ins02 삽입
			}

			sqlSession.commit();
			msg = "작성이 완료되었습니다.";
		} catch (Exception e) {
			if (sqlSession != null) {
				sqlSession.rollback();
			}
			e.printStackTrace();
		} finally {
			if (sqlSession != null) {
				sqlSession.close();
			}
		}

		return msg;
	}
//-------------------------------------------------------------------------------------
	// 스케쥴 리스트
	// 2번쨰 리스트
	@RequestMapping(value = "Schedule_List", method = RequestMethod.GET)
	@ResponseBody// Map<String, Object>
	public ModelAndView Schedule_List(HttpServletRequest request, ModelAndView mav,
			@RequestParam(value = "currPageNo", required = false, defaultValue = "1") String tmpcurrPageNo,
			@RequestParam(value = "range", required = false, defaultValue = "1") String tmprange) {

		int currPageNo = 0;
		int range = 0;

		try {
			currPageNo = Integer.parseInt(tmpcurrPageNo);
			range = Integer.parseInt(tmprange);

		} catch (NumberFormatException e) {
			currPageNo = 1;
			range = 1;
		}

		List<Schedule_List> schedule_List = null;

		String country = request.getParameter("country");
		String searchType = request.getParameter("searchType");
		String keyword = request.getParameter("keyword");

		if (searchType == null || "".equals(searchType) || searchType.trim().isEmpty()) {
			searchType = "";
		}

		if (keyword == null || "".equals(keyword) || keyword.trim().isEmpty()) {
			keyword = "";
		}

		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("searchType", searchType); // 죄회수 클릭 여부
		paraMap.put("keyword", keyword); // 검색 키워드

		Product_Page pg = new Product_Page();
		pg.setCountry(country);
		pg.setSearchType(searchType);
		pg.setKeyword(keyword);

		int totalCnt = service.schedule_List_PageCnt(pg);
		pg.pageInfo(currPageNo, range, totalCnt);
		schedule_List = service.schedule_List_Page(pg);

		int number = 1; 
		for (Schedule_List slist : schedule_List) {
			String schedule_key = slist.getSchedule_key();
			
			Map<String, List<Schedule_List_Info>> infoData = new HashMap<>();
				
				List<Schedule_List_Info> schedule_List_Info = dao.schedule_list_info(schedule_key);		
				for(Schedule_List_Info sinfo:schedule_List_Info) {
					String dayNum = sinfo.getDay_num()+""; 
					
					if (!infoData.containsKey(dayNum)) {
						infoData.put(dayNum, new ArrayList<>());
		            }
					infoData.get(dayNum).add(sinfo);
					
			}

			slist.setSchedule_List_Info(infoData);
		}

		HttpSession session = request.getSession();

		if (!"".equals(searchType) || !"".equals(keyword)) {
			mav.addObject("paraMap", paraMap);
			System.out.println(paraMap);
		}

		mav.addObject("pagination", pg); 
		mav.addObject("schedule_List",schedule_List); 
		mav.setViewName("Community_Schedule_main");
		
		return mav;
		
		
		/*
		Map<String, Object> response = new HashMap<>();
	    //response.put("pagination", pg);
	    response.put("schedule_List", schedule_List);
	    return response;
		 */
	}
//-------------------------------------------------------------------------------------

	// 스케쥴 삭제
	// 스케쥴 포스트 삭제
	@GetMapping("schedule_del01")
	@ResponseBody
	public String schedule_del(Schedule_select del) {
		String msg = "삭제 실패!";
		int ch01 = dao.Schedule_del(del);
		int ch02 = dao.Schedule_place_del(del);
		if(ch01>0 && ch02 >0) {
			msg = "삭제 성공";
		}
		System.out.println(msg); 
		
		return msg;
	}
//-------------------------------------------------------------------------------------
	@RequestMapping("Community_WriteUpt")
	public String schedule_del_upt() {
		return "Community_WriteUpt";
	}
	
    @GetMapping("Community_WriteUptData")
    public ResponseEntity<Map<String,Object>> schedule_del_uptDate(@RequestParam("schedule_key") String scheduleKey) {
    	
        Map<String, Object> map = new HashMap<>();
        
        map.put("scheduleDetails", dao.schedule_Dt(scheduleKey));
        map.put("scheduleIns", dao.schedule_Dt02(scheduleKey));
        
        return ResponseEntity.ok(map);
	}
    
    @PostMapping("Schedule_Update01")
	@ResponseBody
	public String Schedule_Update01(@RequestBody Map<String, Object> requestData) {
		String msg = "수정 실패";
    	
    	
		try {
		String startdateStr = (String) requestData.get("startdateS"); // 문자열 형식으로 날짜 수신
		String enddateStr = (String) requestData.get("enddateS"); // 문자열 형식으로 날짜 수신

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date startdate = dateFormat.parse(startdateStr); // 문자열을 Date 형식으로 변환
		Date enddate = dateFormat.parse(enddateStr);
		
		String userid = (String) requestData.get("userid");
		String loc = (String) requestData.get("loc");
		String loc02 = (String) requestData.get("loc02");
		String setSchedule_key = (String) requestData.get("schedule_key");
		List<Map<String, Object>> utp02List = (List<Map<String, Object>>) requestData.get("Schedule_insert02");


		Schedule_insert01 upt01 = new Schedule_insert01(); // ins01 객체 생성

		upt01.setStartdate(startdate);
		upt01.setEnddate(enddate);
		upt01.setUserid(userid);
		upt01.setLoc(loc);
		upt01.setLoc02(loc02);
		upt01.setSchedule_key(setSchedule_key);
		System.out.println("1"+upt01);
		System.out.println("1"+upt01.getSchedule_key());
		dao.Schedule_Update01(upt01);
		System.out.println("1"+upt01);
		
		String generatedKey = upt01.getSchedule_key();
		
		System.out.println("2"+generatedKey);
		dao.Schedule_Update02(generatedKey);
		
		for (Map<String, Object> ins02Data : utp02List) {
			Schedule_insert02 utp02 = new Schedule_insert02(); // utp02 객체 생성

			utp02.setSchedule_key(generatedKey);
			utp02.setday_num((int) ins02Data.get("daynum"));
			if ((String) ins02Data.get("place_key") != null) {
				utp02.setPlace_key((String) ins02Data.get("place_key"));
			} else {
				utp02.setPlace_key("");
			}
			System.out.println("3"+utp02);
			dao.Schedule_Update03(utp02);
			
			msg = "수정이 완료되었습니다.";
		}
		
		} catch (Exception e) {
			e.printStackTrace();
		}

    	
    	return msg;
    }

    

//-------------------------------------------------------------------------------------

}
