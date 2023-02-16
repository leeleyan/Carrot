package com.example.demo.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Member;


@Mapper
public interface PasswordChangeMapper {
	Member getInfo(HashMap<String, Object> map) throws Exception;
	void updatePassword(HashMap<String, Object> map);
	
}
