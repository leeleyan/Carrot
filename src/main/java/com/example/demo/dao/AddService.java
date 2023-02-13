package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import com.example.demo.model.Add;


public interface AddService {
	List<Add> selectAddList() throws Exception; // 데이터 호출을 위한 인터페이스
	// 이미지 삽입
	void insertBoardImg(HashMap<String, Object> map);
	void insertBoard(HashMap<String, Object> map);
	
}
