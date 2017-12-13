package com.jcxa.safe.controller.mp;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.stk.entity.Seriesmp;
import com.stk.entity.Users;
import com.stk.service.SeriesService;
import com.stk.entity.Type;

@Controller
public class MpController {
	protected Logger log = Logger.getLogger(MpController.class);

	@Autowired
	private SeriesService seriesService;
	
	// 查询二级菜单视频
	@RequestMapping(value = "/wxmp")
	public String wxindexser(
			Map<String, Object> map,
			@RequestParam(value = "id",required = false) Integer id,
			HttpSession session
			) {
		List<Type> type = null;
		List<Type> tyer = null;
		List<Seriesmp> seriesmp = null;
		type = seriesService.wxgetMulvsanmp(0);
		if(id!=null){
			tyer = seriesService.wxgetMulvsanmp(id);
		}
		// 取出用户信息
		Users user = (Users) session.getAttribute("user");
		
				if(id !=null){
					seriesmp = seriesService.getSeriesermpyi(id);
				}else{
					seriesmp = seriesService.getSeriesermptotal();
				}
				
				String nameone=null;
				// 一级菜单name
				if(id != null){
				    nameone = seriesService.seltypename(id);
				}
				
				map.put("nameone", nameone);
				// 二级菜单name
				String nametwo = null;
				map.put("nametwo", nametwo);
				// 一级菜单
				Integer point = id;
				map.put("point", point);
				
				map.put("type", type);
				map.put("tyer", tyer);
				map.put("seriesmp", seriesmp);
				
			

				return "null";
	}

	// 查询二级菜单视频
	@RequestMapping(value = "/wxmpright")
	public String wxmpright(
			Map<String, Object> map,
			@RequestParam(value = "id") int id,
			@RequestParam(value = "erid") Integer erid,
			HttpSession session
			) {
		List<Type> type = null;
		List<Type> tyer = null;
		List<Seriesmp> seriesmp = null;
		type = seriesService.wxgetMulvsanmp(0);
		tyer = seriesService.wxgetMulvsanmp(id);
		// 取出用户信息
		Users user = (Users) session.getAttribute("user");

		// 音频封面
		seriesmp = seriesService.getSeriesermper(erid);
		// 一级菜单name
		String nameone = seriesService.seltypename(id);
		map.put("nameone", nameone);
		// 二级菜单name
		String nametwo = seriesService.seltypename(erid);
		map.put("nametwo", nametwo);
		// 一级菜单
		Integer point = id;
		map.put("point", point);
		// 二级菜单
		Integer pointer = erid;
		map.put("pointer", pointer);
		// 一二级菜单
		map.put("type", type);
		map.put("tyer", tyer);
		map.put("seriesmp", seriesmp);
		
		return "null";

	}

}
