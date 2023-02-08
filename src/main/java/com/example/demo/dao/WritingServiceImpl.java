package com.example.demo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.WritingMapper;
import com.example.demo.model.Writing;


@Service //서비스임을 선언
public class WritingServiceImpl implements WritingService{

	@Autowired //Mapper와 연결
	private WritingMapper writingMapper;

	// 인터페이스 구체화
	@Override
	public List<Writing> selectWritingList() throws Exception {
		// TODO Auto-generated method stub
		return writingMapper.selectWritingList(); // db를 호출하는 mapper와 연결
	}
}