package com.example.demo.dao;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.AddressChangeMapper;


@Service 
public class AddressChangeServiceImpl implements AddressChangeService{

	@Autowired 
	private AddressChangeMapper addresschangeMapper;

	@Override
	public void updateAddress(HashMap<String, Object> map) {
		addresschangeMapper.updateAddress(map);
	}

}