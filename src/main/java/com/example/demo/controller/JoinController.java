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

import com.example.demo.dao.JoinService;
import com.google.gson.Gson;

import jakarta.persistence.criteria.Join;


@Controller 
public class JoinController {
	// Service 인터페이스 객체 생성 및 연결
    @Autowired
    private JoinService joinService; 

	 @RequestMapping("/join2.do") // 회원가입 화면
     public String join(Model model) throws Exception{

		 return "/join"; // WEB-INF에서 호출할 파일명
    } 
	
	 @RequestMapping(value = "/join2/get.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	 	@ResponseBody
	 	public String searchBbsList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
	 		HashMap<String, Object> resultMap = new HashMap<String, Object>();
	 		List<Join> list = joinService.selectJoinList(map);
	 		if(list.size() > 0) {
	 			resultMap.put("result", "success");
	 		} else {
	 			resultMap.put("result", "fail");
	 		}
	 		resultMap.put("list", list);
	 		return new Gson().toJson(resultMap);
	 	}
	 
	 @RequestMapping(value = "/join2/idcheck.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	 	@ResponseBody
	 	public String check(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
	 		HashMap<String, Object> resultMap = new HashMap<String, Object>();
	 		int num = joinService.getMemberCheck(map);
	 		resultMap.put("num", num);
	 		return new Gson().toJson(resultMap);
	 	}
	 
	 @RequestMapping(value = "/join2/nicknamecheck.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	 	@ResponseBody
	 	public String check2(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
	 		HashMap<String, Object> resultMap = new HashMap<String, Object>();
	 		int num = joinService.getMemberCheck(map);
	 		resultMap.put("num", num);
	 		return new Gson().toJson(resultMap);
	 	}
	 
	 @RequestMapping(value = "/join2/emailcheck.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	 	@ResponseBody
	 	public String check3(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
	 		HashMap<String, Object> resultMap = new HashMap<String, Object>();
	 		int num = joinService.getMemberCheck(map);
	 		resultMap.put("num", num);
	 		return new Gson().toJson(resultMap);
	 	}
}