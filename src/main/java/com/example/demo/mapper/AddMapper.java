package com.example.demo.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;



@Mapper
public interface AddMapper {
	// 이미지 삽입
	void insertBoardImg(HashMap<String, Object> map);
	// 삽입
	void insertBoard(HashMap<String, Object> map);
}
