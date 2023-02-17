package com.example.demo.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.dao.AdminService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller // 컨트롤러라고 선언함
public class AdminController {
	// Service 인터페이스 객체 생성 및 연결
    @Autowired
    private AdminService adminService;

    @Autowired
    HttpSession session;
	
    // 웹 주소 :  게시글 기본출력
    @RequestMapping("/maind.do") 
    public String boardlist(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
    	String kind = (String)session.getAttribute("KindSession");
    	String id = (String)session.getAttribute("userIdSession");
    	request.setAttribute("map", map);	// request : 해당페이지 호출하면서 해당 객체를 불러오는 것
    	request.setAttribute("userId", id);
    	request.setAttribute("kind", kind);
    	return "/web_board/boardList"; // WEB-INF에서 호출할 파일명
    }
}


