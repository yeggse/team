package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.BoardMapper;
import com.example.test1.model.Board;

@Service //서비스임을 선언
public class BoardServiceImpl implements BoardService{

	@Autowired //Mapper와 연결
	private BoardMapper boardMapper;

	@Override
	public List<Board> selectBoardList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
		return boardMapper.selectBoardList(map);
	}
	@Override
	public int selectBoardCnt() {
		return boardMapper.selectBoardCnt();
	}
	@Override
	public void deleteBoard(HashMap<String, Object> map) {
		boardMapper.deleteBoard(map);
	}
	
	@Override
	public void updateBoard(HashMap<String, Object> map) {
		boardMapper.updateBoard(map);
	}
	
	@Override
	public void insertBoard(HashMap<String, Object> map) {
		boardMapper.insertBoard(map);
	}
	
	@Override
	public void insertBoardImg(HashMap<String, Object> map) {
		boardMapper.insertBoardImg(map);
	}
	
	@Override
	public HashMap<String, Object> selectGetBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		// 조회수 
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		boardMapper.updateCnt(map);
		List<Board> commentList = boardMapper.selectCommentList(map);
		Board board = boardMapper.selectGetBoard(map);
		resultMap.put("commentList", commentList);
		resultMap.put("board", board);
		return resultMap;
	}
	
	@Override
	public void insertComment(HashMap<String, Object> map) {
		boardMapper.insertComment(map);
	}
	
	@Override
	public List<Board> selectCommentList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.selectCommentList(map);
	}
}