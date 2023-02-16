package com.example.demo.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Message;


@Mapper
public interface WritingMapper {
	
	int insertMessage(HashMap<String, Object> map) throws Exception;
}
