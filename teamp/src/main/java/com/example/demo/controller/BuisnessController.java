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

import com.example.demo.dao.ResmenuService;
import com.example.demo.model.Res;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller // 컨트롤러라고 선언함
public class BuisnessController {
	@Autowired
	private ResmenuService resmenuService;
	
    @Autowired
	HttpSession session;	
    
    //사업자 메뉴관리 페이지에 사용 
    @RequestMapping("/menumanagementbusiness.do") 
    public String menumanagement(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	String kind = (String)session.getAttribute("KindSession");
    	String id = (String)session.getAttribute("userIdSession");
		if(kind.equals("B")) { // 사업자 이면! 
	    	Integer resnum = (Integer)session.getAttribute("userResnumSession");
	    	String reskind = (String)session.getAttribute("userReskindSession");
	    	request.setAttribute("reskind", reskind); 
	    	request.setAttribute("resnum",resnum); 
	    	System.out.println("메뉴관리 세션 넘어옴"); 
	    	System.out.println(resnum+" resnum");
	    	System.out.println(reskind+" reskind");
		}
    	request.setAttribute("kind", kind);
    	request.setAttribute("userId", id);
    	return "/web_business/menumanagement"; // WEB-INF에서 호출할 파일명
    }
    
    //사업자 메뉴관리 페이지에 사용
	@RequestMapping(value = "/selectResmenu2.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String firstResmenu2(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Res> list = resmenuService.selectResmenu2(map);
		int cnt = resmenuService.selectResmenuCnt();	
		
		resultMap.put("list", list);
		resultMap.put("cnt", cnt);
		

		return new Gson().toJson(resultMap);
	}
	

    // 식당명 검색 출력 이벤트 (식당 출력)
	@RequestMapping(value = "/main.storelist22/slist.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchList(Model model, HttpServletRequest request, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		List<Res> listt = resmenuService.searchMenuname(map); // DB 접근 및 쿼리를 통한 데이터 호출 
		resultMap.put("list", listt);
		
		return new Gson().toJson(resultMap);
	} 

}