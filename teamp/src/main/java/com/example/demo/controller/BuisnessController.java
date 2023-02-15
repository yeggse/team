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

import com.example.demo.dao.BoardService;
import com.example.demo.model.Board;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller // 컨트롤러라고 선언함
public class BuisnessController {
    @Autowired
	HttpSession session;	
	// Service 인터페이스 객체 생성 및 연결1
    // 웹 주소
//    @RequestMapping("/menumanagementbusiness.do") 
//    public String main(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
//    	HashMap<String, Object> map = new HashMap<String, Object>();
//    	String kind = (String)session.getAttribute("KindSession");
//    	String id = (String)session.getAttribute("userIdSession");
//    	String resnum = (String)session.getAttribute("userResnumSession");
//    	String reskind = (String)session.getAttribute("userReskindSession");
//    	
//    	
//    	request.setAttribute("kind", kind);
//    	request.setAttribute("userId", id);
//    	request.setAttribute("resnum", resnum);
//    	request.setAttribute("reskind", reskind);
//    	
//    	return "/menumanagement_business"; // WEB-INF에서 호출할 파일명
//    }
    
    @RequestMapping("/menumanagementbusiness.do") 
    public String menumanagement(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	String kind = (String)session.getAttribute("KindSession");
    	String id = (String)session.getAttribute("userIdSession");
    	
    	request.setAttribute("kind", kind);
    	request.setAttribute("userId", id);
    	return "/web_business/menumanagement"; // WEB-INF에서 호출할 파일명
    }
    @RequestMapping("/menuaddbusiness.do") 
    public String menuadd(Model model) throws Exception{
    	return "/menuadd_business"; // WEB-INF에서 호출할 파일명
    }
    @RequestMapping("/menuaddbusiness2.do") 
    public String menuadd2(Model model) throws Exception{
    	return "/menuadd_business2"; // WEB-INF에서 호출할 파일명
    }
}