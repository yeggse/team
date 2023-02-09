package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JoinController {

	@RequestMapping("/join.do")
	public String main(Model model) throws Exception {

		return "/join"; // WEB-INF에서 호출할 파일명
	}
	
	@RequestMapping("/join2.do")
	public String main1(Model model) throws Exception {

		return "/join2"; // WEB-INF에서 호출할 파일명
	}
	
	@RequestMapping("/datachange.do")
	public String main2(Model model) throws Exception {

		return "/datachange"; // WEB-INF에서 호출할 파일명
	}
	@RequestMapping("/datachange2.do")
	public String main3(Model model) throws Exception {

		return "/datachange2"; // WEB-INF에서 호출할 파일명
	}
}
