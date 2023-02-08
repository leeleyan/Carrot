package com.example.demo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.MainMapper;
import com.example.demo.model.Main;


@Service //서비스임을 선언
public class MainServiceImpl implements MainService{

	@Autowired //Mapper와 연결
	private MainMapper mainMapper;

	// 인터페이스 구체화
	@Override
	public List<Main> selectMainList() throws Exception {
		// TODO Auto-generated method stub
		return mainMapper.selectMainList(); // db를 호출하는 mapper와 연결
	}
}