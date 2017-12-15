package com.stk.controller.mp;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.stk.entity.Seriesmp;
import com.stk.entity.Sortmp;
import com.stk.entity.Users;
import com.stk.service.SeriesService;
import com.stk.entity.Type;

@Controller
public class MpController {
	protected Logger log = Logger.getLogger(MpController.class);

	@Autowired
	private SeriesService seriesService;
	
	// 音频分类（）
	@RequestMapping(value = "/mpsort")
	@ResponseBody
	public Object wxindexser(
			Map<String, Object> map,
			@RequestParam(value = "id",required = false) Integer id,
			@RequestParam(value = "callback",required = false) String callback,
			HttpSession session
			) {
				
					//		//二级菜单的名称
					//		List<Type> tyer = null;
					//		//取出音频系统一级菜单下对应的二级菜单
					//		if(id!=0){
					//			tyer = seriesService.wxgetMulvsanmp(id);
					//		}
		//备用页面显示点击的一级菜单的名称（暂无用）
//		String nameone=null;
//		// 一级菜单name
//		if(id != 0){
//		    nameone = seriesService.seltypename(id);
//		}
//		map.put("nameone", nameone);
					
							//一级菜单的名称
									List<Type> type = null;
									//取出音频系统所有的一级菜单
									type = seriesService.wxgetMulvsanmp(0);
									
							//对应一级菜单下的音频(或者页面初始化的全部音频文件)
							List<Seriesmp> seriesmp = null;
							
									if(id !=0){
										//取出音频系统所有的音频文件
										seriesmp = seriesService.getSeriesermpyi(id);
									}else{
										//取出音频系统一级菜单下对应的音频文件
										seriesmp = seriesService.getSeriesermptotal();
									}
									
									
									// 一级菜单的ID（页面焦点）
									Integer point = id;
									
									Sortmp sortmp = new Sortmp();
									sortmp.setPoint(point);
									sortmp.setSeriesmp(seriesmp);
									sortmp.setType(type);
									
									JSONPObject jsonpObject = new JSONPObject(callback,sortmp) ;
							        return jsonpObject;
									
									//map.put("point", point);
									
									//音频系统所有的一级菜单
									//map.put("type", type);
									//音频文件
									//map.put("seriesmp", seriesmp);
									
									//return "null";
	}

	// 查询二级菜单视频
	//暂不用
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
