package com.example.demo.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Member;


@Mapper
public interface UnregisterMapper {
	List<Member> selectUnregisterList() throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
	Member getInfo(HashMap<String, Object> map) throws Exception;
	int deleteUser(HashMap<String, Object> map); // 정보 삭제
	int deleteUser2(HashMap<String, Object> map); // 게시물 삭제
	int deleteUser3(HashMap<String, Object> map); // 이미지 삭제
	int deleteUser4(HashMap<String, Object> map); // 쪽지 삭제
	int selectPasswordCheck(HashMap<String, Object> map);
}
