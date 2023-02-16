
  package com.example.demo.dao;
  
  import java.util.HashMap;
import java.util.List;

import com.example.demo.model.Consumer;
  
  
  public interface ConsumerService { 
	  // 예약 내역 출력 
	  List<Consumer> ReserveList(HashMap<String, Object> map) throws Exception;
}
 