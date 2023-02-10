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
import com.example.demo.dao.JoinService;
import com.example.demo.model.Area;
import com.google.gson.Gson;

import jakarta.persistence.criteria.Join;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@Controller 
public class JoinController {
	// Service 인터페이스 객체 생성 및 연결
    @Autowired
    private JoinService joinService; 
    @Autowired
    private AreaService areaService;
    
	 @RequestMapping("/join2.do") // 회원가입 화면
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
		 return "/join"; // WEB-INF에서 호출할 파일명
    } 
	 // 회원가입
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
	 // 아이디 중복 체크
	 @RequestMapping(value = "/join2/idcheck.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	 	@ResponseBody
	 	public String check(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
	 		HashMap<String, Object> resultMap = new HashMap<String, Object>();
	 		int num = joinService.getMemberCheck(map);
	 		resultMap.put("num", num);
	 		return new Gson().toJson(resultMap);
	 	}
	 // 닉네임 중복 체크
	 @RequestMapping(value = "/join2/nicknamecheck.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	 	@ResponseBody
	 	public String check2(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
	 		HashMap<String, Object> resultMap = new HashMap<String, Object>();
	 		int num = joinService.getMemberCheck2(map);
	 		resultMap.put("num", num);
	 		return new Gson().toJson(resultMap);
	 	}
	 // 이메일 중복 체크
	 @RequestMapping(value = "/join2/emailcheck.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	 	@ResponseBody
	 	public String check3(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
	 		HashMap<String, Object> resultMap = new HashMap<String, Object>();
	 		int num = joinService.getMemberCheck3(map);
	 		resultMap.put("num", num);
	 		return new Gson().toJson(resultMap);
	 	}
	 // 회원가입
	 @RequestMapping(value = "/join2/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	 	@ResponseBody
	 	public String add(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
	 		HashMap<String, Object> resultMap = new HashMap<String, Object>();
	 		int num = joinService.addMember(map);
	 		if(num > 0) {
	 			resultMap.put("result", "success");
	 		} else {
	 			resultMap.put("result", "fail");
	 		}
	 		return new Gson().toJson(resultMap);
	 	}
	 
	 	@RequestMapping(value = "/gu/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String gu(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			List<Area> guList = areaService.selectGuList(map);
			resultMap.put("guList", guList);
			return new Gson().toJson(resultMap);
		}
		
		@RequestMapping(value = "/dong/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String dong(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			List<Area> dongList = areaService.selectDongList(map);
			resultMap.put("dongList", dongList);
			return new Gson().toJson(resultMap);
		}
	 
}