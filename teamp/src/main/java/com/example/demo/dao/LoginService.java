package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import com.example.demo.model.Login;


public interface LoginService {
	Login selectLoginList(HashMap<String, Object> map) throws Exception; 
	List<Login> searchid(HashMap<String, Object> map) throws Exception; 
}
