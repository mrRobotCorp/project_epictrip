package com.web.epictrip.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.web.epictrip.dao.Admin_Dao;
import com.web.epictrip.vo.Admin_Month_Vo;
import com.web.epictrip.vo.Admin_Vo;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class Admin_Controller {

	@Autowired
	private Admin_Dao dao;
	
	// 어드민 페이지
	@RequestMapping("Admin")
	public String Admin() {
		
		return "Admin";
	}
	
	// 리스트 출력
	@PostMapping("Admin_List")
	@ResponseBody
	public ResponseEntity<List<Admin_Vo>> Admin_List(@RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate) {
		
            return ResponseEntity.ok(dao.admin_List(startDate, endDate));
	}
	
	// 월 일별 총액
	@PostMapping("Admin_Month")
	@ResponseBody
	public ResponseEntity<List<Admin_Month_Vo>> Admin_Month(@RequestParam("month") String month) {
			
		return ResponseEntity.ok(dao.admin_Month(month));
	}


    
}
