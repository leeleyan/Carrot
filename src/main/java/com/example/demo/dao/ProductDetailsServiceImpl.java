package com.example.demo.dao;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.ProductDetailsMapper;
import com.example.demo.model.Product;


@Service //서비스임을 선언
public class ProductDetailsServiceImpl implements ProductDetailsService{

	@Autowired 
	private ProductDetailsMapper productDetailsMapper;

	@Override
	public HashMap<String, Object> selectGetItem(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Product product = productDetailsMapper.selectGetItem(map);
		resultMap.put("product", product);
		return resultMap;
	}

}