package com.example.demo.controller;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.dao.AddService;
import com.example.demo.dao.AreaService;
import com.example.demo.model.Area;
import com.example.demo.model.Member;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller 
public class AddController {
	// Service 인터페이스 객체 생성 및 연결
    @Autowired
    private AddService addService; 
    
    @Autowired
    private AreaService areaService;
    
    @Autowired
    HttpSession session;
    
    @RequestMapping("/add.do") // 회원가입 화면
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
	    	String id = (String)session.getAttribute("userIdSession");
	    	request.setAttribute("map", map);
	        request.setAttribute("userId", id);
	    	return "/add"; // WEB-INF에서 호출할 파일명
   } 
    
    @RequestMapping(value = "/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String add(Model model, @RequestParam HashMap<String, Object> map ) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		String img = (String) map.get("img");
		addService.insertBoard(map);
		resultMap.put("message", "성공");
		resultMap.put("boardIdx", map.get("id"));
		return new Gson().toJson(resultMap);
	} 
	 
	 @RequestMapping("/upload")
	    public String result(@RequestParam("file1") MultipartFile multi, @RequestParam("boardIdx") int boardIdx, HttpServletRequest request,HttpServletResponse response, Model model)
	    {
	        String url = null;
	        String path="c:\\img";
	        try {
	 
	            //String uploadpath = request.getServletContext().getRealPath(path);
	            String uploadpath = path;
	            String originFilename = multi.getOriginalFilename();
	            String extName = originFilename.substring(originFilename.lastIndexOf("."),originFilename.length());
	            long size = multi.getSize();
	            String saveFileName = genSaveFileName(extName);
	            
	            System.out.println("uploadpath : " + uploadpath);
	            
	            System.out.println("originFilename : " + originFilename);
	            System.out.println("exten3sionName : " + extName);
	            System.out.println("size : " + size);
	            System.out.println("saveFileName : " + saveFileName);
	            String path2 = System.getProperty("user.dir");
	            System.out.println("Working Directory = " + path2 + "src\\webapp\\img");
	            if(!multi.isEmpty())
	            {
	                File file = new File(path2 + "\\src\\main\\webapp\\img", saveFileName);
	                multi.transferTo(file);
	                
	                HashMap<String, Object> map = new HashMap<String, Object>();
	                map.put("img", "\\img\\" + saveFileName);
	                map.put("boardIdx", boardIdx);
	        		addService.insertBoardImg(map);
	                
	                model.addAttribute("filename", multi.getOriginalFilename());
	                model.addAttribute("uploadPath", file.getAbsolutePath());
	                
	                return "filelist";
	            }
	        }catch(Exception e)
	        {
	            System.out.println(e);
	        }
	        return "redirect:add.do";
	    }
	    
	    // 현재 시간을 기준으로 파일 이름 생성
	    private String genSaveFileName(String extName) {
	        String fileName = "";
	        
	        Calendar calendar = Calendar.getInstance();
	        fileName += calendar.get(Calendar.YEAR);
	        fileName += calendar.get(Calendar.MONTH);
	        fileName += calendar.get(Calendar.DATE);
	        fileName += calendar.get(Calendar.HOUR);
	        fileName += calendar.get(Calendar.MINUTE);
	        fileName += calendar.get(Calendar.SECOND);
	        fileName += calendar.get(Calendar.MILLISECOND);
	        fileName += extName;
	        
	        return fileName;
	    }
	    
	    @RequestMapping(value = "/add/get.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		 @ResponseBody
		 public String login(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
	 		HashMap<String, Object> resultMap = new HashMap<String, Object>();
	 		Member user = addService.getInfo(map);
	 		resultMap.put("nickname", user.getuNickname());
	 		return new Gson().toJson(resultMap);
	 	}
	
}