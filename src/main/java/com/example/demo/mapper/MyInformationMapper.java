package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.MyInformation;


@Mapper
public interface MyInformationMapper {
	List<MyInformation> selectMyInformationList() throws Exception; // xml파일 접근 및 db 호출결과 리턴 받음
}
