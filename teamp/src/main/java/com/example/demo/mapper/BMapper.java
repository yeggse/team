
  package com.example.demo.mapper;
  
  import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.B;
  
  
  @Mapper public interface BMapper { 
	  // 메뉴 추가 // 
	  void  addMenu(HashMap<String, Object> map); //insert 
	  
	  // 메뉴 이미지 추가 
	  void  insertMenuImg(HashMap<String, Object> map);
  
	  // 메뉴 상세보기
	  B selectGetMenu(HashMap<String, Object>map); // delete 
	  
}
