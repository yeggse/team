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
}
