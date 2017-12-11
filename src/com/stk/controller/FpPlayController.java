package com.stk.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.stk.entity.Comment;
import com.stk.entity.Fpclas;
import com.stk.entity.Playrecord;
import com.stk.entity.Series;
import com.stk.entity.Seriesvideo;
import com.stk.entity.Users;
import com.stk.service.CommentService;
import com.stk.service.OrderService;
import com.stk.service.PlayService;
import com.stk.service.SelTypeService;
import com.stk.service.ZanService;
import com.stk.util.DateUtils;

/*
 * 
 * @RequestParam(value="id")每个视频具体的ID
 * 
 * 
 */
@Controller
public class FpPlayController {

	protected Logger log = Logger.getLogger(FpPlayController.class);
	@Autowired
	private OrderService orderService;
	@Autowired
	private PlayService playService;
	@Autowired
	private SelTypeService selTypeService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private ZanService zanService;
	@RequestMapping(value = "/ffpplay")
	public String ffpplay(Map<String, Object> map, HttpSession session,
			@RequestParam(value = "seriesID") Integer seriesID,
			@RequestParam(value = "id", required = false) Integer id,
			@RequestParam(value = "oldid", required = false) Integer oldid) {
		
		playService.ClickRate(seriesID);
		
		Series sers=playService.getplaySeries(seriesID);
		String Title=sers.getTitle();
		map.put("Title",Title );
		String typevalue=sers.getTypeValue();
		int a = Integer.valueOf(typevalue).intValue();
		List<Series> rela = selTypeService.getSeriesyi(a);
		map.put("rela", rela);
		if(id==0){
			log.info("22222222222222222222222222222");
			return "redirect:/getmenuindex";
			}
		List<Seriesvideo> lsvideo = null;// 免费视频集合
		List<Seriesvideo> videopay = null;// 付费视频集合
		List<Playrecord> playrecord = null;// 播放记录集合
		Users user = (Users) session.getAttribute("u");
		//评论
				List<Comment> comm=commentService.selectCommService(id);
				List<Comment> comm1=new ArrayList<Comment>();
				for(Comment c:comm){
					boolean falg=zanService.selectCommentService(user.getID(), c.getId());
					c.setZan(falg);
					Integer num=zanService.selectCountService(c.getId());
					String date1=c.getAddtimes().substring(0,10);
					c.setAddtimes(date1);
					c.setNumzan(num);
					comm1.add(c);
				}
				map.put("comment", comm1);
				//视频点赞
					boolean flag=zanService.selectVideoService(user.getID(), id);
					
					log.info(user.getID()+"9999999999999999999988");
					log.info(id+"3333333333333333333333333333");
					Integer voZan=zanService.selectZanVService(id);
					System.out.println("视频点赞+++++++++"+voZan);
					map.put("voZan", voZan);
					map.put("flag", flag);
				//收藏
					boolean flagColl=zanService.selectCollect(user.getID(), id);
					Integer numColl=zanService.selectCollVService(id);
					map.put("numColl", numColl);
					map.put("flagColl", flagColl);	
				// 添加播放记录
				if (id != null) {
					if (orderService.getrecord(user.getID(), id)) {
						try {
							Playrecord record=new Playrecord();
							record.setUid(user.getID());
							record.setVid(id);
							record.setAddtimes(DateUtils.getFormatDateYMDHMS());
							orderService.addrecord(record);
						} catch (Exception e) {
							}
					} else {
						
					}
				}
				lsvideo = orderService.getvideo(seriesID);
				Seriesvideo itemvo = orderService.playvideo(id);
		
				int maxsort = lsvideo.get(lsvideo.size() - 1).getSort();
				int nextsort = 0;
				if (itemvo.getSort() < maxsort) {
					nextsort = itemvo.getSort() + 1;
				} else {
					nextsort = maxsort;
				}
				Seriesvideo nextitemvo = orderService.selnext(seriesID, nextsort);
				int nextid = nextitemvo.getID();
				playrecord = orderService.playrecord(user.getID());
		
				map.put("nextid", nextid);
				map.put("playing", id);
				map.put("playrecord", playrecord);
				map.put("itemvo", itemvo);
				map.put("lsvideo", lsvideo);
				map.put("videopay", videopay);
		
				return "views/fppplay.jsp";
	}

	
	//pan
	@RequestMapping(value = "fpjdnul")
	@ResponseBody
	public Fpclas fpjdnul(Map<String, Object> map, HttpSession session,
			@RequestParam(value = "seriesID") Integer seriesID,
			@RequestParam(value = "id", required = false) Integer id) {
		List<Seriesvideo> lsvideo = null;// 免费视频集合
		lsvideo = orderService.getvideo(seriesID);
		int ids = 0;
		for (int i = 0; i < lsvideo.size(); i++) {
			ids = lsvideo.get(0).getID();
		}
		Fpclas fc=new Fpclas();
		if(lsvideo.size()==0){
			fc.setId(0);
			return fc;
		}else{
			fc.setId(1);
			fc.setSeid(seriesID);
			return fc;
		}
	}
	//第一次进入到视频播放页面
		@RequestMapping(value = "/ffpfirstplay")
		public String ffpfirstplay(Map<String, Object> map, HttpSession session,
				@RequestParam(value = "seriesID") Integer seriesID,
				@RequestParam(value = "id", required = false) Integer id) {
			List<Seriesvideo> lsvideo = null;// 免费视频集合
			lsvideo = orderService.getvideo(seriesID);
			int ids = 0;
			for (int i = 0; i < lsvideo.size(); i++) {
				ids = lsvideo.get(0).getID();
			}
			return "redirect:/ffpplay?seriesID=" + seriesID + "&id=" + ids + "";
		}
}
