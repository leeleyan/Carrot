package com.example.demo.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Member;


@Mapper
public interface LoginMapper {
	Member getMember(HashMap<String, Object> map);
}
