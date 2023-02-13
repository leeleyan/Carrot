package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dao.AreaService;
import com.example.demo.dao.MyInformationService;
import com.example.demo.model.Area;
import com.example.demo.model.Member;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@Controller 
public class MyInformationController {
	// Service 인터페이스 객체 생성 및 연결
    @Autowired
    private MyInformationService myInformationService; 
    
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
	 
	 
	 @RequestMapping(value = "/myinfo/get.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	 @ResponseBody
	 public String login(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
 		HashMap<String, Object> resultMap = new HashMap<String, Object>();
 		Member user = myInformationService.getInfo(map);
 		resultMap.put("name", user.getuName());
 		resultMap.put("tel", user.getuTel());
 		resultMap.put("address", user.getuAddress());
 		resultMap.put("email", user.getuEmail());
 		return new Gson().toJson(resultMap);
 	}
	 @RequestMapping(value = "/myinfo/updatetel.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String edit(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			myInformationService.updateTel(map);
			resultMap.put("message", "성공");
			return new Gson().toJson(resultMap);
		}
	 
}