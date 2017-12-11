package com.stk.controller;

import java.io.IOException;
import java.io.StringWriter;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;











import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;










import org.apache.log4j.Logger;
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

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.stk.entity.Carousel;
import com.stk.entity.Series;
import com.stk.entity.Type;
import com.stk.entity.Users;
import com.stk.entity.Wxorder;
import com.stk.service.LoginService;
import com.stk.service.SelTypeService;
import com.stk.service.VipService;

@Controller
public class SelMuluController {

	protected Logger log = Logger.getLogger(SelMuluController.class);
	@Autowired
	private SelTypeService selTypeService;
	@Autowired
	private LoginService loginService;
	@Autowired
	private VipService vipService;
	
	
 
	@RequestMapping(value="/selsub")
	public String Sub(Map<String, Object> map,@RequestParam(value="sort",required=false) int sort,@RequestParam(value="id") int id,@RequestParam(value="startpage",required=false,defaultValue="1") Integer startpage,HttpServletRequest request) {
		List<Type> type2 = null;
		List<Type> type22 = null;
		List<Type> type3 = null;
		ArrayList<Type> as = new ArrayList<Type>();
		ArrayList<Type> asd = new ArrayList<Type>();
		List<Type> type=null;
		List<Type> type0=null;
		//封装课程的封面信息的ArrayList
		//ArrayList<Series> series = new ArrayList<Series>();
		List<Series> seriestuijian=null;
		List<Series> series=null;
		List<Series> seriests=null;
	    int point=0;
	    int point2=0;
	    int point3=0;
	if(sort==1){
		type0 = selTypeService.getMulvyi(0);
		//type = selTypeService.getMulvyisub(id);
		type2 = selTypeService.getMulver(id);
		as.addAll(type2);
		for (int t = 0; t < type2.size(); t++) {
			type3 = selTypeService.getMulvsan(type2.get(t).getID());
			
			asd.addAll(type3);
			
			
			
			
			
		}

		 PageHelper.startPage(startpage, 16);
		 series=selTypeService.getSeriesyi(id);
		 PageInfo<Series> pageInfo = new PageInfo<Series>(series);
		 seriests = pageInfo.getList();
		
		 //
			

			 map.put("seriestuijian", seriests);
			 //

		map.put("info", pageInfo);
		map.put("series", seriests);
		
		map.put("totall2", 0);
		map.put("totall3", 0);
			
		point=id;
	}
	
	
	if(sort==2){
		type0 = selTypeService.getMulvyi(0);
		
		type22 = selTypeService.getMulversub(id);
	
		type2 = selTypeService.getMulver(type22.get(0).getParentID());
		as.addAll(type2);
		
		
		
			type3 = selTypeService.getMulvsan(id);
			
			asd.addAll(type3);

			point=type22.get(0).getParentID();
			point2=id;
			
			 PageHelper.startPage(startpage, 16);
			series=selTypeService.getSerieser(id);
			 PageInfo<Series> pageInfo = new PageInfo<Series>(series);
			 seriests = pageInfo.getList();
			 
			 
			 
			 
			 //
			 
			
		
			 map.put("seriestuijian", seriests);
			 //

			 
			 map.put("info", pageInfo);
			map.put("series", seriests);
			
			map.put("totall3", 0);
	}
	
	if(sort==3){
		type0 = selTypeService.getMulvyi(0);
		List<Type> tysan=null;
		List<Type> tyer=null;
		
		List<Type> tyyiid=null;
		//三级菜单的信息
		tysan=selTypeService.getMulvsansub(id);
		//二级菜单的信息
		tyer=selTypeService.getMulversub(tysan.get(0).getParentID());
		
		//type22 = selTypeService.getMulversub(tyer.get(0).getID());
	
		type2 = selTypeService.getMulver(tyer.get(0).getParentID());
		as.addAll(type2);
		
		//tyyiid=selTypeService.getMulvyisub()
		
			type3 = selTypeService.getMulvsan(tysan.get(0).getParentID());
			
			asd.addAll(type3);

			point=tyer.get(0).getParentID();
			point2=tysan.get(0).getParentID();
			point3=id;
			
			PageHelper.startPage(startpage, 16);
			series=selTypeService.getSeriessan(id);
			 PageInfo<Series> pageInfo = new PageInfo<Series>(series);
			 seriests = pageInfo.getList();
			 
			 
			 //
			 
		
			 map.put("seriestuijian", series);
			// 
			 
			 
			 map.put("info", pageInfo);
			map.put("series", seriests);
	}
	
	 map.put("point", point);
	 map.put("point2", point2);
	 map.put("point3", point3);
	 map.put("sub", 1);
	 map.put("type1", type0);
	 map.put("as1", as);
	 map.put("asd1", asd);
	 map.put("sort", sort);
	 map.put("menuid", id);
	
	 return "views/subpage.jsp";
	
	
}
	
	
	
	
	
	
	@RequestMapping(value="/getMulu",produces="text/html;charset=UTF-8")
	
	public String basic(Map<String, Object> map,@RequestParam(value="totall",required=false) Integer totall,@RequestParam(value="so",required=false) Integer so) {
		List<Type> type2 = null;
		List<Type> type3 = null;
		ArrayList<Type> as = new ArrayList<Type>();
		ArrayList<Type> asd = new ArrayList<Type>();
		ArrayList<Type> total = new ArrayList<Type>();
		
	
		ArrayList<Type> a = new ArrayList<Type>();
		ArrayList<Type> b = new ArrayList<Type>();
		ArrayList<Type> c = new ArrayList<Type>();
		ArrayList<Type> d = new ArrayList<Type>();
		int id = 0;
		List<Type> type;
		
		Type type00=null;
		type = selTypeService.getMulvyi(id);
		
		for (int i = 0; i < type.size(); i++) {

			type2 = selTypeService.getMulver(type.get(i).getID());
			as.addAll(type2);
			

			for (int t = 0; t < type2.size(); t++) {
				type3 = selTypeService.getMulvsan(type2.get(t).getID());
				asd.addAll(type3);
				
			}

		}

		

		for (int i = 0; i < type.size(); i++) {
			
			type00= (Type) type.get(i);
			System.out.println(type00.getID() + type00.getTypeName()
					+ "111111111111111");
			int ids = type.get(i).getID();

			a.addAll(type);
			for (int t = 0; t < as.size(); t++) {
				Type type02 = (Type) as.get(t);
				int idss = type02.getID();
				if (type02.getParentID() == ids) {
					Type type20=(Type)type02;
					System.out.println(type20.getID() + type20.getTypeName()
							+ "22222222222");

					b.add(type20);
					for (int y = 0; y < asd.size(); y++) {
						Type type03 = (Type) asd.get(y);

						if (type03.getParentID() == idss) {
							Type type30=(Type)type03;
							System.out.println(type30.getID()
									+ type30.getTypeName() + "33333333333");
							c.add(type30);
							
						}
						
					}
					
				}

				d.addAll(b);
				d.addAll(c);
				d.add(type00);
			}
			
		}
		
		total.addAll(type);
		total.addAll(as);
		total.addAll(asd);
		if(so==0){
			 map.put("totall", totall);
			 map.put("totall2", totall);
			 map.put("totall3", totall);
		}
		if(so==1){
			 map.put("totall", totall);
			 map.put("totall2", totall);
			 map.put("totall3", totall);
		}
		if(so==2){
			// map.put("totall", totall);
			 map.put("totall2", totall);
		}
		if(so==3){
			// map.put("totall", totall);
			 map.put("totall3", totall);
		}
		 map.put("type", type);
		 map.put("as", as);
		 map.put("asd", asd);
		// return "page/index.jsp";
		 
		 
		 
		 List<Series> totalzh=null;
		 List<Series> totalzr=null;
		 List<Series> totalzx=null;
		 
		 totalzh=selTypeService.totalSerieserzh();
		 
		 totalzr=selTypeService.totalSerieserzr();
		 totalzx=selTypeService.totalSerieserzx();
		 
		 
		 
		 
		 
		 map.put("totalzh", totalzh);
		 map.put("totalzr", totalzr);
		 map.put("totalzx", totalzx);
		 
		 
		 return "views/subpage.jsp";

	}
	
	
	
@RequestMapping(value="/getmenuindex",produces="text/html;charset=UTF-8")
	
	public String menuindex(Map<String, Object> map,HttpServletRequest request,HttpSession session) {
		List<Type> type2 = null;
		List<Type> type3 = null;
		ArrayList<Type> as = new ArrayList<Type>();
		ArrayList<Type> asd = new ArrayList<Type>();
		ArrayList<Type> total = new ArrayList<Type>();
		
	
		ArrayList<Type> a = new ArrayList<Type>();
		ArrayList<Type> b = new ArrayList<Type>();
		ArrayList<Type> c = new ArrayList<Type>();
		ArrayList<Type> d = new ArrayList<Type>();
		int id = 0;
		List<Type> type;
		
		Type type00=null;
		type = selTypeService.getMulvyi(id);
		
		for (int i = 0; i < type.size(); i++) {

			type2 = selTypeService.getMulver(type.get(i).getID());
			as.addAll(type2);
		

			for (int t = 0; t < type2.size(); t++) {
				type3 = selTypeService.getMulvsan(type2.get(t).getID());
				asd.addAll(type3);
				

			}

		}

		

		for (int i = 0; i < type.size(); i++) {
			
			type00= (Type) type.get(i);
			System.out.println(type00.getID() + type00.getTypeName()
					+ "111111111111111");
			int ids = type.get(i).getID();

			a.addAll(type);
			for (int t = 0; t < as.size(); t++) {
				Type type02 = (Type) as.get(t);
				int idss = type02.getID();
				if (type02.getParentID() == ids) {
					Type type20=(Type)type02;
					System.out.println(type20.getID() + type20.getTypeName()
							+ "22222222222");

					b.add(type20);
					for (int y = 0; y < asd.size(); y++) {
						Type type03 = (Type) asd.get(y);

						if (type03.getParentID() == idss) {
							Type type30=(Type)type03;
							System.out.println(type30.getID()
									+ type30.getTypeName() + "33333333333");
							c.add(type30);
							
						}
						
					}
					
				}

				d.addAll(b);
				d.addAll(c);
				d.add(type00);
			}
			
		}
		
		total.addAll(type);
		total.addAll(as);
		total.addAll(asd);
		
		 map.put("type", type);
		 map.put("as", as);
		 map.put("asd", asd);
		 
		 
		 List<Carousel> carousel = null;
		 List<Series> seriesCarousel = null;
		 ArrayList<Series> seriesCarouseltotal = new ArrayList<Series>();
		 carousel=selTypeService.getCarousel();
		 for (int i = 0; i < carousel.size(); i++) {
			 log.info(carousel.size()+"00000000000000000");
			 seriesCarousel=selTypeService.getSeriesCarousel(carousel.get(i).getSeriesid());
			log.info(seriesCarousel.get(0).getClickRate()+"00000000000clickclickclick"); 
			 seriesCarouseltotal.addAll(seriesCarousel);
		 }
		 for (int i = 0; i < seriesCarouseltotal.size(); i++) {
		 log.info(seriesCarouseltotal.get(i).getClickRate()+"clickclickclickclickclickclickclickclickclickclick");
		 
		 }
		 
		 map.put("seriesCarouseltotal", seriesCarouseltotal);
		 
		 
		 List<Series> seriessel = null;
		 ArrayList<Series> seriesseltotal = new ArrayList<Series>();
		 
		 List<Series> seriessmall = null;
		 List<Series> seriesmiddle = null;
		 List<Series> serieshigh = null;
		 List<Series> seriesart = null;
		
		 seriessmall=selTypeService.getSeriesyi(189);
		 seriesmiddle=selTypeService.getSeriesyi(190);
		 serieshigh=selTypeService.getSeriesyi(206);
		 seriesart=selTypeService.getSeriesyi(207);
		
		 int seriessmallnumber = seriessmall.size();
		 int seriesmiddlenumber = seriesmiddle.size();
		 int serieshighnumber = serieshigh.size();
		 int seriesartnumber = seriesart.size();
		 
		 
		 
		 
		 log.info(seriessmallnumber+"sizesizesizesizesizesizesizesizesize");
		 log.info(seriessmallnumber+"sizesizesizesizesizesizesizesizesiesizesizesizesizesizesizesizeesizesizesizesizesizesizesizeesizesizesizesizesizesizesizeze");
		 for (int i = 0; i < type.size(); i++) {
			 seriessel=selTypeService.getSeriesyi(type.get(i).getID());
			 seriesseltotal.addAll(seriessel);
		 }
		 
		 
		//免费专区
			List<Series> free=null;
			free=selTypeService.getfree("free");
			List<Series> freetwo=null;
			freetwo=selTypeService.getfree("freetwo");
		 free.addAll(freetwo);
		 map.put("seriesfree", free);
		 map.put("seriesseltotal", seriesseltotal);
		 
		 map.put("seriessmall", seriessmall);
		 map.put("seriesmiddle", seriesmiddle);
		 map.put("serieshigh", serieshigh);
		 map.put("seriesart", seriesart);
		 
		 map.put("seriessmallnumber", seriessmallnumber);
		 map.put("seriesmiddlenumber", seriesmiddlenumber);
		 map.put("serieshighnumber", serieshighnumber);
		 map.put("seriesartnumber", seriesartnumber);
		 //首页cookie判断
		 Cookie[] cookies=(Cookie[]) request.getCookies();
		 System.out.println(cookies);
		 Users user=null;
		 String telephone=null;
		 //判断cookie
		 if(cookies!=null){
			 for(Cookie cookie:cookies){
				 String username=cookie.getName();
				 String password=cookie.getValue();
				 if("username-stk".equals(username)){
					telephone=password;
					 System.out.println(username+password+"77777777777777");
				 }
				 if("password-stk".equals(username)){
					 user=loginService.selectPhoneService(telephone);	
					 System.out.println(user);
					 session.setAttribute("u", user);
					 session.setMaxInactiveInterval(43200);
				 }
			 }
			 //System.exit(0);
		 }			
		
		 
		 return "index.jsp";
		 
	
	}

@RequestMapping(value = "/vipjudge")
@ResponseBody
public int play(HttpSession session){
	Users user = (Users) session.getAttribute("u");
	 int vp=0;
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
				vp=1;
			}else{
				vp=0;
			}
	
		}else{
			vp=0;
		}
		
		
	
	return vp;
	
	
}


}
