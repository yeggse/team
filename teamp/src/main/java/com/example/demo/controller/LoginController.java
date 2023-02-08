package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller // 컨트롤러라고 선언함
public class LoginController {
	// Service 인터페이스 객체 생성 및 연결
    // 웹 주소
    @RequestMapping("/login.do") 
    public String login(Model model) throws Exception{
    	return "/login"; // WEB-INF에서 호출할 파일명
    }
}