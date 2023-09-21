package com.web.epictrip.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.web.epictrip.service.Company_service;
import com.web.epictrip.vo.Company;
import com.web.epictrip.vo.Company_Page;
import com.web.epictrip.vo.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class Company_controller {

    @Autowired
    private Company_service companyService;
    private static final Logger logger = LoggerFactory.getLogger(Company_controller.class);
    private static final String UPLOADED_FOLDER = "C:\\a03_epictrip\\workspace\\epictrip\\src\\main\\resources\\static\\source\\groupImg\\";

    // http://localhost:4040/Community_Group
    // 동행 페이지 메인
    @GetMapping("/Community_Group")
    public String Community_Group(HttpServletRequest request, Model model) {
    	User loginUser = getLoginUser(request);
    	model.addAttribute("loginUser", loginUser);
        return "Community_Group";
    }
    // http://localhost:4040/companies
    // 동행(메인) 리스트 출력 및 검색,필터링
    @GetMapping("/companies")
    @ResponseBody
    public List<Company> getCompanies(@RequestParam(defaultValue="") String cptitle,
    		@RequestParam(required=false, defaultValue="default") String orderType) {
        return companyService.getCompanyList(cptitle, orderType);
    }
    // 동행 작성 및 수정
    @GetMapping("/Community_WriteGro")
    public String Community_WriteGro(@RequestParam(required = false) Integer cpkey, HttpServletRequest request, Model model) {
        User loginUser = getLoginUser(request);
        model.addAttribute("loginUser", loginUser);

        // cpkey가 있으면 수정 모드, 없으면 작성 모드
        if (cpkey != null) {
            Company companyDetails = companyService.getCompanyDetails(cpkey);
            model.addAttribute("company", companyDetails);
        }

        return "Community_WriteGro";
    }

    // 세션 처리
    public User getLoginUser(HttpServletRequest request ) {
        HttpSession session = request.getSession();
        User userInfo = (User) session.getAttribute("userInfo");
        return userInfo;
    }
    // 동행 작성 인서트
    @PostMapping("/insertCompany")
    public String insertCompany(@RequestBody Company company) {
        if(company.getUserid() == null || company.getCptitle() == null || company.getCpcontent() == null 
           || company.getCploc() == null || company.getCpnum() == 0 || company.getStartdate() == null 
           || company.getEnddate() == null) {
            	System.out.println("필수 항목을 모두 입력해주세요.");
        }
        Company companys = new Company();
        companys.setUserid(company.getUserid());
        companys.setCpimage(company.getCpimage());
        companys.setCptitle(company.getCptitle());
        companys.setCpcontent(company.getCpcontent());
        companys.setCploc(company.getCploc());
        companys.setCpnum(company.getCpnum());
        companys.setStartdate(company.getStartdate());
        companys.setEnddate(company.getEnddate());

        String result = companyService.insertCompany(company);
        if ("작성성공".equals(result)) {
            	System.out.println("글이 성공적으로 작성되었습니다.");
            return "redirect:/Community_Group";
        } else {
            	System.out.println("글 작성에 실패했습니다. 다시 시도해주세요.");
            return "redirect:/Community_WriteGro";
        }
    }
    // http://localhost:4040/Community_GroDetail
    // 동행 상세 출력
    @GetMapping("/Community_GroDetail")
    public String Community_GroDetail(@RequestParam int cpkey, HttpServletRequest request, Model model) {
        User loginUser = getLoginUser(request);
        Company companyDetails = companyService.getCompanyDetails(cpkey);
        companyService.increaseHits(cpkey); // 클릭 시 조회수 증가
        model.addAttribute("loginUser", loginUser);
        model.addAttribute("company", companyDetails); // Company 객체를 Model에 추가

        return "Community_GroDetail";
    }
    @GetMapping("/increaseMes")
    public void increaseMes(@RequestParam int cpkey) {
    	companyService.increaseMes(cpkey);
    }
    
    // 쿼리 스트링을 사용한 방식
    @GetMapping("/details")
    public Company getCompanyDetailsByQueryString(@RequestParam int cpkey) {
        return companyService.getCompanyDetails(cpkey);
    }
    
    
    // 동행 상세 수정
    @PostMapping("/updateCompany")
    public String updateCompany(@RequestBody Company company) {
        // 데이터베이스에 company 객체를 사용하여 데이터 수정
        companyService.updateCompany(company);
        return "redirect:/Community_GroDetail?cpkey=" + company.getCpkey();  
        // 수정이 완료된 후 게시물 상세 페이지로 리다이렉트
    }

    // 동행 상세 삭제
    @PostMapping("/deleteCompany")
    public ResponseEntity<String> deleteCompany(@RequestParam String cpkey, HttpServletRequest request) {
        User user = getLoginUser(request);
        if (user == null) {
            return new ResponseEntity<>("User not logged in", HttpStatus.UNAUTHORIZED);
        }
        String userid = user.getUserid();
        int result = companyService.deleteCompany(cpkey, userid);
        if (result > 0) {
            return new ResponseEntity<>("Delete Successful", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("Delete Failed", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // 페이징
    @GetMapping("/companyPage")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> getCompanyPage(@RequestParam(defaultValue="") String cptitle,
                                      @RequestParam(required=false, defaultValue="default") String orderType,
                                      @RequestParam(defaultValue="1") int currentPage) {
        Company_Page companyPage = new Company_Page();
        companyPage.setCurrPageNo(currentPage);
        companyPage.setKeyword(cptitle);
        companyPage.setOrderType(orderType);
        
        int totalCount = companyService.getTotalCount(companyPage);
        companyPage.setTotalCnt(totalCount);
        companyPage.pageInfo(currentPage, 12, totalCount);

        List<Company> companies = companyService.getPagedCompanies(companyPage);

        Map<String, Object> response = new HashMap<>();
        response.put("data", companies);
        response.put("pagination", companyPage);
        logger.info("Response: {}", response);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }
    // 파일 업로드
    @PostMapping("/upload")
    public ResponseEntity<String> singleFileUpload(@RequestParam(value="imgFile", required=false) MultipartFile file) {
        if (file == null || file.isEmpty()) {
            return ResponseEntity.badRequest().body("업로드할 파일을 선택하세요.");
        }
        try {
            byte[] bytes = file.getBytes();
            Path path = Paths.get(UPLOADED_FOLDER + file.getOriginalFilename());
            Files.write(path, bytes);
            return ResponseEntity.ok(file.getOriginalFilename()); 
        } catch (IOException e) {
            return ResponseEntity.status(500).body("파일을 업로드하지 못했습니다.");
        }
    }





}
