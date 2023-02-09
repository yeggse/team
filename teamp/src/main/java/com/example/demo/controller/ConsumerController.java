package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller // 컨트롤러라고 선언함
public class ConsumerController {
	// Service 인터페이스 객체 생성 및 연결
    // 웹 주소
    @RequestMapping("/paymentmy.do") 
    public String payment(Model model) throws Exception{
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
}