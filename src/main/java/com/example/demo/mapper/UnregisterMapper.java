package com.example.demo.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Member;
import com.example.demo.model.Unregister;


@Mapper
public interface UnregisterMapper {
	List<Unregister> selectUnregisterList() throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
	Member getInfo(HashMap<String, Object> map) throws Exception;
	int deleteUser(HashMap<String, Object> map);
	int selectPasswordCheck(HashMap<String, Object> map);
}
