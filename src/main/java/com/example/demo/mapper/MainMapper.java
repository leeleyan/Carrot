package com.example.demo.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Product;


@Mapper
public interface MainMapper {
	List<Product> selectGetItemList(HashMap<String, Object> map);
}
