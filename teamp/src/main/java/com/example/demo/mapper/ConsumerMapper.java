
  package com.example.demo.mapper;
  
  import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Consumer;
  
  
  @Mapper public interface ConsumerMapper { 
	  // 예약 내역 출력 
	  List<Consumer> ReserveList(HashMap<String, Object> map) throws Exception;
	  
	  
}
