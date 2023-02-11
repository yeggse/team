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

import com.example.demo.dao.JoinService;
import com.example.demo.model.Join;
import com.example.demo.model.Login;
import com.google.gson.Gson;

@Controller
public class JoinController {
	
	@Autowired
    private JoinService joinService; 

	@RequestMapping("/join.do")
	public String main(Model model) throws Exception {

		return "/join"; // WEB-INF에서 호출할 파일명
	}
	
	@RequestMapping("/join2.do")
	public String main1(Model model) throws Exception {

		return "/join2"; // WEB-INF에서 호출할 파일명
	}
	
	@RequestMapping("/datachange.do")
	public String main2(Model model) throws Exception {

		return "/datachange"; // WEB-INF에서 호출할 파일명
	}
	@RequestMapping("/datachange2.do")
	public String main3(Model model) throws Exception {

		return "/datachange2"; // WEB-INF에서 호출할 파일명
	}
	
	@RequestMapping(value = "/join/get.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
 	@ResponseBody
 	public String searchBbsList1(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
 		HashMap<String, Object> resultMap = new HashMap<String, Object>();
 	    int num = joinService.getMemberList(map);
 		if(num>0) {
 			resultMap.put("result", "success");
 		}else {
 			resultMap.put("result", "fail");
 		}
 		resultMap.put("list", num);
 		return new Gson().toJson(resultMap);
 	}
	
    @RequestMapping(value = "/join/check.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
 	@ResponseBody
 	public String check(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
 		HashMap<String, Object> resultMap = new HashMap<String, Object>();
 		int num = joinService.getCheck(map);
 		resultMap.put("num", num);
 		return new Gson().toJson(resultMap);
 	}
    
    @RequestMapping(value = "/join/nickcheck.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
 	@ResponseBody
 	public String nickcheck(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
 		HashMap<String, Object> resultMap = new HashMap<String, Object>();
 		int num = joinService.getnickCheck(map);
 		resultMap.put("num", num);
 		return new Gson().toJson(resultMap);
 	}
    
	// 데이터 호출
	@RequestMapping(value = "/searchpw.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchid(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Join> list = joinService.searchpw(map); // DB 접근 및 쿼리를 통한 데이터 호출 
		if(list.size()>0) {
			resultMap.put("result", "success");
		}else {
			resultMap.put("result", "fail");
		}
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
    
}
