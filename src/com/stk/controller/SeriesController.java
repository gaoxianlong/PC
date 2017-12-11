package com.stk.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.stk.entity.Series;
import com.stk.entity.Type;
import com.stk.service.SelTypeService;
import com.stk.service.SeriesService;

@Controller
public class SeriesController {
	protected Logger log = Logger.getLogger(SeriesController.class);
	@Autowired
	private SelTypeService selTypeService;
	@Autowired
	private SeriesService seriesService;
	
	//注入model
		@ModelAttribute
		public void getType(
				@RequestParam(value = "ID", required = false) Integer ID,
				Map<String, Object> map) {
			if (ID != null) {
				map.put("series", seriesService.hsgetSeries(ID));
			}
		}
		
		//add视频
		@RequestMapping(value="/hsaddvideo")
		public String hsaddvideo(Map<String, Object> map,@RequestParam(value="id") Integer id) {
			

			
		
			 
			
			 map.put("id", id);
			 return "back/addvideo.jsp";
			 
		
		}
		
		
		
		
	
	//查询二级菜单视频
		
		@RequestMapping(value="/backselserieser")
		public String backselserieser(Map<String, Object> map,@RequestParam(value="id") int id) {
			

			
			List<Series> series=null;
			series=selTypeService.getSerieser(id);
			 
			
			 map.put("series", series);
			 return "back/selandupseries.jsp";
			 
		
		}
		
		@RequestMapping(value="/backselserieservideo")
		public String backselserieservideo(Map<String, Object> map,@RequestParam(value="id") int id) {
			

			
			List<Series> series=null;
			series=selTypeService.getSerieser(id);
			 
			
			 map.put("series", series);
			 return "back/selandupseriesvideo.jsp";
			 
		
		}
		
		
	//查询三级菜单视频
		
		@RequestMapping(value="/backselseriessan")
		public String backselseriessan(Map<String, Object> map,@RequestParam(value="id") int id) {
			

			List<Series> series=null;
			series=selTypeService.getSeriessan(id);
			 
			 
			map.put("series", series);
			
			 
			 return "back/selandupseries.jsp";
			 
		
		}
		@RequestMapping(value="/backselseriessanvideo")
		public String backselseriessanvideo(Map<String, Object> map,@RequestParam(value="id") int id) {
			

			List<Series> series=null;
			series=selTypeService.getSeriessan(id);
			 
			 
			map.put("series", series);
			
			 
			 return "back/selandupseriesvideo.jsp";
			 
		
		}
		
		
		//update er
		@RequestMapping(value="/upserieser")
		public String upserieser(Series series) {
			try {
				
				
				seriesService.upserieser(series);
			} catch (Exception e) {
				// TODO: handle exception
				return "back/error.jsp";
			}
			
			 
			 
			
			 
			 return "back/success.jsp";
			 
		
		}
		
		
		@RequestMapping(value="/hsselseries")
		public String upseriessan(@RequestParam(value = "ID") Integer ID,Map<String, Object> map) {
			
			
			Series series=seriesService.hsgetSeries(ID);
			
			log.info(series.toString()+"11111111111111111111111111111111111111111111111111111111111111111111111111111111");
			 map.put("se", series);
			
			 
			 return "back/upseries.jsp";
			 
		
		}
	
  
	@RequestMapping(value="/series",produces="text/html;charset=UTF-8")
	public String series(Map<String, Object> map) {
		int id = 0;
		List<Type> type;
		type = selTypeService.getMulvyi(id);
		

		 map.put("type", type);
		
		 
		 
		
		 
		 return "back/addseries.jsp";
		 
	
	}
	
	@RequestMapping(value="/selseries",produces="text/html;charset=UTF-8")
	public String selseries(Map<String, Object> map) {
		List<Type> type2 = null;
		List<Type> type3 = null;
		ArrayList<Type> as = new ArrayList<Type>();
		ArrayList<Type> asd = new ArrayList<Type>();
	
		
	
		
		int id = 0;
		List<Type> type;
		
		
		type = selTypeService.getMulvyi(id);
		
		for (int i = 0; i < type.size(); i++) {

			type2 = selTypeService.getMulver(type.get(i).getID());
			as.addAll(type2);
		

			for (int t = 0; t < type2.size(); t++) {
				type3 = selTypeService.getMulvsan(type2.get(t).getID());
				asd.addAll(type3);
				

			}

		}
		
		 
		 map.put("type", type);
		 map.put("as", as);
		 map.put("asd", asd);
		
		 
		 return "back/selseries.jsp";
		 
	
	}

	
	
	@RequestMapping(value="/selseriesvideo",produces="text/html;charset=UTF-8")
	public String selseriesvideo(Map<String, Object> map) {
		List<Type> type2 = null;
		List<Type> type3 = null;
		ArrayList<Type> as = new ArrayList<Type>();
		ArrayList<Type> asd = new ArrayList<Type>();
	
		
	
		
		int id = 0;
		List<Type> type;
		
		
		type = selTypeService.getMulvyi(id);
		
		for (int i = 0; i < type.size(); i++) {

			type2 = selTypeService.getMulver(type.get(i).getID());
			as.addAll(type2);
		

			for (int t = 0; t < type2.size(); t++) {
				type3 = selTypeService.getMulvsan(type2.get(t).getID());
				asd.addAll(type3);
				

			}

		}
		
		 
		 map.put("type", type);
		 map.put("as", as);
		 map.put("asd", asd);
		
		 
		 return "back/selseriesvideo.jsp";
		 
	
	}
	
	@RequestMapping(value="/addseries")
	public String addseries(Series series) {
		
		series.setPublishTime(new Date());
		series.setCreateTime(new Date());
		log.info("assssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
		log.info(series.toString());
		seriesService.addseries(series);
		 
		
		 
		 return "back/addseries.jsp";
		 
	
	}
	
	@RequestMapping(value="/selectkey",produces = "text/plain;charset=utf-8")
	public String selectkey(@RequestParam(value = "Title")String Title,@RequestParam(value="startpage",required=false,defaultValue="1") Integer startpage,Map<String, Object> map){
		if(Title==null||("").equals(Title)){
			return "views/search.jsp";
		}
		System.out.println("搜索字段为"+Title);
		PageHelper.startPage(startpage, 15);
		List<Series> keylist=seriesService.selectKeyService(Title);
		PageInfo<Series> pageSeries=new PageInfo<Series> (keylist);
		Integer numKey=keylist.size();
		map.put("pageSeries",pageSeries);
		map.put("search", Title);
		map.put("numKey", numKey);
		map.put("keylist", keylist);
		return "views/search.jsp";
	}

}
