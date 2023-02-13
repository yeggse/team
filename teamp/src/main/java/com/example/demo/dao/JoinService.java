package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import com.example.demo.model.Join;

public interface JoinService {
     int getMemberList(HashMap<String, Object> map);
     int getCheck(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
     int getnickCheck(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
     List<Join> searchpw(HashMap<String, Object> map) throws Exception; 
     
//     int pwdchange(HashMap<String, Object> map);
     List<Join> pwdchange(HashMap<String, Object> map);
}
