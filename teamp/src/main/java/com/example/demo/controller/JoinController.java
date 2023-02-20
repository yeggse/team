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
import com.example.demo.model.Main;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class JoinController {
	
	@Autowired
    private JoinService joinService; 
	
	@Autowired
    HttpSession session;

	@RequestMapping("/join.do")
	public String main(Model model) throws Exception {

		return "/join"; // WEB-INF에서 호출할 파일명
	}
	
	@RequestMapping("/join2.do")
	public String main1(Model model) throws Exception {

		return "/join2"; // WEB-INF에서 호출할 파일명
	}
	
	
	 @RequestMapping("/login.do") 
	    public String login(Model model) throws Exception{
	    	// 세션에 넣었던 값들 꺼내서 remove
	    	String id = (String)session.getAttribute("id");  
	    	session.removeAttribute("id");

	    	// 제거
	    	session.invalidate();	
	    	return "/login"; // WEB-INF에서 호출할 파일명
	    }
	    @RequestMapping("/searchid.do") 
	    public String searchid(Model model) throws Exception{
	    	return "/search_id"; // WEB-INF에서 호출할 파일명
	    }
	    @RequestMapping("/searchpw.do") 
	    public String searchpw(Model model) throws Exception{
	    	return "/search_pw"; // WEB-INF에서 호출할 파일명
	    }
	    
	  
	    
	    // 데이터 호출
	    @RequestMapping(value = "/login.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String login(Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam HashMap<String, Object> map) throws Exception{
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			Join user = joinService.selectLoginList(map);
			
			if( user != null) {
				session.setAttribute("userVO", new Gson().toJson(user)); // Join type의 VO안의 객체 전체를 userVO에 넣는 과정. Vue문법에 따라 Json에 넣어줘야함.(Dalseok)
				session.setMaxInactiveInterval(60*60); // 1시간 이후 자동 로그아웃 설정(Dalseok)
				
				session.setAttribute("userIdSession", user.getId());
				session.setAttribute("userNameSession", user.getName());
				session.setAttribute("KindSession", user.getKind());
				session.setAttribute("userAccSession", user.getAcc());
				session.setAttribute("userPhonenumSession", user.getPhonenum());
				session.setAttribute("userFrontregisnumSession", user.getFrontregisnum());
		    	session.setAttribute("userAfterregisnumSession", user.getAfterregisnum());
		    	session.setAttribute("userAddressSession", user.getAddress());
		    	session.setAttribute("userNicknameSession", user.getNickname());
		    	
		    	session.setAttribute("userResnameSession", user.getResname());
				session.setAttribute("userResnumSession", user.getResnum());
				session.setAttribute("userReskindSession", user.getReskind());
				session.setAttribute("userResregionSession", user.getRegion());
				session.setAttribute("userResphone", user.getResphone());
				session.setAttribute("userResad", user.getResad());
		    	
				resultMap.put("user", user);
				resultMap.put("result", "success");
			} else {
	 			resultMap.put("result", "fail");
	 		}
	 		return new Gson().toJson(resultMap);
		}	
		
		// 데이터 호출
		@RequestMapping(value = "/searchid.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String searchid(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			List<Join> list = joinService.searchid(map); // DB 접근 및 쿼리를 통한 데이터 호출 
			if(list.size()>0) {
				resultMap.put("result", "success");
			}else {
				resultMap.put("result", "fail");
			}
			resultMap.put("list", list);
			return new Gson().toJson(resultMap);
		}
	
	@RequestMapping("/datachange.do")
	public String main2(Model model,HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
    	String id = (String)session.getAttribute("userIdSession");
    	String name = (String)session.getAttribute("userNameSession");
    	int frontregisnum = (Integer)session.getAttribute("userFrontregisnumSession");
    	int afterregisnum = (Integer)session.getAttribute("userAfterregisnumSession");
        String add = (String)session.getAttribute("userAddSession");
        
    	request.setAttribute("userId", id);
    	request.setAttribute("userName", name);
    	request.setAttribute("userFrontregisnum", frontregisnum);
    	request.setAttribute("userafterregisnum", afterregisnum);
    	request.setAttribute("userAdd", add);
    	
		return "/datachange"; // WEB-INF에서 호출할 파일명
	}
	@RequestMapping("/datachange2.do")
	public String main3(Model model,HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
    	String id = (String)session.getAttribute("userIdSession");
    	String name = (String)session.getAttribute("userNameSession");
    	int frontregisnum = (Integer)session.getAttribute("userFrontregisnumSession");
    	int afterregisnum = (Integer)session.getAttribute("userAfterregisnumSession");
        String add = (String)session.getAttribute("userAddSession");
        
    	request.setAttribute("userId", id);
    	request.setAttribute("userName", name);
    	request.setAttribute("userFrontregisnum", frontregisnum);
    	request.setAttribute("userafterregisnum", afterregisnum);
    	request.setAttribute("userAdd", add);
		return "/datachange2"; // WEB-INF에서 호출할 파일명
	}
	
	@RequestMapping("/searchpwdchange.do") 
	    public String searchpwchange(Model model,HttpServletRequest request, HttpServletResponse response) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
    	String id = (String)session.getAttribute("userId1Session");
    	
    	request.setAttribute("userId1", id);
	    	return "/search_pwdchange"; // WEB-INF에서 호출할 파일명
	}
	    
	
	@RequestMapping(value = "/join/get.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
 	@ResponseBody
 	public String searchBbsList1(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
 		HashMap<String, Object> resultMap = new HashMap<String, Object>();
 	    int num = joinService.getMemberList(map);
 	    int num2 = joinService.getRes(map);
 		if(num>0) {
 			resultMap.put("result", "success");
 		}else {
 			resultMap.put("result", "fail");
 		}
 		resultMap.put("list", num);
 		resultMap.put("list", num2);
 		return new Gson().toJson(resultMap);
 	}
	
	
    //아이디 중복확인
    @RequestMapping(value = "/join/check.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
 	@ResponseBody
 	public String check(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
 		HashMap<String, Object> resultMap = new HashMap<String, Object>();
 		int num = joinService.getCheck(map);
 		resultMap.put("num", num);
 		return new Gson().toJson(resultMap);
 	}
    
    //닉네임 중복확인
    @RequestMapping(value = "/join/nickcheck.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
 	@ResponseBody
 	public String nickcheck(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
 		HashMap<String, Object> resultMap = new HashMap<String, Object>();
 		int num = joinService.getnickCheck(map);
 		resultMap.put("num", num);
 		return new Gson().toJson(resultMap);
 	}
    
    //사업자 중복확인
    @RequestMapping(value = "/join/resnumcheck.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
 	@ResponseBody
 	public String resnumcheck(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
 		HashMap<String, Object> resultMap = new HashMap<String, Object>();
 		int num = joinService.getresnumCheck(map);
 		resultMap.put("num", num);
 		return new Gson().toJson(resultMap);
 	}
	// 데이터 호출
	@RequestMapping(value = "/searchpw.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchpw(Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam HashMap<String, Object> map) throws Exception{
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Join user = joinService.searchpw(map);
		
		if(user != null) {
			session.setAttribute("userId1Session", user.getId());
			session.setAttribute("NameSession", user.getName());
			
			resultMap.put("user", user);
			resultMap.put("result", "success");
		} else {
 			resultMap.put("result", "fail");
 		}
		
 		return new Gson().toJson(resultMap);
	}
	

	
	//선생님 버전
	@RequestMapping(value = "/searchpwdchange.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String pwdchange(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		joinService.pwdchange(map);
		resultMap.put("message, ", "성공");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/datachange.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String datachange(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		joinService.datachange(map);
		resultMap.put("message, ", "성공");
		return new Gson().toJson(resultMap);
	}

}
