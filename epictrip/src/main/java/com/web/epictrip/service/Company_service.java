package com.web.epictrip.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.epictrip.dao.Company_dao;
import com.web.epictrip.vo.Company;
import com.web.epictrip.vo.Company_Page;

@Service
public class Company_service {

    @Autowired
    private Company_dao companyDao;
    
    public List<Company> getCompanyList(String cptitle, String orderType) {
        Map<String, String> params = new HashMap<>();
        params.put("cptitle", cptitle);
        params.put("orderType", orderType);
        return companyDao.cpList(params);
    }
    
    public String insertCompany(Company company) {
        return companyDao.insertCompany(company)>0?"작성성공":"작성실패";
    }
    
    public Company getCompanyDetails(int cpkey) {
        return companyDao.getCompanyDetails(cpkey);
    }

    public String updateCompany(Company company) {
        return companyDao.updateCompany(company)>0?"수정성공":"수정실패";
    }

    public int deleteCompany(String cpkey, String userid) {
        return companyDao.deleteCompany(cpkey, userid);
    }
    
    // 조회수 증가
    public void increaseHits(int cpkey) {
        companyDao.increaseHits(cpkey);
    }
    // 조회수 증가
    public void increaseMes(int cpkey) {
    	companyDao.increaseMes(cpkey);
    }
    // 페이징
    public int getTotalCount(Company_Page companionPage) {
        return companyDao.Company_Main_Cnt(companionPage);
    }

    public List<Company> getPagedCompanies(Company_Page companionPage) {
        return companyDao.Company_Main_List(companionPage);
    }
}
