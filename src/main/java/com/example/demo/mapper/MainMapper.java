package com.example.demo.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Product;


@Mapper
public interface MainMapper {
	List<Product> selectGetItemList(HashMap<String, Object> map);
	List<Product> selectGetMyItemList(HashMap<String, Object> map);
	List<Product> searchArea(HashMap<String, Object> map);
	List<Product> searchTitle(HashMap<String, Object> map);
	List<Product> selectImgList(HashMap<String, Object> map) throws Exception;
	String selectImg(int idx);
}
