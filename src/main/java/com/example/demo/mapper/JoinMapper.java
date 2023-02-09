package com.example.demo.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import jakarta.persistence.criteria.Join;


@Mapper
public interface JoinMapper {
	List<Join> selectJoinList(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
	int insertMember(HashMap<String, Object> map);
	int selectMemberCheck(HashMap<String, Object> map);


}
