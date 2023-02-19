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

import com.example.demo.dao.ConsumerService;
import com.example.demo.model.Consumer;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller // 컨트롤러라고 선언함
public class ConsumerController {
	// Service 인터페이스 객체 생성 및 연결
    @Autowired
    private ConsumerService consumerService;
    
	 @Autowired
		HttpSession session;	
	// Service 인터페이스 객체 생성 및 연결
	 
 
    @RequestMapping("/paymentmy.do") 
    public String main(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	String kind = (String)session.getAttribute("KindSession");
    	String id = (String)session.getAttribute("userIdSession");
    	
    	
    	request.setAttribute("kind", kind);
    	request.setAttribute("userId", id);
    	
    	
    	return "/payment_my"; // WEB-INF에서 호출할 파일명
    }
    @RequestMapping("/reviewwrite.do") 
    public String review(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	String kind = (String)session.getAttribute("KindSession");
    	String id = (String)session.getAttribute("userIdSession");
    	
    	request.setAttribute("kind", kind);
    	request.setAttribute("userId", id); 
    	return "/review_write"; // WEB-INF에서 호출할 파일명
    }
  
    @RequestMapping("/reviewadmin.do") 
    public String review1(Model model,HttpServletRequest request, HttpServletResponse response) throws Exception{
    	String kind = (String)session.getAttribute("KindSession");
    	String id = (String)session.getAttribute("userIdSession");
    	
    	request.setAttribute("kind", kind);
    	request.setAttribute("userId", id); 
    	return "/reviewadmin"; // WEB-INF에서 호출할 파일명
    }
  
    // 웹 주소 : 예약 내역 출력
    @RequestMapping("/reservemy.do") 
      public String reservemy(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
      	HashMap<String, Object> map = new HashMap<String, Object>();
      	String menuname = (String)session.getAttribute("userMenunameSession");
      	String id = (String)session.getAttribute("userIdSession");
      	String kind = (String)session.getAttribute("KindSession");
      	
      	request.setAttribute("map", map);	// request : 해당페이지 호출하면서 해당 객체를 불러오는 것
      	request.setAttribute("userMenuname", menuname);
      	request.setAttribute("userId", id); 
    	request.setAttribute("kind", kind);
    	return "/web_payList/reserve_my"; // WEB-INF에서 호출할 파일명
      }
    
    // 	예약 내역 호출
	@RequestMapping(value = "/reservemy.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String firstBoardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Consumer> list = consumerService.ReserveList(map);
		//int cnt = boardService.countBoardCnt();	//게시글 갯수 세기
		resultMap.put("list", list);
		//resultMap.put("cnt", cnt);	//게시글 갯수 세기
		return new Gson().toJson(resultMap);
	}   

}