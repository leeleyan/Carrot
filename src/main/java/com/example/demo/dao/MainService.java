package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import com.example.demo.model.Product;


public interface MainService {
	List<Product> selectGetItemList(HashMap<String, Object> map) throws Exception; //메인에서 img 제외하고 검색
	
	List<Product> searchArea(HashMap<String, Object> map) throws Exception; //지역으로 검색
	
	List<Product> searchTitle(HashMap<String, Object> map) throws Exception; //헤더 검색바에서 검색
	
	List<Product> selectGetMyItemList(HashMap<String, Object> map) throws Exception; //자기상품보기
	
	String selectImg(int idx) throws Exception;
}
