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

import com.example.demo.dao.PwFindService;
import com.example.demo.model.PwFind;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpSession;


@Controller 
public class PwFindController {
	// Service 인터페이스 객체 생성 및 연결
    @Autowired
    private PwFindService pwfindService; 

	 @RequestMapping("/pwfind.do") // 비밀번호 찾기 화면
     public String join(Model model) throws Exception{

		 return "/pwfind"; // WEB-INF에서 호출할 파일명
    } 
	 
	 @Autowired
	 HttpSession session; 
	 
	 @RequestMapping(value = "/pwfind/get.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	 	@ResponseBody
	 	public String searchBbsList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
	 		HashMap<String, Object> resultMap = new HashMap<String, Object>();
	 		List<PwFind> list = pwfindService.selectPwFindList(map);
	 		if(list.size() > 0) {
	 			resultMap.put("result", "success");
	 		} else {
	 			resultMap.put("result", "fail");
	 		}
	 		resultMap.put("list", list);
	 		
	 		
	 		return new Gson().toJson(resultMap);
	 	} 
}