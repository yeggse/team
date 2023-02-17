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

import com.example.demo.dao.AdminService;
import com.example.demo.model.Admin;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller // 컨트롤러라고 선언함
public class AdminController {
	// Service 인터페이스 객체 생성 및 연결
    @Autowired
    private AdminService adminService;

    @Autowired
    HttpSession session;
	
	// 관리자 일반회원 출력
    @RequestMapping("/normalMem.do") 
    public String normalMem(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
    	String kind = (String)session.getAttribute("KindSession");
    	String id = (String)session.getAttribute("userIdSession");
    	request.setAttribute("map", map);	// request : 해당페이지 호출하면서 해당 객체를 불러오는 것
    	request.setAttribute("userId", id);
    	request.setAttribute("kind", kind);
    	return "/web_admin/memManage"; // WEB-INF에서 호출할 파일명
    }
    // 관리자 일반회원 출력 데이터 호출
	@RequestMapping(value = "/normalMem.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String normalMemList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Admin> list = adminService.normalMemList(map);
		//int cnt = adminService.countBoardCnt();	//게시글 갯수 세기
		resultMap.put("list", list);
		//resultMap.put("cnt", cnt);	//게시글 갯수 세기
		return new Gson().toJson(resultMap);
	}
	
	// 관리자 사업자 회원 출력
    @RequestMapping("/BuMemList.do") 
    public String BuMem(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
    	String kind = (String)session.getAttribute("KindSession");
    	String id = (String)session.getAttribute("userIdSession");
    	request.setAttribute("map", map);	// request : 해당페이지 호출하면서 해당 객체를 불러오는 것
    	request.setAttribute("userId", id);
    	request.setAttribute("kind", kind);
    	return "/web_admin/bumManage"; // WEB-INF에서 호출할 파일명
    }
    // 관리자 사업자 출력 데이터 호출
	@RequestMapping(value = "/BuMemList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String BuMemList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Admin> list = adminService.normalMemList(map);
		//int cnt = adminService.countBoardCnt();	//게시글 갯수 세기
		resultMap.put("list", list);
		//resultMap.put("cnt", cnt);	//게시글 갯수 세기
		return new Gson().toJson(resultMap);
	}

}
