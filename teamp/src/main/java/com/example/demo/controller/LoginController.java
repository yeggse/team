package com.example.demo.controller;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dao.LoginService;
import com.example.demo.model.Login;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



@Controller // 컨트롤러라고 선언함
public class LoginController {
	
	 @Autowired
	    private LoginService loginService;
	 @Autowired
		HttpSession session;
	 

	// Service 인터페이스 객체 생성 및 연결
    // 웹 주소
    @RequestMapping("/login.do") 
    public String login(Model model) throws Exception{
    	
    	return "/login"; // WEB-INF에서 호출할 파일명
    }
    @RequestMapping("/searchid.do") 
    public String searchid(Model model) throws Exception{
    	return "/search_id"; // WEB-INF에서 호출할 파일명
    }
    @RequestMapping("/searchpw.do") 
    public String searchpw(Model model) throws Exception{
    	return "/search_pw"; // WEB-INF에서 호출할 파일명
    }
    
  
    
    // 데이터 호출
    @RequestMapping(value = "/login.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String login(Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam HashMap<String, Object> map) throws Exception{
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Login user = loginService.selectLoginList(map);
		
		if( user != null) {
			session.setAttribute("userIdSession", user.getId());
			session.setAttribute("NameSession", user.getName());
			session.setAttribute("KindSession", user.getKind());
			resultMap.put("user", user);
			resultMap.put("result", "success");
		} else {
 			resultMap.put("result", "fail");
 		}
 		return new Gson().toJson(resultMap);
	}	
	
	// 데이터 호출
	@RequestMapping(value = "/searchid.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchid(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Login> list = loginService.searchid(map); // DB 접근 및 쿼리를 통한 데이터 호출 
		if(list.size()>0) {
			resultMap.put("result", "success");
		}else {
			resultMap.put("result", "fail");
		}
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
    
}