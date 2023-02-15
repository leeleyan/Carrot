package com.example.demo.dao;

import java.util.HashMap;

import com.example.demo.model.Product;


public interface ProductDetailsService {
	HashMap<String, Object> selectGetItem(HashMap<String, Object> map);
}
