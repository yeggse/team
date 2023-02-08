package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dao.MainService;


@Controller // 컨트롤러라고 선언함
public class MainController {
	// Service 인터페이스 객체 생성 및 연결
    @Autowired
    private MainService mainService; 

    // 웹 주소
    @RequestMapping("/main.do") 
    public String main(Model model) throws Exception{
    	
    	return "/storeList"; // WEB-INF에서 호출할 파일명
    }
    
    // 데이터 호출
//	@RequestMapping(value = "/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
//	@ResponseBody
//	public String searchBbsList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
//		HashMap<String, Object> resultMap = new HashMap<String, Object>();
//		List<Board> list = boardService.selectBoardList(map); // DB 접근 및 쿼리를 통한 데이터 호출 
//		resultMap.put("list", list);
//		return new Gson().toJson(resultMap);
//	}
}