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

import com.example.demo.dao.MainService;
import com.example.demo.model.Area;
import com.example.demo.model.Main;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller // 컨트롤러라고 선언함
public class MainController {
	// Service 인터페이스 객체 생성 및 연결
    @Autowired
    private MainService mainService;
    
    
	@Autowired
    HttpSession session;
	
    // 원래는 Model model -> 세션 연결 후 : Model model, HttpServletRequest request, HttpServletResponse response
    // 웹 주소 : 메인페이지
    @RequestMapping("/main.do") 
    public String main(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	//세션 연결
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	String kind = (String)session.getAttribute("KindSession");
    	String id = (String)session.getAttribute("userIdSession");
    	String region = (String)session.getAttribute("RegionSession");
    	request.setAttribute("userId", id);
    	request.setAttribute("kind", kind);
    	request.setAttribute("Region", region);
    	List<Area> siList = mainService.selectSiList(map);
    	map.put("si", siList.get(0).getSi());
    	request.setAttribute("siList",  new Gson().toJson(siList));
    	return "/web_main/main"; // WEB-INF에서 호출할 파일명
    }
    // 웹 주소 : 업종 목록 출력
    @RequestMapping("/main.storelist.do") 
    public String storeList(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	//세션 연결
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	String id = (String)session.getAttribute("userIdSession");	
    	String kind = (String)session.getAttribute("KindSession");
    	request.setAttribute("userId", id);
    	request.setAttribute("kind", kind);
    	
    	return "/web_store/storeList"; // WEB-INF에서 호출할 파일명
    }
    
    // 웹 주소 : 결제창
    @RequestMapping("/main.payment.do") 
    public String payment(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	//세션 연결
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	String id = (String)session.getAttribute("userIdSession");	
    	String kind = (String)session.getAttribute("KindSession");
    	String acc = (String)session.getAttribute("accSession");
    	String phoneNum = (String)session.getAttribute("phoneNumSession");
    	request.setAttribute("userId", id);
    	request.setAttribute("kind", kind);
    	request.setAttribute("acc", acc);
    	request.setAttribute("phoneNum", phoneNum);
    	return "/web_store/payment"; // WEB-INF에서 호출할 파일명
    }
    
    // 웹 주소 : 확인용 결제 바구니
    @RequestMapping("/main.basket.do") 
    public String basketcheck(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	//세션 연결
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	String id = (String)session.getAttribute("userIdSession");	
    	String kind = (String)session.getAttribute("KindSession");
    	String acc = (String)session.getAttribute("accSession");
    	String phoneNum = (String)session.getAttribute("phoneNumSession");
    	request.setAttribute("userId", id);
    	request.setAttribute("kind", kind);
    	request.setAttribute("acc", acc);
    	request.setAttribute("phoneNum", phoneNum);
    	return "/web_store/basket"; // WEB-INF에서 호출할 파일명
    }
    
    
    // 데이터 호출
    // 기본 화면 출력 이벤트 (식당 출력)
	@RequestMapping(value = "/main.storelist/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String firstList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Main> list = mainService.getList(map); // DB 접근 및 쿼리를 통한 데이터 호출 
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
    // 식당명 검색 출력 이벤트 (식당 출력)
	@RequestMapping(value = "/main.storelist/slist.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Main> list = mainService.searchList(map); // DB 접근 및 쿼리를 통한 데이터 호출 
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	} 
	
	 // 지역 검색 출력 이벤트 데이터 호출
    @RequestMapping(value = "/main.region.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String areaa(Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam HashMap<String, Object> map) throws Exception{
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Main> area = mainService.ListArea(map);
		resultMap.put("list", area);
		return new Gson().toJson(resultMap);		
		/*
		 * if(area.size()>0) { session.setAttribute("RegionSession", ((Main)
		 * area).getRegion()); resultMap.put("area", area); resultMap.put("result",
		 * "success"); }else { resultMap.put("result", "fail"); }
		 */
	}
}