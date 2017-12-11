package com.stk.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.stk.entity.Carousel;
import com.stk.entity.Series;
import com.stk.entity.Type;
import com.stk.service.SelTypeService;

@Controller
public class HsController {
	protected Logger log = Logger.getLogger(SelMuluController.class);
	@Autowired
	private SelTypeService selTypeService;
  
	@RequestMapping(value="/geter")
	@ResponseBody
	public List<Type> geter(Map<String, Object> map,@RequestParam(value="id") Integer id) {
			List<Type> type2 = null;
			type2=selTypeService.getMulver(id);
			return type2;	
	}
	@RequestMapping(value="/addfirstmenu")
	@ResponseBody
	public String addfirstmenu(Map<String, Object> map,Type type) {
			try {
				selTypeService.addtypeyi(type);
			} catch (Exception e) {
				// TODO: handle exception
				return "false";
			}
			return "ok";
	}
	
	
	@RequestMapping(value="/addsecondmenu")
	@ResponseBody
	public String addsecondmenu(Map<String, Object> map,Type type) {
			try {
				selTypeService.addtypeer(type);
			} catch (Exception e) {
				// TODO: handle exception
				return "false";
			}
			return "ok";
	}
	@RequestMapping(value="/addthirdmenu")
	@ResponseBody
	public String addthirdmenu(Map<String, Object> map,Type type) {
		try {
			selTypeService.addtypesan(type);
		} catch (Exception e) {
			// TODO: handle exception
			return "false";
		}
		return "ok";
	}
	
	@RequestMapping(value="/hs",produces="text/html;charset=UTF-8")
	public String menuindex(Map<String, Object> map) {
		List<Type> type;
		int id = 0;
		type = selTypeService.getMulvyi(id);
		map.put("type", type);
		
		return "back/back.jsp";
	}
}
