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
import com.example.demo.model.Main;
import com.google.gson.Gson;


@Controller // 컨트롤러라고 선언함
public class MainController {
	// Service 인터페이스 객체 생성 및 연결
    @Autowired
    private MainService mainService; 

    // 웹 주소 : 메인페이지
    @RequestMapping("/main.do") 
    public String main(Model model) throws Exception{
    	
    	return "/web_main/main"; // WEB-INF에서 호출할 파일명
    }
    // 웹 주소 : 업종 목록 출력
    @RequestMapping("/main.storelist.do") 
    public String storeList(Model model) throws Exception{
    	
    	return "/web_store/storeList"; // WEB-INF에서 호출할 파일명
    }
    
    // 웹 주소 : 결제창
    @RequestMapping("/main.payment.do") 
    public String payment(Model model) throws Exception{
    	
    	return "/web_store/payment"; // WEB-INF에서 호출할 파일명
    }
    
    
    
    // 데이터 호출
	@RequestMapping(value = "/main.storelist/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchStoreList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Main> list = mainService.getList(map); // DB 접근 및 쿼리를 통한 데이터 호출 
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
}