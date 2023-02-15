package com.example.test1.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.MemberService;
import com.example.test1.model.Member;
import com.google.gson.Gson;

@Controller
public class MainController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
    private MemberService memberService;
	
	@RequestMapping("/login.do") 
    public String login(Model model) throws Exception{
    	
    	return "/member_css"; // WEB-INF에서 호출할 파일명
    }
	
	@RequestMapping(value = "/login/get.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String login(Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam HashMap<String, Object> map) throws Exception{
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Member user = memberService.getMember(map);
		
		if( user != null) {
			session.setAttribute("userIdSession", user.getId());
			session.setAttribute("NameSession", user.getName());
			session.setAttribute("TypeSession", user.getType());
			resultMap.put("user", user);
			resultMap.put("result", "success");
		} else {
 			resultMap.put("result", "fail");
 		}
		
 		return new Gson().toJson(resultMap);
	}	
	
}