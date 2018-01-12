package com.stk.controller;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.aspectj.weaver.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.stk.entity.Collect;
import com.stk.entity.OrderkPage;
import com.stk.entity.Playrecord;
import com.stk.entity.Users;
import com.stk.entity.Zan;
import com.stk.service.ZanService;
import com.stk.util.DateUtils;
/*点赞和收藏
 * */
@Controller
public class ZanController {
	@Autowired
	private ZanService zanService;
	/**增加赞*/
	@RequestMapping("/addzan")
	@ResponseBody
	public String addzan(Integer uid,Integer vid,Integer cid){
		Zan zan=new Zan();
		zan.setUid(uid);
		zan.setVid(vid);
		zan.setCid(cid);
		zan.setAddtimes(DateUtils.getFormatDateYMDHMS());
		zanService.addzanService(zan);
		System.out.println(uid+"=uid+++="+vid+"=vid++++="+"=+++++cid");
		System.out.println(zan.toString());
		if(vid!=null){
			Integer num=zanService.selectZanVService(vid);
			num=num+1;
			System.out.println("数为+++"+num);
			zanService.addvideoService(num,vid);
		}
		return "ok";
	}
	
	
	/**取消评论赞*/
	@RequestMapping("/deleteZan")
	@ResponseBody
	public String deleteZan(Integer uid,Integer cid){
		zanService.deleteZanService(uid, cid);
		return "ok";
	}
	/**取消视频赞*/
	@RequestMapping("/deleteZanvo")
	@ResponseBody
	public String deleteZanvo(Integer uid,Integer vid){
		zanService.deleteZanvo(uid, vid);
		Integer num=zanService.selectZanVService(vid);
		num=num-1;
		if(num<1){
			num=0;
		}
		System.out.println("数为+++"+num);
		zanService.addvideoService(num,vid);
		return "ok";
	}
	/**增加收藏*/
	@RequestMapping("/addCollects")
	@ResponseBody
	public String addCollects(Integer uid,Integer vid){
		Collect collect=new Collect();
		collect.setAddtimes(DateUtils.getFormatDateYMDHMS());
		collect.setUid(uid);
		collect.setVid(vid);
		zanService.addCollectService(collect);
		Integer shoucts=zanService.selectCollVService(vid);
		Integer num=shoucts+1;
		System.out.println("数为+++"+num);
		zanService.addCollVideo(num, vid);
		return "ok";
	}
	/**取消视频赞*/
	@RequestMapping("/deleteCollect")
	@ResponseBody
	public String deleteCollect(Integer uid,Integer vid){
		zanService.deleteCollectService(uid, vid);
		Integer shoucts=zanService.selectCollVService(vid);
		Integer num=shoucts-1;
		if(num<1){
			num=0;
		}
		System.out.println("数为+++"+num);
		zanService.addCollVideo(num, vid);
		return "ok";
	}
	/**查询收藏记录*/
	@RequestMapping(value="/selectColl")
	@ResponseBody
	public Object selectColl(
			@RequestParam(value="startpage",required=false,defaultValue="1") Integer startpage,
			HttpSession session){
		List<Collect> clist=null;
		OrderkPage page=new OrderkPage();
		Users u=(Users) session.getAttribute("u");
		PageHelper.startPage(startpage, 5);
		clist=zanService.selectCollAllService(u.getID());
		PageInfo<Collect> pageSeries=new PageInfo<Collect> (clist);
		page.setPageInfo(pageSeries);
		return page;
	}
}
