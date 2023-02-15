package com.example.demo.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Product;


@Mapper
public interface ProductDetailsMapper {
	Product selectGetItem(HashMap<String, Object> map);
}
