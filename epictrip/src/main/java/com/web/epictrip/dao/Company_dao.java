package com.web.epictrip.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.web.epictrip.vo.Company;
import com.web.epictrip.vo.Company_Page;


@Mapper
public interface Company_dao {
    public List<Company> cpList(Map<String, String> params);
    public int insertCompany(Company company);
    public Company getCompanyDetails(int cpkey);
    public int updateCompany(Company company);
    public int deleteCompany(String cpkey, String userid);
    
    public void increaseHits(int cpkey); // 조회수 증가 메서드
    public void increaseMes(int cpkey); // 메시지 횟수 증가 메서드
    // 페이징
    public int Company_Main_Cnt(Company_Page companionPage);
    public List<Company> Company_Main_List(Company_Page companionPage);
}
