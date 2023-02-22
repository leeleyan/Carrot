package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import com.example.demo.model.Product;


public interface ProductDetailsService {
	HashMap<String, Object> selectGetItem(HashMap<String, Object> map);
	List<Product> selectImgList(HashMap<String, Object> map) throws Exception;
	void deleteItem(HashMap<String, Object> map);
}
