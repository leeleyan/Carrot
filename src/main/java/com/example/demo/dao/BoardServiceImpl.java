package com.example.demo.dao;

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
	@Override
	public List<Board> selectBoardList() throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.selectBoardList(); // db를 호출하는 mapper와 연결
	}
}