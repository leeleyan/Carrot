package com.example.demo.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.PwReset;


@Mapper
public interface PwResetMapper {
	List<PwReset> selectPwResetList() throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
	int pwdUpdate(HashMap<String, Object> map);
}
