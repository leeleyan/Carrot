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

import com.example.demo.dao.ProductDetailsService;
import com.example.demo.model.Product;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller 
public class ProductDetailsController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	ProductDetailsService productDetailsService;
	
	 @RequestMapping("/productdetails.do") // 상품 정보 화면
     public String pdp(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		String indexString = map.get("boardIdx").toString();
		int tIndex = Integer.parseInt(indexString);
		ArrayList<Integer> re = (ArrayList<Integer>) session.getAttribute("re");
		if (!re.contains(tIndex)) {
		    re.add(tIndex);
		}
		session.setAttribute("re", re);
		return "/productdetails"; 
    } 
	 
 	@RequestMapping(value = "/product/details.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String details(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = productDetailsService.selectGetItem(map);
		List<Product> list = productDetailsService.selectImgList(map);
		resultMap.put("list", list);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	} 
}