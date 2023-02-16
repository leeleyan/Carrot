package com.example.demo.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Member;


@Mapper
public interface WritingMapper {
	Member getInfo(HashMap<String, Object> map) throws Exception;
	int insertMessage(HashMap<String, Object> map) throws Exception;
	int NicknameCheck(HashMap<String, Object> map);
}
