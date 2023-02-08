package com.example.demo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.AddMapper;
import com.example.demo.model.Add;


@Service //서비스임을 선언
public class AddServiceImpl implements AddService{

	@Autowired //Mapper와 연결
	private AddMapper addMapper;

	// 인터페이스 구체화
	@Override
	public List<Add> selectAddList() throws Exception {
		// TODO Auto-generated method stub
		return addMapper.selectAddList(); // db를 호출하는 mapper와 연결
	}
}