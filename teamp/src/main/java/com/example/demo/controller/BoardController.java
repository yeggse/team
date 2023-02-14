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

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller // 컨트롤러라고 선언함
public class BoardController {
	// Service 인터페이스 객체 생성 및 연결
    @Autowired
    private BoardService boardService;

    @Autowired
    HttpSession session;
	
    // 웹 주소 :  게시글 기본출력
    @RequestMapping("/main.board.do") 
    public String boardlist(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
    	String kind = (String)session.getAttribute("KindSession");
    	String id = (String)session.getAttribute("userIdSession");
    	request.setAttribute("map", map);	// request : 해당페이지 호출하면서 해당 객체를 불러오는 것
    	request.setAttribute("userId", id);
    	request.setAttribute("kind", kind);
    	return "/web_board/boardList"; // WEB-INF에서 호출할 파일명
    }
    // 게시글 기본출력 데이터 호출
	@RequestMapping(value = "/firstBoard.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String firstBoardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Board> list = boardService.firstBoard(map);
		//int cnt = boardService.selectBoardCnt();
		resultMap.put("list", list);
		//resultMap.put("cnt", cnt);
		return new Gson().toJson(resultMap);
	}
	
	
    // 웹 주소 :  게시글 상세보기
    @RequestMapping("/main.board.detail.do") 
    public String boardDetail(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
    	String id = (String)session.getAttribute("userIdSession");
    	request.setAttribute("map", map);	// request : 해당페이지 호출하면서 해당 객체를 불러오는 것
    	String kind = (String)session.getAttribute("KindSession");
    	System.out.println(map.get("noticenum"));
    	request.setAttribute("userId", id);
    	request.setAttribute("kind", kind);
    	return "/web_board/boardDetail"; // WEB-INF에서 호출할 파일명
    }
    // 게시글 상세 출력 데이터 호출
	@RequestMapping(value = "/detailBoard.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String detailBoardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.detailBoard(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
    // 웹 주소 :  게시글 수정하기
    @RequestMapping("/main.board.edit.do") 
    public String boardEdit(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
    	String id = (String)session.getAttribute("userIdSession");
    	request.setAttribute("map", map);	// request : 해당페이지 호출하면서 해당 객체를 불러오는 것
    	String kind = (String)session.getAttribute("KindSession");
    	System.out.println(map.get("noticenum"));
    	request.setAttribute("userId", id);
    	request.setAttribute("kind", kind);
    	return "/web_board/boardEdit"; // WEB-INF에서 호출할 파일명
    }
    // 게시글 상세 출력 데이터 호출
	@RequestMapping(value = "/editBoard.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String editBoardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		boardService.editBoard(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
	
}


