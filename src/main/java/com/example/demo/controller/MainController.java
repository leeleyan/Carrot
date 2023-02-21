package com.example.demo.controller;

import java.util.ArrayList;
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
import com.example.demo.model.Product;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {
	
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
        map.put("dong", guList.get(0).getDong());
    	request.setAttribute("siList",  new Gson().toJson(siList));
    	request.setAttribute("guList",  new Gson().toJson(guList));
    	request.setAttribute("dongList",  new Gson().toJson(dongList));
    	
    	ArrayList<Integer> re = (ArrayList<Integer>) session.getAttribute("re"); 
        if (re == null) {
        	re = new ArrayList<Integer>();
        }
        //reIndex 도 if 안에 넣어서 만들어줘야함
        session.setAttribute("re", re);
    	
		return "/main2"; // WEB-INF에서 호출할 파일명
	}
	
	//메인에서 제품들 불러오기
	@RequestMapping(value = "/main/view.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String view(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Product> list = mainService.selectGetItemList(map);
		for(int i=0; i<list.size();i++) {
			list.get(i).setImg(mainService.selectImg(list.get(i).getBoardIdx()));
		}
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	//내정보에서 내가 쓴 판매글
	@RequestMapping(value = "/main/myview.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String myview(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Product> list = mainService.selectGetMyItemList(map);
		for(int i=0; i<list.size();i++) {
			list.get(i).setImg(mainService.selectImg(list.get(i).getBoardIdx()));
		}
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/search.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchArea(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Product> list = mainService.searchArea(map);
		for(int i=0; i<list.size();i++) {
			list.get(i).setImg(mainService.selectImg(list.get(i).getBoardIdx()));
		}
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	
	@RequestMapping(value = "/searchTitle.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchTitle(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		String keyword = (String)map.get("keyword");
		List<Product> list = mainService.searchTitle(map);
		
		for(int i=0; i<list.size();i++) {
			list.get(i).setImg(mainService.selectImg(list.get(i).getBoardIdx()));
		}
		
		if (list.size()==0) {
			list = mainService.searchArea(map);
			for(int i=0; i<list.size();i++) {
				list.get(i).setImg(mainService.selectImg(list.get(i).getBoardIdx()));
			}
		}
		
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
}