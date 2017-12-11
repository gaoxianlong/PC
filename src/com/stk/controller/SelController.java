package com.stk.controller;

import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.stk.entity.Series;
import com.stk.entity.Type;
import com.stk.service.SelTypeService;

@Controller
public class SelController {

	@Autowired
	private SelTypeService selTypeService;

	@RequestMapping(value = "/getMulujson")
	@ResponseBody
	public List basics(Map<String, Object> map) {
		
		    List<Type> list_all=selTypeService.getMulvtotal();  
		    ArrayList as=new ArrayList();
		   
		    List<Type> treeNodes=null;
		    treeNodes=JsonTreeFactory.buildtree(list_all,0); 
		    as.addAll(treeNodes);
		    map.put("json", "123456");
		 return as;
	}

//	@RequestMapping(value = "/getMulujsonjson")
//	@ResponseBody
//	public String basics(Map<String, Object> map) {
//		
//		    List<Type> list_all=selTypeService.getMulvtotal();  
//		    
//		    List<Type> treeNodes=null;
//		    treeNodes=JsonTreeFactory.buildtree(list_all,0); 
//		    map.put("json", treeNodes);
//		 return "page/json.jsp";
//	}
}
