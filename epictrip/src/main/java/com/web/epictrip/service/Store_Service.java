package com.web.epictrip.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.messaging.MessagingException;
import org.springframework.stereotype.Service;

import com.web.epictrip.dao.Store_Dao;
import com.web.epictrip.vo.Payment;
import com.web.epictrip.vo.Product;
import com.web.epictrip.vo.Product_List;
import com.web.epictrip.vo.Product_Page;

import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeMessage.RecipientType;

@Service
public class Store_Service {

	@Autowired
	private Store_Dao dao;
	
	public int Store_Prod_Insert(Product ins) {
		return dao.Store_Prod_Insert(ins);
	}
	
	// 상품 페이징
	public int Store_Prod_Main_Cnt(Product_Page pg) {
    	return dao.Store_Prod_Main_Cnt(pg);
    }

	// 상품 상품 페이징 후
	public List<Product_List> Store_Prod_Main_List(Product_Page pg) {
    	return dao.Store_Prod_Main_List(pg);
    }
	
	// 결제 ins
	@Autowired(required = false)
	private JavaMailSender sender;
	
	public String Store_Pay_insert(@Param("email") String email,Payment ins) {
		LocalDateTime currentTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        // 날짜를 지정한 포맷으로 변환
        String formattedDate = currentTime.format(formatter);
		String msg = "메일 발송 성공";
		// 1. 메일 발송 데이터 전송을 위한 객체 생성.
		MimeMessage mmsg = sender.createMimeMessage();
		
		// 2. 해당 객체로 입력된 내용 할당.
		try {
			// 1) 제목
			mmsg.setSubject("EpicTrip 상품 결제내역");
			
			// 2) 수신자
			mmsg.setRecipient(RecipientType.TO, 
					new InternetAddress(email));
			// 3) 내용
			mmsg.setText("[에픽트립_예매 완료]\r\n"
					+ "\r\n"
					+ ins.getUserid()+" 고객님, 예매가 완료되었습니다.\r\n"

					+ "\r\n"
					+ "▶예매일: "+formattedDate+"\r\n"
					+ "\r\n"
					+ "▶예매상세: "+ins.getTotprice()+"원 / [총"+ins.getPeople()+"인]\r\n"
					+ "\r\n"
					+ "▶상품정보: http://192.168.10.120:4040/Store_Detail?prodkey="+ins.getProdkey()
					+ "\r\n"
					+ "자세한 내용은 마이페이지 > 구매 내역에서 확인할 수 있습니다.");
		// 3. 발송처리
			sender.send(mmsg);
		} catch (MessagingException e) {
			System.out.println("메시지 전송 에러: "+e.getMessage());
			msg = "메시지 전송 에러: "+e.getMessage();
		} catch (Exception e) {
			System.out.println("일반 에러: "+e.getMessage());
			msg = "일반 에러: "+e.getMessage();
		}
		
		return dao.Store_Pay_insert(ins)>0?"결제 완료":"결제 실패";
	}
	




	
}



