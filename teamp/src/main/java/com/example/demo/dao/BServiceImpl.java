
package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.BMapper;
import com.example.demo.model.B;

@Service // 서비스임을 선언
public class BServiceImpl implements BService {

	@Autowired 	// Mapper와 연결
	private BMapper bMapper;

	// 메뉴 추가
	@Override
	public void addMenu(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		bMapper.addMenu(map); // 추가만 존재함으로 return이 필요 없다!
	}

	// 메뉴 이미지 추가
	@Override
	public void insertMenuImg(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		bMapper.insertMenuImg(map);
	}
	
	// 메뉴 상세보기
	@Override
	public HashMap<String, Object> detailMenu(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		// 조회수 
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		//bMapper.updateCnt(map);
		//List<B> commentList = bMapper.selectCommentList(map);
		B board = bMapper.detailMenu(map);
		//resultMap.put("commentList", commentList);
		resultMap.put("board", board);
		return resultMap;
	}

}
