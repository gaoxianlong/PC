package com.stk.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.stk.entity.Series;
import com.stk.entity.Seriesvideo;
import com.stk.service.OrderService;
import com.stk.service.PlayService;
import com.stk.service.ZanService;





@Controller
public class FreePlayController {

	protected Logger log = Logger.getLogger(FreePlayController.class);
	@Autowired
	private OrderService orderService;
	@Autowired
	private PlayService playService;
	@Autowired
	private ZanService zanService;
	
	@RequestMapping(value = "/freeplay")
	public String freeplay(Map<String, Object> map, HttpSession session,
			@RequestParam(value = "seriesID") Integer seriesID,
			@RequestParam(value = "id", required = false) Integer id
			) {
				int vid=0;
				List<Seriesvideo> lsvideo = null;// 免费视频集合
				lsvideo = orderService.getvideo(seriesID);
				int ids = 0;
				if(id ==null){	
					//得到封面默认的第一个视频ID
					for (int i = 0; i < lsvideo.size(); i++) {
						ids = lsvideo.get(0).getID();
					}
				}
						//给具体视频的ID赋值
						if(id==null){
							vid=ids;
						}else{
							vid=id;
						}
						//得到每一个具体视频的信息
						Seriesvideo itemvo = orderService.playvideo(vid);
						//得到下一个具体视频的信息
						int maxsort = 0;
						if(id != null){
							 maxsort = lsvideo.get(lsvideo.size() - 1).getSort();
						}
						int nextsort = 0;
						int nextid = 0;
						if(id != null){
							if (itemvo.getSort() < maxsort) {
								nextsort = itemvo.getSort() + 1;
							} else {
								nextsort = maxsort;
							}
						Seriesvideo nextitemvo = orderService.selnext(seriesID, nextsort);
						//得到下一个具体视频的ID
						nextid = nextitemvo.getID();
				}
				
								//查询课程封面的信息
								Series sers=playService.getplaySeries(seriesID);
								String Title=sers.getTitle();
								 //视频点赞
						        Integer voZan=zanService.selectZanVService(vid);
						        System.out.println("视频点赞+++++++++"+voZan);
						        map.put("voZan", voZan); 
						        //收藏
						        Integer numColl=zanService.selectCollVService(vid);
						        System.out.println(numColl+"++++视频");
						        map.put("numColl", numColl);
						
								//封面的Title
								map.put("Title", Title);
								//免费视频
								map.put("lsvideo", lsvideo);
								map.put("playing", vid);
								//视频的详细信息
								map.put("itemvo", itemvo);
								//下一个视频的ID
								map.put("nextid", nextid);
								map.put("nowserid", seriesID);
							
								return "views/freeplay.jsp";
	}
	
}
