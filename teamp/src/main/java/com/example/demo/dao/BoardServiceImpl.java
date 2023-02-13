package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.BoardMapper;
import com.example.demo.model.Board;


@Service //서비스임을 선언
public class BoardServiceImpl implements BoardService{

	@Autowired //Mapper와 연결
	private BoardMapper boardMapper;

	// 인터페이스 구체화
//	@Override
//	public List<Board> selectBoardList(HashMap<String, Object> map) throws Exception {
//		// TODO Auto-generated method stub
//		
//		return boardMapper.selectBoardList(map); // db를 호출하는 mapper와 연결
//	}
	

		// 게시글 기본 출력
		@Override
		public List<Board> firstBoard(HashMap<String, Object> map) throws Exception {
			// TODO Auto-generated method stub
			int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
			int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
			map.put("startNum", startNum);
			map.put("lastNum", lastNum);
			return boardMapper.firstBoardList(map);
		}
		
		// 게시글 상세 출력
		@Override
		public HashMap<String, Object> detailBoard(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			// 조회수 
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
		//	boardMapper.updateCnt(map);
		//	List<Board> commentList = boardMapper.selectCommentList(map);
			Board board = boardMapper.detailBoard(map);
		//	resultMap.put("commentList", commentList);
			resultMap.put("board", board);
			return resultMap;
		}

		
}