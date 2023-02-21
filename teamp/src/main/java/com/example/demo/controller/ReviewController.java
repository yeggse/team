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


import com.example.demo.dao.ReviewService;
import com.example.demo.model.Admin;
import com.example.demo.model.Review;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller // 컨트롤러라고 선언함
public class ReviewController {
	// Service 인터페이스 객체 생성 및 연결
	 
	@Autowired
	private ReviewService reviewservice;

    @Autowired
    HttpSession session;
	
	//리뷰 리스트 검색
    
    @RequestMapping(value = "/searchReview.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchReview(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Review> list = reviewservice.selectreviewList(map); // DB 접근 및 쿼리를 통한 데이터 호출 
		resultMap.put("list1", list);
		return new Gson().toJson(resultMap);
	}
    
    
    //관리자용 식당리뷰 리스트
    @RequestMapping(value = "/searchReview1.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
   	@ResponseBody
   	public String searchReviewkind(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
   		HashMap<String, Object> resultMap = new HashMap<String, Object>();
   		List<Review> list = reviewservice.selectreviewList1(map); // DB 접근 및 쿼리를 통한 데이터 호출 
   		resultMap.put("list1", list);
   		return new Gson().toJson(resultMap);
   	}
    
  //사업자용 식당리뷰 리스트
    @RequestMapping(value = "/searchReview2.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
   	@ResponseBody
   	public String searchReview2(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
   		HashMap<String, Object> resultMap = new HashMap<String, Object>();
   		List<Review> list = reviewservice.selectreviewList2(map); // DB 접근 및 쿼리를 통한 데이터 호출 
   		resultMap.put("list1", list);
   		return new Gson().toJson(resultMap);
   	}
    
    @RequestMapping(value = "/reviewFin.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String reviewFin(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		reviewservice.reviewFin(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
 // 리뷰관리 주소 :  게시글 상세보기
    @RequestMapping("/review.board.detail.do") 
    public String boardDetail(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
    	String id = (String)session.getAttribute("userIdSession");
    	request.setAttribute("map", map);	// request : 해당페이지 호출하면서 해당 객체를 불러오는 것
    	String kind = (String)session.getAttribute("KindSession");
    	System.out.println(map.get("reviewnum"));
    	request.setAttribute("userId", id);
    	request.setAttribute("kind", kind);
    	return "/web_business/reviewDetail"; // WEB-INF에서 호출할 파일명
    }
    // 리뷰 상세 출력 데이터 호출
   	@RequestMapping(value = "/detailReviewboard.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
   	@ResponseBody
   	public String detailReviewList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
   		HashMap<String, Object> resultMap = new HashMap<String, Object>();
   		resultMap = reviewservice.detailReviewboard(map);
   		resultMap.put("message", "성공");
   		return new Gson().toJson(resultMap);
   	}
}
