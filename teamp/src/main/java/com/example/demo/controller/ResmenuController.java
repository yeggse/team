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
import com.example.demo.dao.ResmenuService;
import com.example.demo.model.Board;
import com.example.demo.model.Res;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller // 컨트롤러라고 선언함
public class ResmenuController {
	// Service 인터페이스 객체 생성 및 연결
	@Autowired
	private ResmenuService resmenuService;

	@Autowired
    HttpSession session;
	// 웹 주소
	@RequestMapping("/Home.do")
	public String home(Model model) throws Exception {

		return "/main"; // WEB-INF에서 호출할 파일명
	}

	@RequestMapping("/Mypage.do")
	public String clicked(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id = (String)session.getAttribute("userIdSession");	
    	String kind = (String)session.getAttribute("KindSession");
    	request.setAttribute("userId", id);
    	request.setAttribute("kind", kind);
		return "/storeList_clicked"; // WEB-INF에서 호출할 파일명
	}

	// 데이터 호출
	@RequestMapping(value = "/Res.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String resmenu(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Res> list = resmenuService.selectResmenu(map); // DB 접근 및 쿼리를 통한 데이터 호출
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/Res1.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String resmenu1(Model model,@RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Res> list = resmenuService.selectResmenu1(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
}