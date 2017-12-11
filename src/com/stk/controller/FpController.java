package com.stk.controller;

import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
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
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.stk.entity.Series;
import com.stk.entity.Type;
import com.stk.service.SelTypeService;

@Controller
public class FpController {

	protected Logger log = Logger.getLogger(SelMuluController.class);
	@Autowired
	private SelTypeService selTypeService;

	@RequestMapping(value = "/getFpMulu")
	public String Fpcon(Map<String, Object> map) {
		List<Type> fptype=null;
		int preschid=188;
		int smallchid=189;
		
		List<Series> preSeries=null;
		List<Series> smallSeries=null;
		//扶贫小学目录
		fptype=selTypeService.getFpMulv(smallchid);
		//扶贫学前课程
		preSeries=selTypeService.getFppreSeries(preschid);
		//扶贫小学课程
		smallSeries=selTypeService.getFppreSeries(smallchid);
		int fpseriessmallnumber = smallSeries.size();
		
		map.put("fptype", fptype);
		map.put("preSeries", preSeries);
		
		map.put("smallSeries", smallSeries);
		map.put("fpseriessmallnumber", fpseriessmallnumber);
		   
		return "views/FP/fpindex.jsp";
	}
	
	@RequestMapping(value = "/getFpsort")
	public String Fpsort(Map<String, Object> map,
			@RequestParam(value = "sort", required = false) Integer sort,
			@RequestParam(value = "erid", required = false) Integer erid,
			@RequestParam(value = "yi", required = false) Integer yi,
			@RequestParam(value="startpage",required=false,defaultValue="1") Integer startpage) {
		
		int point=0;
		int point2=0;
		
		List<Type> fptype=null;
		int preschid=188;
		int smallchid=189;
		
		List<Series> preSeries=null;
		List<Series> smallSeries=null;
		List<Series> totalSeries=null;
		 if(sort==1){
			 if(yi==1){
				//扶贫小学目录
					 fptype=selTypeService.getFpMulv(smallchid);
					 PageHelper.startPage(startpage, 20);
					 preSeries=selTypeService.getFppreSeries(smallchid);
					 PageInfo<Series> pageInfo = new PageInfo<Series>(preSeries);
					 preSeries = pageInfo.getList();
					 
				 map.put("info", pageInfo);
				 map.put("preSeries", preSeries);
				 map.put("point", smallchid);
				 map.put("totall2", 11);
				 map.put("fptype", fptype);
				 map.put("yi", 1);
				 map.put("sor", 1);
			 }
			 
			 if(yi==2) 
			 {
				//扶贫学前课程
				 	PageHelper.startPage(startpage, 20);
					preSeries=selTypeService.getFppreSeries(preschid);
					PageInfo<Series> pageInfo = new PageInfo<Series>(preSeries);
					preSeries = pageInfo.getList();
					 
					map.put("info", pageInfo);
					map.put("preSeries", preSeries);
				    map.put("point", preschid);
				    map.put("totall2", 11); 
				    map.put("yi", 2);
				    map.put("sor", 1);
			 }
		 }
		 if(sort==2){
			//扶贫小学目录
				fptype=selTypeService.getFpMulv(smallchid);
			//扶贫小学课程
			    	PageHelper.startPage(startpage, 20);
					smallSeries=selTypeService.getFppreSerieser(erid);
					PageInfo<Series> pageInfo = new PageInfo<Series>(smallSeries);
					smallSeries = pageInfo.getList();
					 
					map.put("info", pageInfo);
					map.put("point2", erid);
					map.put("preSeries", smallSeries);
					map.put("fptype", fptype);
					map.put("point", smallchid);
					map.put("sor", 2);
					map.put("erid", erid);	
		 }
		 if(sort==3){
			 	fptype=selTypeService.getFpMulv(smallchid);
			 	PageHelper.startPage(startpage, 20);
			 	totalSeries=selTypeService.totalfpSerieser();
				PageInfo<Series> pageInfo = new PageInfo<Series>(totalSeries);
				totalSeries = pageInfo.getList();
				 
				map.put("info", pageInfo);
				map.put("preSeries", totalSeries);
				map.put("totall2", 11);
				map.put("totall", 11);
				map.put("sor", 3); 
		 }
		 return "views/FP/fpsubpage.jsp";
	}
}
