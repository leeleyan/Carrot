package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dao.AreaService;
import com.example.demo.dao.MyInformationService;
import com.example.demo.model.Area;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@Controller 
public class MyInformationController {
	// Service 인터페이스 객체 생성 및 연결
    @Autowired
    private MyInformationService myinformationService; 
    
    @Autowired
    private AreaService areaService;
    
	 @RequestMapping("/myinformation.do") // 내정보 화면
     public String join(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		 HashMap<String, Object> map = new HashMap<String, Object>();
	 		List<Area> siList = areaService.selectSiList(map);
	        map.put("si", siList.get(0).getSi());
	        List<Area> guList = areaService.selectGuList(map);
	        map.put("gu", guList.get(0).getGu());
	        List<Area> dongList = areaService.selectDongList(map);
	    	request.setAttribute("siList",  new Gson().toJson(siList));
	    	request.setAttribute("guList",  new Gson().toJson(guList));
	    	request.setAttribute("dongList",  new Gson().toJson(dongList));
		 return "/myinformation"; // WEB-INF에서 호출할 파일명
    } 
	 
}