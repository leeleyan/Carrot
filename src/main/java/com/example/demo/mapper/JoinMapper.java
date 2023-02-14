package com.example.demo.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Member;


@Mapper
public interface JoinMapper {
	List<Member> selectJoinList(HashMap<String, Object> map) throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
	int insertMember(HashMap<String, Object> map);
	int selectMemberCheck(HashMap<String, Object> map);
	int selectMemberCheck2(HashMap<String, Object> map);
	int selectMemberCheck3(HashMap<String, Object> map);
}
