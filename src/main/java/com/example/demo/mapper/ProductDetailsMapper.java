package com.example.demo.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Product;


@Mapper
public interface ProductDetailsMapper {
	Product selectGetItem(HashMap<String, Object> map);
	List<Product> selectImgList(HashMap<String, Object> map) throws Exception; //제품상세 이미지
}
