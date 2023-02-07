package com.example.demo.dao;

import java.util.List;

import com.example.demo.model.Board;


public interface BoardService {
	List<Board> selectBoardList() throws Exception; // 데이터 호출을 위한 인터페이스
}
