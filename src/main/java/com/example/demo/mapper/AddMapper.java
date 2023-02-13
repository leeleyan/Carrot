package com.example.demo.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Add;


@Mapper
public interface AddMapper {
	List<Add> selectAddList() throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
	// 이미지 삽입
	void insertBoardImg(HashMap<String, Object> map);
	// 삽입
	void insertBoard(HashMap<String, Object> map);
}
