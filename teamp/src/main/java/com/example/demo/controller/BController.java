package com.example.demo.controller;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.dao.BService;
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

	// 메뉴 상세보기 페이지
	@RequestMapping("/menu.detail.do") 
    public String menuDetail(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		String id = (String)session.getAttribute("userIdSession");
    	String kind = (String)session.getAttribute("KindSession");
    	Integer resnum = (Integer)session.getAttribute("userResnumSession");
    	String reskind = (String)session.getAttribute("userReskindSession");
		request.setAttribute("map", map);
		request.setAttribute("userId", id);
    	request.setAttribute("kind", kind);
    	request.setAttribute("reskind", reskind); 
    	request.setAttribute("resnum",resnum); 
    	System.out.println("메뉴상세보기 세션 넘어옴"); 
    	System.out.println(resnum+" resnum");
    	System.out.println(reskind+" reskind");
    	
        return "/web_business/menuDetail";
    }
	// 메뉴 상세보기 호출
	@RequestMapping(value = "/menu.detail.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String menuDetailList(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = bService.detailMenu(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
}
