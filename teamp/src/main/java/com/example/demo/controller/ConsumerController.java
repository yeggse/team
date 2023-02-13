package com.example.demo.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller // 컨트롤러라고 선언함
public class ConsumerController {
	 @Autowired
		HttpSession session;	
	// Service 인터페이스 객체 생성 및 연결
    // 웹 주소
    @RequestMapping("/paymentmy.do") 
    public String main(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	String kind = (String)session.getAttribute("KindSession");
    	String id = (String)session.getAttribute("userIdSession");
    	
    	request.setAttribute("kind", kind);
    	request.setAttribute("userId", id);    	
    	return "/payment_my"; // WEB-INF에서 호출할 파일명
    }
    @RequestMapping("/reservemy.do") 
    public String reserve(Model model) throws Exception{
    	return "/reserve_my"; // WEB-INF에서 호출할 파일명
    }
    @RequestMapping("/reviewwrite.do") 
    public String review(Model model) throws Exception{
    	return "/review_write"; // WEB-INF에서 호출할 파일명
    }
    
    @RequestMapping("/reviewadmin.do") 
    public String review1(Model model) throws Exception{
    	return "/reviewadmin"; // WEB-INF에서 호출할 파일명
    }
}