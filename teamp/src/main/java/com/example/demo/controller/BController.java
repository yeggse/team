package com.example.demo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dao.BService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller // 컨트롤러라고 선언함
public class BController {
	// Service 인터페이스 객체 생성 및 연결
    @Autowired
    private BService bService;

    @Autowired
    HttpSession session;
	
	
    // 웹 주소 :  게시글 작성하기
    @RequestMapping("/menu.add.do") 
    public String menuAdd(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
    	String id = (String)session.getAttribute("userIdSession");
    	request.setAttribute("map", map);	// request : 해당페이지 호출하면서 해당 객체를 불러오는 것
    	String kind = (String)session.getAttribute("KindSession");
    	System.out.println(map.get("noticenum"));
    	request.setAttribute("userId", id);
    	request.setAttribute("kind", kind);
    	if(kind == "B") {
    		String reskind = (String)session.getAttribute("userReskindSession");
    		String resnum = (String)session.getAttribute("userResnumSession");
    		request.setAttribute("reskind", reskind);
    		request.setAttribute("resnum", resnum);
    		System.out.println("dd");
    	}

    	return "/web_business/menuAdd"; // WEB-INF에서 호출할 파일명
    }
    // 게시글 작성 데이터 호출
	@RequestMapping(value = "/addMenu.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addMenuList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		//String img = (String) map.get("img");
		bService.addMenu(map);
		resultMap.put("message", "성공");
		resultMap.put("noticenum", map.get("id")); //!!
		System.out.println(map.get("id"+"dkdk"));
		return new Gson().toJson(resultMap);
	}
	
}


