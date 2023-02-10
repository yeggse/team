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
public class BuisnessController {
	// Service 인터페이스 객체 생성 및 연결
    // 웹 주소
    @RequestMapping("/menumanagementbusiness.do") 
    public String menumanagement(Model model) throws Exception{
    	return "/menumanagement_business"; // WEB-INF에서 호출할 파일명
    }
    @RequestMapping("/menuaddbusiness.do") 
    public String menuadd(Model model) throws Exception{
    	return "/menuadd_business"; // WEB-INF에서 호출할 파일명
    }
    @RequestMapping("/menuaddbusiness2.do") 
    public String menuadd2(Model model) throws Exception{
    	return "/menuadd_business2"; // WEB-INF에서 호출할 파일명
    }
}