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
import com.example.demo.dao.MainService;
import com.example.demo.model.Area;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {
	// Service 인터페이스 객체 생성 및 연결
	@Autowired
	private MainService mainService;
	
	@Autowired
    private AreaService areaService;
	
	@Autowired
	HttpSession session;

	@RequestMapping("/main.do") // 메인 화면
	public String join(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
 		List<Area> siList = areaService.selectSiList(map);
        map.put("si", siList.get(0).getSi());
        List<Area> guList = areaService.selectGuList(map);
        map.put("gu", guList.get(0).getGu());
        List<Area> dongList = areaService.selectDongList(map);
    	request.setAttribute("siList",  new Gson().toJson(siList));
    	request.setAttribute("guList",  new Gson().toJson(guList));
    	request.setAttribute("dongList",  new Gson().toJson(dongList));
		return "/main"; // WEB-INF에서 호출할 파일명
	}

}