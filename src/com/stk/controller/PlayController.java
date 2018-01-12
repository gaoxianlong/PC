package com.stk.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.stk.entity.Order;
import com.stk.entity.OrderkPage;
import com.stk.entity.Wxorder;
import com.stk.entity.Collect;
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
import com.stk.service.VipService;
import com.stk.service.ZanService;
import com.stk.util.DateUtils;

/*
 * 
 * @RequestParam(value="id")每个视频具体的ID
 * 
 * 
 */
@Controller
public class PlayController {

	protected Logger log = Logger.getLogger(PlayController.class);
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
	@RequestMapping(value = "/play")
	public String play(Map<String, Object> map, HttpSession session,
			@RequestParam(value = "seriesID") Integer seriesID,
			@RequestParam(value = "id", required = false) Integer id,
			@RequestParam(value = "oldid", required = false) Integer oldid) {
		
		playService.ClickRate(seriesID);
		
		
		String show=null;
		Series sers=playService.getplaySeries(seriesID);
		int price=sers.getRealPrice();
		String pric=String.valueOf(price);
		String Title=sers.getTitle();
		//是否是同步课程
		 
		String syn=sers.getSyn();
		if(syn==null){
			syn="h";
		}
		System.out.println(sers.toString()+"555555555555555555555555555555555");
		System.out.println(syn+"00000000000000000000000000000000000000000000000000000000000");
		map.put("Title",Title );
		String typevalue=sers.getTypeValue();
		
		int a = Integer.valueOf(typevalue).intValue();
		List<Series> rela = selTypeService.getSeriesyi(a);
		map.put("rela", rela);
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
					Integer voZan=zanService.selectZanVService(id);
					System.out.println("视频点赞+++++++++"+voZan);
					map.put("voZan", voZan);
					map.put("flag", flag);
				//收藏
					boolean flagColl=zanService.selectCollect(user.getID(), id);
					Integer numColl=zanService.selectCollVService(id);
					System.out.println(numColl+"++++视频");
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
					System.out.println(record+"000000000000000000000000000000000000000000000000000");
					orderService.addrecord(record);
				} catch (Exception e) {
					log.info("111111111111111111111111111111111");
				}

				log.info("000000000000000000000000000000000000");
			} else {
				log.info("已经添加该课程的播放记录了已经添加该课程的播放记录了已经添加该课程的播放记录了已经添加该课程的播放记录了已经添加该课程的播放记录了已经添加该课程的播放记录了");
			}
		}
//判断播放列表 开始
		if(syn.equals("sy")){
			//同步课程
			
			
			if(vipService.judvip(user.getID())){
				
				//是VIP
				
				//获取VIP的到期时间
				Wxorder wx=vipService.getwxorder(user.getID());
				Date now = new Date(); 
				Date over=wx.getOvertime();
				
				Long dat=now.getTime();
				Long ove=over.getTime();
				System.out.println(dat+"ccccc9999999999999999999999999999999999999999999999999999999999999999999999");
				System.out.println(ove+"ddddd8888888888888888888888888888888888888888888888888888888888888888888888");
				if(dat<ove){
					
					//是VIP,VIP未到期
					lsvideo = orderService.getvideo(seriesID);	
					show="sho";
				}else{
					//是VIP,VIP到期
					
					
					//验证是否购买该课程
					boolean ord = orderService.getorderserid(user.getID(), seriesID);
					   Date nowplay = new Date(); 
			    	   Long datplay=nowplay.getTime();
			    	   
			    	   Long oveplay = (long) 1;
			    	   if(vipService.getoornotnull(user.getID(), seriesID)){
			    		   
			    		Order or=vipService.getOrders(user.getID(), seriesID);
			   			Date overplay=or.getOvertime();
			   			oveplay=overplay.getTime();
			    	   }
					
					if (ord&&datplay<oveplay) {
						lsvideo = orderService.getvideo(seriesID);
						show="sho";
					} else {

						lsvideo = orderService.videofree(seriesID);
						videopay = orderService.videopay(seriesID);
						show="nosho";
					}
						
				}	
				
			}else{
				
				//不是VIP	
				
				//验证是否购买该课程
				boolean ord = orderService.getorderserid(user.getID(), seriesID);
				   Date nowplay = new Date(); 
		    	   Long datplay=nowplay.getTime();
		    	   
		    	   Long oveplay = (long) 1;
		    	   if(vipService.getoornotnull(user.getID(), seriesID)){
		    		   
		    		Order or=vipService.getOrders(user.getID(), seriesID);
		   			Date overplay=or.getOvertime();
		   			oveplay=overplay.getTime();
		    	   }
				
				if (ord&&datplay<oveplay) {
					lsvideo = orderService.getvideo(seriesID);
					show="sho";
				} else {

					lsvideo = orderService.videofree(seriesID);
					videopay = orderService.videopay(seriesID);
					show="nosho";
				}
					
			}
					
		}
		
		else if(syn.equals("hobby")){
			//兴趣课程
			if(vipService.judvip(user.getID())){	
				//是VIP
				
				//获取VIP的信息
				Wxorder wx=vipService.getwxorder(user.getID());
				//获取VIP的类别
				String vipsort=wx.getVipsort();
				//获取VIP的到期时间
				Date now = new Date(); 
				Date over=wx.getOvertime();
				Long dat=now.getTime();
				Long ove=over.getTime();
				
				if(dat<ove){
					//是VIP,VIP未到期
				
						//是VIP,VIP未到期,VIP级别高
						lsvideo = orderService.getvideo(seriesID);
						show="sho";	
				}else{
					//是VIP,VIP到期
					
					//验证是否购买该课程
					boolean ord = orderService.getorderserid(user.getID(), seriesID);
					   Date nowplay = new Date(); 
			    	   Long datplay=nowplay.getTime();
			    	   
			    	   Long oveplay = (long) 1;
			    	   if(vipService.getoornotnull(user.getID(), seriesID)){
			    		   
			    		Order or=vipService.getOrders(user.getID(), seriesID);
			   			Date overplay=or.getOvertime();
			   			oveplay=overplay.getTime();
			    	   }
					
					if (ord&&datplay<oveplay) {
						lsvideo = orderService.getvideo(seriesID);
						show="sho";
					} else {

						lsvideo = orderService.videofree(seriesID);
						videopay = orderService.videopay(seriesID);
						show="nosho";
					}
						
				}	
			}else{
				
				//不是VIP
				
				//验证是否购买该课程
				boolean ord = orderService.getorderserid(user.getID(), seriesID);
				
				   Date nowplay = new Date(); 
		    	   Long datplay=nowplay.getTime();
		    	   
		    	   Long oveplay = (long) 1;
		    	   if(vipService.getoornotnull(user.getID(), seriesID)){
		    		   
		    		Order or=vipService.getOrders(user.getID(), seriesID);
		   			Date overplay=or.getOvertime();
		   			oveplay=overplay.getTime();
		    	   }
				
				if (ord&&datplay<oveplay) {
					lsvideo = orderService.getvideo(seriesID);
					show="sho";
				} else {

					lsvideo = orderService.videofree(seriesID);
					videopay = orderService.videopay(seriesID);
					show="nosho";
				}
				
			}
		}
		//
		
		else if(syn.equals("vphigh")){
			//兴趣课程
			
			if(vipService.judvip(user.getID())){
				
				//是VIP
				
				//获取VIP的信息
				Wxorder wx=vipService.getwxorder(user.getID());
				//获取VIP的类别
				String vipsort=wx.getVipsort();
				//获取VIP的到期时间
				Date now = new Date(); 
				Date over=wx.getOvertime();
				Long dat=now.getTime();
				Long ove=over.getTime();
				System.out.println(dat+"ffff888888888888888888888888888888888888888888888888888888888888888888");
				System.out.println(ove+"ffff777777777777777777777777777777777777777777777777777777777777777777");
				if(dat<ove){
				
					//是VIP,VIP未到期
					
					if(vipsort.equals("1")){
						//是VIP,VIP未到期,VIP级别高
						System.out.println("000000000000000000000000000000000000000000000000000000000000000000000000000");
						lsvideo = orderService.getvideo(seriesID);
						show="sho";
					}else{
						
						//是VIP,VIP未到期,VIP级别低
						
						
						//验证是否购买该课程
						boolean ord = orderService.getorderserid(user.getID(), seriesID);
						
						   Date nowplay = new Date(); 
				    	   Long datplay=nowplay.getTime();
				    	   
				    	   Long oveplay = (long) 1;
				    	   if(vipService.getoornotnull(user.getID(), seriesID)){
				    		   
				    		Order or=vipService.getOrders(user.getID(), seriesID);
				   			Date overplay=or.getOvertime();
				   			oveplay=overplay.getTime();
				    	   }
						
						if (ord&&datplay<oveplay) {
							System.out.println("111111111111111111111111111111111111111111111111111111111111111111111");
							lsvideo = orderService.getvideo(seriesID);
							show="sho";
						} else {
							System.out.println("2222222222222222222222222222222222222222222222222222222222222222222222");
							lsvideo = orderService.videofree(seriesID);
							videopay = orderService.videopay(seriesID);
							show="nosho";
						}
							
					}
						
				}else{
					//是VIP,VIP到期
					
					//验证是否购买该课程
					boolean ord = orderService.getorderserid(user.getID(), seriesID);
					
					   Date nowplay = new Date(); 
			    	   Long datplay=nowplay.getTime();
			    	   
			    	   Long oveplay = (long) 1;
			    	   if(vipService.getoornotnull(user.getID(), seriesID)){
			    		   
			    		Order or=vipService.getOrders(user.getID(), seriesID);
			   			Date overplay=or.getOvertime();
			   			oveplay=overplay.getTime();
			    	   }
					
					if (ord&&datplay<oveplay) {
						System.out.println("333333333333333333333333333333333333333333333333333333333333333333333333333333");
						lsvideo = orderService.getvideo(seriesID);
						show="sho";
					} else {
						System.out.println("44444444444444444444444444444444444444444444444444444444444444444444444444444444");
						lsvideo = orderService.videofree(seriesID);
						videopay = orderService.videopay(seriesID);
						show="nosho";
					}	
					
				}
					
			}else{
				
				//不是VIP
				
				System.out.println("5555555555555555555555555555555555555555555555555555555555555555");
				//验证是否购买该课程
				boolean ord = orderService.getorderserid(user.getID(), seriesID);
				
				   Date nowplay = new Date(); 
		    	   Long datplay=nowplay.getTime();
		    	   
		    	   Long oveplay = (long) 1;
		    	   if(vipService.getoornotnull(user.getID(), seriesID)){
		    		   
		    		Order or=vipService.getOrders(user.getID(), seriesID);
		   			Date overplay=or.getOvertime();
		   			oveplay=overplay.getTime();
		    	   }
				
				if (ord&&datplay<oveplay) {
					lsvideo = orderService.getvideo(seriesID);
					show="sho";
				} else {

					lsvideo = orderService.videofree(seriesID);
					videopay = orderService.videopay(seriesID);
					show="nosho";
				}
				
			}	
		}
		
		//
		else{
			//不同步课程
			
			//验证是否购买该课程
			boolean ord = orderService.getorderserid(user.getID(), seriesID);
			
			   Date nowplay = new Date(); 
	    	   Long datplay=nowplay.getTime();
	    	   
	    	   Long oveplay = (long) 1;
	    	   if(vipService.getoornotnull(user.getID(), seriesID)){
	    		   
	    		Order or=vipService.getOrders(user.getID(), seriesID);
	   			Date overplay=or.getOvertime();
	   			oveplay=overplay.getTime();
	    	   }
			
			if (ord&&datplay<oveplay) {
				lsvideo = orderService.getvideo(seriesID);
				show="sho";
			} else {

				lsvideo = orderService.videofree(seriesID);
				videopay = orderService.videopay(seriesID);
				show="nosho";
			}
			
		}
		
//判断播放列表	结束
		
		int maxsort=0;
		Seriesvideo itemvo = orderService.playvideo(id);
		if(lsvideo.size()>1){
			maxsort = lsvideo.get(lsvideo.size() - 1).getSort();
		}
		int nextsort = 0;
		int nextid=0;
		try {
				if (itemvo.getSort() < maxsort) {
						nextsort = itemvo.getSort() + 1;

						} else {
						nextsort = maxsort;
					}
				Seriesvideo nextitemvo = orderService.selnext(seriesID, nextsort);
				if(nextitemvo != null){
						nextid = nextitemvo.getID();
					}
		
		} catch (Exception e) {
			// TODO: handle exception
		}
		log.info(nextid + "nextidnextidnextidnextidnextidnextidnextidnextid");
		playrecord = orderService.playrecord(user.getID());
		map.put("nextid", nextid);
		map.put("playing", id);
		map.put("playrecord", playrecord);
		map.put("itemvo", itemvo);
		map.put("lsvideo", lsvideo);
		map.put("videopay", videopay);
		//购买信息
		map.put("price", price);
		map.put("seriesID", seriesID);
		map.put("show", show);
		map.put("pric", pric);

		return "views/play.jsp";
	}
//第一次进入到视频播放页面
	@RequestMapping(value = "/firstplay")
	public String firstplay(Map<String, Object> map, HttpSession session,
			@RequestParam(value = "seriesID") Integer seriesID,
			@RequestParam(value = "id", required = false) Integer id) {
		List<Seriesvideo> lsvideo = null;// 免费视频集合
		List<Seriesvideo> videopay = null;// 付费视频集合
		Users user = (Users) session.getAttribute("u");

		boolean ord = orderService.getorderserid(user.getID(), seriesID);

		if (ord) {
			lsvideo = orderService.getvideo(seriesID);
		} else {
			lsvideo = orderService.videofree(seriesID);
			videopay = orderService.videopay(seriesID);
		}

		int ids = 0;
		for (int i = 0; i < lsvideo.size(); i++) {

			ids = lsvideo.get(0).getID();
		}

		return "redirect:/play?seriesID=" + seriesID + "&id=" + ids + "";
	}
	/**扶贫用户判断*/
	@RequestMapping(value = "/judge")
	@ResponseBody
	public Fpclas judge(HttpSession session,
			@RequestParam(value = "seriesID") Integer seriesID) {
		Users user = (Users) session.getAttribute("u");
		Fpclas fc=new Fpclas();
		try {
				if(user.getID() == null){	
				fc.setId(0);
			}else{
				fc.setSeid(seriesID);
				fc.setId(1);		
			}	
		} catch (Exception e) {
			// TODO: handle exception
		}	
		return fc; 
	}
	
	/**扶贫用户判断*/
	@RequestMapping(value = "/judgefp")
	@ResponseBody
	public Fpclas judgefp(HttpSession session,
			@RequestParam(value = "seriesID") Integer seriesID) {
		Users user = (Users) session.getAttribute("u");
		Fpclas fc=new Fpclas();
		try {
			if(user.getHelpCode().equals("")){	
				
				log.info("111111111111111111111111111111111");
				fc.setId(0);	
				
		}else{
			log.info(user.getHelpCode()+"jguiosdfhgopisdhiofsdhgfdhgdifhgdfh");
			fc.setSeid(seriesID);
			fc.setId(1);
		}	
		} catch (Exception e) {
			// TODO: handle exception
		}	
		return fc;
		
	}
	//判断是否视频为空
			@RequestMapping(value = "/jdgecourse")
			@ResponseBody
			public Fpclas jdgecourse(Map<String, Object> map, HttpSession session,
					@RequestParam(value = "seriesID") Integer seriesID,
					@RequestParam(value = "id", required = false) Integer id) {
				
				System.out.println("已经进入到这个判断的方法里了+555555555555");
				List<Seriesvideo> lsvideo = null;// 免费视频集合
				List<Seriesvideo> videopay = null;// 付费视频集合
				Users user = (Users) session.getAttribute("u");

				boolean ord = orderService.getorderserid(user.getID(), seriesID);

				if (ord) {
					lsvideo = orderService.getvideo(seriesID);

				} else {

					lsvideo = orderService.videofree(seriesID);
					videopay = orderService.videopay(seriesID);

				}

				int ids = 0;

				for (int i = 0; i < lsvideo.size(); i++) {

					ids = lsvideo.get(0).getID();
				}
				Fpclas fc=new Fpclas();
				if(lsvideo.size()==0){
					fc.setId(1);
					fc.setSeid(seriesID);
					return fc;
				}else{
					fc.setId(1);
					fc.setSeid(seriesID);
					return fc;
				}

			//	return "redirect:/play?seriesID=" + seriesID + "&id=" + ids + "";

			}
			
		
	
	/**播放用户判断*/
	@RequestMapping(value = "/lanjiejudge")
	@ResponseBody
	public Fpclas lanjiejudge(HttpSession session,
			@RequestParam(value = "seriesID") Integer seriesID){
		Users user = (Users) session.getAttribute("u");
		Fpclas fc=new Fpclas();
		try {
			if(user.getID() == null){			
				fc.setId(0);
			}else{
				fc.setSeid(seriesID);
				fc.setId(1);	
			}		
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return fc;
		
		
	}
	//扶贫播放页面
	@RequestMapping(value = "/fpfirstplay")
	public String fpfirstplay(Map<String, Object> map, HttpSession session,
			@RequestParam(value = "seriesID") Integer seriesID,
			@RequestParam(value = "id", required = false) Integer id) {
		List<Seriesvideo> lsvideo = null;// 免费视频集合
		List<Seriesvideo> videopay = null;// 付费视频集合


		Users user = (Users) session.getAttribute("u");

		boolean ord = orderService.getorderserid(user.getID(), seriesID);

		if (ord) {
			lsvideo = orderService.getvideo(seriesID);

		} else {

			lsvideo = orderService.videofree(seriesID);
			videopay = orderService.videopay(seriesID);

		}

		int ids = 0;

		for (int i = 0; i < lsvideo.size(); i++) {

			ids = lsvideo.get(0).getID();
		}

		return "redirect:/play?seriesID=" + seriesID + "&id=" + ids + "";

	}
	
	
	
	/**查询播放记录*/
	@RequestMapping(value="/selectPlay")
	@ResponseBody
		public Object selectPlay( 
				@RequestParam(value="startpage",required=false,defaultValue="1") Integer startpage,
				HttpSession session){
			int start=1;
			List<Playrecord> plist=null;
			OrderkPage page=new OrderkPage();
			Users u=(Users) session.getAttribute("u");
			if(startpage<=10){
				start=startpage;
			}else{
				start=10;
			}
			PageHelper.startPage(start, 5);
			plist=playService.selectPlayService(u.getID());
			PageInfo<Playrecord> pageSeries=new PageInfo<Playrecord> (plist);
			page.setPageInfo(pageSeries);
			 return page;
	}

	
	/**查询id是否为小学*/
	@RequestMapping("/selectID")
	@ResponseBody
	public boolean selectID(Map<String, Object> map,Integer sid){
		Series series=playService.getplaySeries(sid);
		if(series.getTypeValue().equals("189")){
		return true;
		}
		return false;
	}
	
}
