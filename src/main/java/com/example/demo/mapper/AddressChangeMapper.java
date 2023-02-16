package com.example.demo.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface AddressChangeMapper {
	void updateAddress(HashMap<String, Object> map);
	
}
