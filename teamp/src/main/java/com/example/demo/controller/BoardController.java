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
import com.example.demo.model.Board;
import com.google.gson.Gson;


@Controller // 컨트롤러라고 선언함
public class BoardController {
	// Service 인터페이스 객체 생성 및 연결
    @Autowired
    private BoardService boardService; 

    // 웹 주소
    @RequestMapping("/board*.do") 
    public String main(Model model) throws Exception{
    	
    	return "/header"; // WEB-INF에서 호출할 파일명
    }
    
	@RequestMapping("/Home.do") 
    public String home(Model model) throws Exception{
    	
    	return "/boardList"; // WEB-INF에서 호출할 파일명
    }
	@RequestMapping("/Mypage.do") 
    public String mp(Model model) throws Exception{
    	
    	return "/mypage"; // WEB-INF에서 호출할 파일명
    }
    // 데이터 호출
	@RequestMapping(value = "/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchBbsList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Board> list = boardService.selectBoardList(map); // DB 접근 및 쿼리를 통한 데이터 호출 
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
}