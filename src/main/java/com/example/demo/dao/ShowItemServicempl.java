package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.ShowItemMapper;
import com.example.demo.model.Showitem;

@Service //서비스임을 선언
public class ShowItemServicempl implements ShowItemService{

	@Autowired //Mapper와 연결
	private ShowItemMapper showItemMapper;

	// 인터페이스 구체화
	@Override
	public List<Showitem> selectGetItemList(HashMap<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return showItemMapper.selectGetItemList(map); // db를 호출하는 mapper와 연결
	}
}