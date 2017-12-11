package com.stk.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.stk.entity.Carousel;
import com.stk.entity.Series;
import com.stk.entity.Type;
import com.stk.service.SelTypeService;

@Controller
public class UpdateTypeController {
	protected Logger log = Logger.getLogger(SelMuluController.class);
	@Autowired
	private SelTypeService selTypeService;
	
	//注入model
	@ModelAttribute
	public void getType(
			@RequestParam(value = "ID", required = false) Integer ID,
			Map<String, Object> map) {
		if (ID != null) {
			map.put("type", selTypeService.upgetMulvyi(ID));
		}
	}
	//得到下一级菜单信息
	@RequestMapping(value="/getyi")
	@ResponseBody
	public Type getyi(@RequestParam(value="id") Integer  id) {
	
		Type ty= selTypeService.upgetMulvyi(id);
		
		return ty;
		
		
		
	}
	
	//update type页面(通用)
	@RequestMapping(value="/upfirstmenu")
	@ResponseBody
	public String upfirstmenu(Map<String, Object> map,Type type) {
		try {
			log.info(type.getID()+"66666666666666666666666666666666666666666666666666666666666666666666");
			selTypeService.uptypeyi(type);
		} catch (Exception e) {
			// TODO: handle exception
			return "false";
		}
			
		return "ok";
		
		
		
	}
//	
//	
//	@RequestMapping(value="/addsecondmenu")
//	@ResponseBody
//	public String addsecondmenu(Map<String, Object> map,Type type) {
//		try {
//			selTypeService.addtypeer(type);
//		} catch (Exception e) {
//			// TODO: handle exception
//			return "false";
//		}
//		
//		
//		
//		return "ok";
//		
//		
//		
//	}
//	
//	
//	@RequestMapping(value="/addthirdmenu")
//	@ResponseBody
//	public String addthirdmenu(Map<String, Object> map,Type type) {
//		try {
//			selTypeService.addtypesan(type);
//		} catch (Exception e) {
//			// TODO: handle exception
//			return "false";
//		}
//		
//		
//		
//		return "ok";
//		
//		
//		
//	}
//	
	
	//初始化update type页面
	@RequestMapping(value="/uptype",produces="text/html;charset=UTF-8")
	public String menuindex(Map<String, Object> map) {
		int id = 0;
		List<Type> type;
		type = selTypeService.getMulvyi(id);
		

		 map.put("type", type);
		
		 
		 
		
		 
		 return "back/uptype.jsp";
		 
	
	}
	
	


}
