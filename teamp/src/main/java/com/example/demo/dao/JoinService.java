package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import com.example.demo.model.Join;
import com.example.demo.model.Login;

public interface JoinService {
     int getMemberList(HashMap<String, Object> map);
     int getCheck(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
}
