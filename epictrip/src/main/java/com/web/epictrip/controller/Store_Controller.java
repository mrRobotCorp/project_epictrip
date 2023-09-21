package com.web.epictrip.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.web.epictrip.dao.Store_Dao;
import com.web.epictrip.service.Store_Service;
import com.web.epictrip.vo.Payment;
import com.web.epictrip.vo.Product;
import com.web.epictrip.vo.ProductComment_Info;
import com.web.epictrip.vo.ProductComment_Page;
import com.web.epictrip.vo.Product_List;
import com.web.epictrip.vo.Product_Page;
import com.web.epictrip.vo.Wishlist;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class Store_Controller {

	@Autowired
	private Store_Service service;
	
	@Autowired
	private Store_Dao dao;
	
	@Value("${upload}") // 저장 경로를 읽어옴
	private String upload;
	
    @Autowired
    private MessageSource messageSource;
//-------------------------------------------------------
	// 다국어 
	@GetMapping("/changeLang02")
    public String changeLanguage(@RequestParam("lang") String lang, Model model, Locale locale) {
	    model.addAttribute("selectedLanguage", lang);
	    
	    // MessageSource를 사용하여 메시지 가져오기
	    String greetingMessage = messageSource.getMessage("greeting.message", null, locale);
	    System.out.println(greetingMessage);
	    model.addAttribute("greetingMessage", greetingMessage);
		
        return "Store_Pay";
    }	
	
	
//-------------------------------------------------------
	// 4번쨰 메인
	@RequestMapping("Store")
	public String store_Main(Model d) {
	    String[] countries = {"대만", "홍콩", "한국", "마카오", "일본", "중국", "몽골"};
	    Map<String, Integer> countryMap = new HashMap<>();

	    for (String country : countries) {
	        int count = dao.store_Main_Num(country);
	        countryMap.put(country, count);
	    }
	    
	    // json 데이터로 저장후 모델에 담아서 출력
	    d.addAttribute("countryCntJson", new Gson().toJson(countryMap));
	    return "Store";
	}

//-------------------------------------------------------	
	// 상품 삭제
	@PostMapping("Store_Del")
	@ResponseBody
	public String Store_Del(Product del) {
		String msg = "삭제 실패";
		dao.Store_comment_Del(del);
		msg = dao.Store_Del(del)>0?"삭제 성공":"삭제 실패";
		System.out.println(msg);
		return "redirect:/Store";
	}
//-------------------------------------------------------	
	// 상품 댓글 삭제
	@PostMapping("Store_comment_Del")
	@ResponseBody
	public String Store_comment_Del(ProductComment_Info del) {
		String msg = "삭제실패";
		msg = dao.Store_comment_Del2(del)>0?"삭제성공":"삭제 실패";
		return msg;
	}
//-------------------------------------------------------
	// 상품 수정 검색
	@GetMapping("Store_Detail_InsSle")
	public ModelAndView Store_Detail_InsSle(ModelAndView mav,Product sel) {
		
		mav.addObject("insSle", dao.Store_Posting_uptsle(sel));
		mav.setViewName("Store_Posting_Update");
		return mav;
	}
	
	// 상품 수정 등록
	@PostMapping("Store_Posting_upt")
	public String Store_Posting_upt(		   
			@RequestParam("startdateS") @DateTimeFormat(pattern = "yyyy-MM-dd") String startdateStr,
		    @RequestParam("enddateS") @DateTimeFormat(pattern = "yyyy-MM-dd") String enddateStr,
		    @RequestParam("imgFile") MultipartFile imgFile,
		    @RequestParam("bgFile") MultipartFile bgFile,
		    @RequestParam("oldimg01") String oldimg01,
		    @RequestParam("oldimg02") String oldimg02,
		    Product upt) {
		// 문자열로 받은 날짜를 Date 객체로 변환
	    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    Date startdate = null;
	    Date enddate = null;
	    try {
	        startdate = dateFormat.parse(startdateStr);
	        enddate = dateFormat.parse(enddateStr);
	    } catch (ParseException e) {
	        // 날짜 변환 실패 시 예외 처리
	        e.printStackTrace();
	    }

	    // 변환된 날짜를 Product 객체에 설정
	    upt.setStartdate(startdate);
	    upt.setEnddate(enddate);
	    
	    
	    
	    // 타이틀 파일
	    if (imgFile.isEmpty()) {
	        // 파일이 없는 경우 처리
	    	upt.setTitleimage(oldimg01);
	    }else {
		    try {
	            // 파일 이름 생성
	            String originalFilename = imgFile.getOriginalFilename();
	            String uniqueFileName = UUID.randomUUID().toString() + "_" + originalFilename;
	
	            // DB에 이름저장
	            upt.setTitleimage(uniqueFileName);
	            // 파일 저장 경로 생성
	            File dest = new File(upload + uniqueFileName);
	
	            // 파일 저장
	            imgFile.transferTo(dest);
	
		    } catch (IOException e) {
		        e.printStackTrace();
		    }
	    }
		    
	    
	    // 디테일 파일
	    if (bgFile.isEmpty()) {
	    	// 파일이 없는 경우 처리
	    	upt.setDetailimage(oldimg02);
	    }else {
		    try {
		    
	            // 파일 이름 생성
	            String originalFilename = bgFile.getOriginalFilename();
	            String uniqueFileName = UUID.randomUUID().toString() + "_" + originalFilename;
	
	            // DB에 이름 저장
	            upt.setDetailimage(uniqueFileName);
	            // 파일 저장 경로 생성
	            File dest = new File(upload + uniqueFileName);
	
	            // 파일 저장
	            bgFile.transferTo(dest);
	
		    } catch (IOException e) {
		    	e.printStackTrace();
		    }
	    }
		
		String msg = "수정 실패";
		msg = dao.Store_Posting_upt(upt)>0?"수정 성공":"수정 실패";
		System.out.println(msg);
		return "redirect:/Store";
	}
//-------------------------------------------------------	
	// 3번째 결제
	@RequestMapping("Store_Pay")
	public String store_Pay(@RequestParam("userid") String userid, Model d) {
		d.addAttribute("payUser",dao.Store_Pay_sel(userid));
		return "Store_Pay";
	}
	
	@RequestMapping("Store_Pay_insert")
	public String Store_Pay_insert(@Param("email") String email, 
			@RequestParam("choiceDateS") @DateTimeFormat(pattern = "yyyy-MM-dd") String choiceDateS ,
			Payment ins) {
		 DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		    Date choiceDate = null;
		    try {
		    	choiceDate = dateFormat.parse(choiceDateS);
		    } catch (ParseException e) {
		        // 날짜 변환 실패 시 예외 처리
		        e.printStackTrace();
		    }

		    // 변환된 날짜를 Product 객체에 설정
		    ins.setChoiceDate(choiceDate);
		
		
		// 포인트 적립
		String msg = "적립실패"; 
		msg = dao.Store_Pay_Point(ins)>0?"적립완료":"적립실패";
		System.out.println(msg);
		
		// 결제 
		msg = service.Store_Pay_insert(email, ins);
		System.out.println(msg);
		
		return "redirect:/Store";
	}
	
//-------------------------------------------------------	
	// 디테일 페이지 ( 포스트 댓글 + 포스트 내용 ) 
	@RequestMapping(value="Store_Detail", method= RequestMethod.GET)
	public ModelAndView Store_Detail(@RequestParam("prodkey") String key, ModelAndView mav, 
			@RequestParam(value = "currPageNo", required = false, defaultValue = "1") String tmpcurrPageNo, 
   	 		@RequestParam(value = "range", required = false, defaultValue = "1") String tmprange) {
		Product productDetail = dao.Store_Detail(key);
		
		mav.addObject("prodDetail", productDetail); // 디테일 내용
		
		// HttpServletRequest을 사용하는 이유는 검색어와 조회순을 저장해서 다음페이지에 이동해도 사용하기 위해
		// @RequestParam(value = "currPageNo", required = false, defaultValue = "1") 장난질 예방 defaultValue디폴트 벨류 설정
		int currPageNo = 0;
		int range = 0;
		
		try {			
			currPageNo = Integer.parseInt(tmpcurrPageNo);
			range = Integer.parseInt(tmprange);
			
		} catch(NumberFormatException e) {
			currPageNo = 1;
			range = 1;			
		}
		
		List<ProductComment_Info> productComment_Info = null;
		

	    
		ProductComment_Page pg = new ProductComment_Page();
		pg.setProdkey(key);
	    
	    int totalCnt = dao.Store_Detail_Comment_cnt(pg);	   
	    pg.pageInfo(currPageNo, range, totalCnt);
	    productComment_Info = dao.Store_Detail_Comment_list(pg); // 댓글
	    
	    dao.Store_Detail_HitsUp(pg); // 조횟수

		mav.addObject("pagination", pg);
		mav.addObject("prodComInfo", productComment_Info);
		mav.setViewName("Store_Detail");
		return mav;			
		
	}
	
	
	// 댓글 인서트
	@GetMapping("Store_Comment_Insert")
	@ResponseBody
	public String Store_Detail_Comment_Insert(ProductComment_Info ins) {
		
		return dao.Store_Detail_Comment_Insert(ins)>0?"입력성공":"입력실패";
	}
	
//-------------------------------------------------------	
	// 2번쨰 리스트
	@RequestMapping(value="Store_List", method= RequestMethod.GET)
	public ModelAndView Store_List(HttpServletRequest request, ModelAndView mav, 
			@RequestParam(value = "currPageNo", required = false, defaultValue = "1") String tmpcurrPageNo, 
   	 		@RequestParam(value = "range", required = false, defaultValue = "1") String tmprange) {
		
		int currPageNo = 0;
		int range = 0;
		
		try {			
			currPageNo = Integer.parseInt(tmpcurrPageNo);
			range = Integer.parseInt(tmprange);
			
		} catch(NumberFormatException e) {
			currPageNo = 1;
			range = 1;			
		}
		
		List<Product_List> product_List = null;
		
		String country = request.getParameter("country");
		String searchType = request.getParameter("searchType");
		String keyword = request.getParameter("keyword");
	        
		if(searchType == null || "".equals(searchType) || searchType.trim().isEmpty() ) {
	       searchType = "";
	    }
	      
	    if(keyword == null || "".equals(keyword) || keyword.trim().isEmpty() ) {
	       keyword = "";
	    }	   	

	    Map<String, String> paraMap = new HashMap<>();
	    paraMap.put("country", country); // 나라정보
		paraMap.put("searchType", searchType); // 죄회수 클릭 여부 
		paraMap.put("keyword", keyword); // 검색 키워드
	    
		Product_Page pg = new Product_Page();
		pg.setCountry(country);
	    pg.setSearchType(searchType);
	    pg.setKeyword(keyword);
	    
	    int totalCnt = service.Store_Prod_Main_Cnt(pg);	   
	    pg.pageInfo(currPageNo, range, totalCnt);
	    product_List = service.Store_Prod_Main_List(pg);
	    
		HttpSession session = request.getSession();		
		
		if(!"".equals(searchType) || !"".equals(keyword)) {
	        mav.addObject("paraMap", paraMap);
	        System.out.println(paraMap);
	    }

		mav.addObject("pagination", pg);
		mav.addObject("product_List", product_List);
		System.out.println(product_List);
		mav.setViewName("Store_List");
		return mav;			
		
	}
	
//-------------------------------------------------------
	// 첫번쨰 인서트 ##
	@RequestMapping("Store_Posting")
	public String store_Posting() {
		
		return "Store_Posting";
	}

	// 인서트 ##
	@PostMapping("Store_Prod_Insert")
	public String Store_Prod_Insert(
		    @RequestParam("startdateS") @DateTimeFormat(pattern = "yyyy-MM-dd") String startdateStr,
		    @RequestParam("enddateS") @DateTimeFormat(pattern = "yyyy-MM-dd") String enddateStr,
		    @RequestParam("imgFile") MultipartFile imgFile,
		    @RequestParam("bgFile") MultipartFile bgFile,
		    Product ins) {
		
		// 문자열로 받은 날짜를 Date 객체로 변환
	    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    Date startdate = null;
	    Date enddate = null;
	    try {
	        startdate = dateFormat.parse(startdateStr);
	        enddate = dateFormat.parse(enddateStr);
	    } catch (ParseException e) {
	        // 날짜 변환 실패 시 예외 처리
	        e.printStackTrace();
	    }

	    // 변환된 날짜를 Product 객체에 설정
	    ins.setStartdate(startdate);
	    ins.setEnddate(enddate);
		
	    // 타이틀 파일
	    if (imgFile.isEmpty()) {
	        // 파일이 없는 경우 처리
	        return "파일이없습니다.";
	    }

	    try {
            // 파일 이름 생성
            String originalFilename = imgFile.getOriginalFilename();
            String uniqueFileName = UUID.randomUUID().toString() + "_" + originalFilename;

            // DB에 이름저장
            ins.setTitleimage(uniqueFileName);
            // 파일 저장 경로 생성
            File dest = new File(upload + uniqueFileName);

            // 파일 저장
            imgFile.transferTo(dest);

	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    
	    
	    
	    // 디테일 파일
	    if (bgFile.isEmpty()) {
	    	// 파일이 없는 경우 처리
	    	return "파일이없습니다.";
	    }
	    
	    try {
            // 파일 이름 생성
            String originalFilename = bgFile.getOriginalFilename();
            String uniqueFileName = UUID.randomUUID().toString() + "_" + originalFilename;

            // DB에 이름 저장
            ins.setDetailimage(uniqueFileName);
            // 파일 저장 경로 생성
            File dest = new File(upload + uniqueFileName);

            // 파일 저장
            bgFile.transferTo(dest);

	    } catch (IOException e) {
	    	e.printStackTrace();
	    }
	    service.Store_Prod_Insert(ins);
	    
	    return "redirect:/Store";
	}
	
//-------------------------------------------------------
	// 위시리스트 인서트
	@PostMapping("Wishlist_Inset")
	@ResponseBody
	public String Wishlist_Inset(@Param("userid") String userid, @Param("prodkey") String prodkey) {
		return dao.Wishlist_Inset(userid,prodkey)>0?"Y":"N";
	}
}
