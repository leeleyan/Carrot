package com.example.demo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.UnregisterMapper;
import com.example.demo.model.Unregister;


@Service //서비스임을 선언
public class UnregisterServiceImpl implements UnregisterService{

	@Autowired //Mapper와 연결
	private UnregisterMapper unregisterMapper;

	// 인터페이스 구체화
	@Override
	public List<Unregister> selectUnregisterList() throws Exception {
		// TODO Auto-generated method stub
		return unregisterMapper.selectUnregisterList(); // db를 호출하는 mapper와 연결
	}
}