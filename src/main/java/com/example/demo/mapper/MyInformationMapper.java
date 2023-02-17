package com.example.demo.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Member;


@Mapper
public interface MyInformationMapper {
	//내 정보 가져오기
	Member getInfo(HashMap<String, Object> map) throws Exception; 
	//전화번호 바꾸기
	void updateTel(HashMap<String, Object> map);
	//계정에서 닉네임 바꾸기
	void editNickName(HashMap<String, Object> map);
	//이메일 바꾸기
	void editEmail(HashMap<String, Object> map);
	//account 테이블 닉네임 바꿀 때 product 테이블 닉네임 바꾸기
	void updateNick(HashMap<String, Object> map);
}
