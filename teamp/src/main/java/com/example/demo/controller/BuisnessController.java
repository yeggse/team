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

import com.example.demo.dao.ResmenuService;
import com.example.demo.model.Res;
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
    

    
    
    @RequestMapping("/paymentbusiness.do") 
    public String menumanagement3(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	String kind = (String)session.getAttribute("KindSession");
    	String id = (String)session.getAttribute("userIdSession");
		if(kind.equals("B")) { // 사업자 이면! 
	    	Integer resnum = (Integer)session.getAttribute("userResnumSession");
	    	String reskind = (String)session.getAttribute("userReskindSession");
	    	request.setAttribute("reskind", reskind); 
	    	request.setAttribute("resnum",resnum); 
	    	
		}
		
    	request.setAttribute("kind", kind);
    	request.setAttribute("userId", id);
    	return "/web_business/paymentbusiness"; // WEB-INF에서 호출할 파일명
    }
    
    
    // 사업자 매출 관련
    @RequestMapping(value = "/reservebusiness1.get.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String reserveBoard1(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Res> list = resmenuService.businessReserveList1(map);
		//int cnt = boardService.countBoardCnt();	//게시글 갯수 세기
		resultMap.put("list", list);
		//resultMap.put("cnt", cnt);	//게시글 갯수 세기
		return new Gson().toJson(resultMap);
	}
	
	// 사업자 일시품절 버튼
	@RequestMapping(value = "/soldout.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String soldout(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resmenuService.soldout(map);
			
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
	// 사업자 다시판매 버튼
	@RequestMapping(value = "/resell.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String resell(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resmenuService.resell(map);
		
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}


}