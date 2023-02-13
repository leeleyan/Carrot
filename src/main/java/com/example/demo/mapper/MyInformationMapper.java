package com.example.demo.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Member;


@Mapper
public interface MyInformationMapper {
	Member getInfo(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음

	void updateTel(HashMap<String, Object> map);
}
