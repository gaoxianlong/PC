package com.stk.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.stk.entity.Wxorder;
import com.stk.entity.Collect;
import com.stk.entity.Comment;
import com.stk.entity.Fpclas;
import com.stk.entity.OrderandSeries;
import com.stk.entity.OrderkPage;
import com.stk.entity.Playrecord;
import com.stk.entity.Series;
import com.stk.entity.Seriesvideo;
import com.stk.entity.Users;
import com.stk.service.CommentService;
import com.stk.service.OrderService;
import com.stk.service.PlayService;
import com.stk.service.SelTypeService;
import com.stk.service.VipService;
import com.stk.service.ZanService;
import com.stk.util.Sha1Util;

/*
 * 
 * @RequestParam(value="id")每个视频具体的ID
 * 
 * 
 */
@Controller
public class orderdetaController {

	protected Logger log = Logger.getLogger(orderdetaController.class);
	@Autowired
	private OrderService orderService;
	@Autowired
	private PlayService playService;
	@Autowired
	private SelTypeService selTypeService;
	@Autowired
	private VipService vipService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private ZanService zanService;
	@RequestMapping(value = "/orderdeta")
	public String play(Map<String, Object> map, HttpSession session,
			@RequestParam(value = "seriesID") Integer seriesID) {
		
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		String sa = dateFormat.format(date);
		String ordernum=sa+Sha1Util.getTimeStamp();
		
		Series sers=playService.getplaySeries(seriesID);
		
		map.put("ordernum", ordernum);
		map.put("series", sers);

		return "/views/pay.jsp";
	}
	
	@RequestMapping(value = "/pay")
	public String pay(Map<String, Object> map, HttpSession session,
			@RequestParam(value = "vipso") String vipso,
			@RequestParam(value = "seriesID") Integer seriesID,
			@RequestParam(value = "pric",required = false) String pric,
			@RequestParam(value = "ordernum",required = false) String ordernum
			) {
		
		map.put("ordernum", ordernum);
		map.put("pric", pric);
		map.put("vipso", vipso);
		map.put("seriesID", seriesID);

		return "/views/wxsmzf.jsp";

	}
	
	@RequestMapping(value = "/vipvippay")
	public String vipvippay(Map<String, Object> map, HttpSession session,
			@RequestParam(value = "vipso") String vipso,
			@RequestParam(value = "pric") String pric,
			@RequestParam(value = "check") String check
			
			) {
		
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		String sa = dateFormat.format(date);
		String ordernum=sa+Sha1Util.getTimeStamp();
		
		map.put("ordernum", ordernum);
		map.put("vipso", vipso);
		map.put("pric", pric);
		map.put("check", check);
		map.put("seriesID", 1);
	
		return "/views/vipwxsmzf.jsp";

	}
	
	@RequestMapping(value = "/selorderpay")
	@ResponseBody
	public String selpay(Map<String, Object> map, 
			@RequestParam(value = "outtradeno") String outtradeno
			
			) {
			
		boolean judge=orderService.orderpay(outtradeno);
		
		if(judge){
			return "no";
		}else{
			return "yes";
		}
	}

	@RequestMapping(value = "/selvippay")
	@ResponseBody
	public String selvippay(Map<String, Object> map, 
			@RequestParam(value = "outtradeno") String outtradeno
			) {
		
		boolean judge=orderService.vippay(outtradeno);
		
		if(judge){
			return "no";
		}else{
			return "yes";
		}
	}
	//查询用户自己单个购买的课程订单
	@RequestMapping(value = "/selorderandk")
	@ResponseBody
	public Object selorderandk(
			@RequestParam(value="startpage",required=false,defaultValue="1") Integer startpage,
			HttpSession session
			) {
		
		
		List<OrderandSeries> orderandSeries=null;
		OrderkPage page=new OrderkPage();
		Users user = (Users) session.getAttribute("u");
		int iduser=user.getID();
		
		 PageHelper.startPage(startpage, 5);
		 orderandSeries=vipService.selorderandk(iduser);
		 PageInfo<OrderandSeries> pageInfo = new PageInfo<OrderandSeries>(orderandSeries);
		 
		 page.setPageInfo(pageInfo);
		 
		
	     return page;
		
		
		
		
	}
	
	
}
