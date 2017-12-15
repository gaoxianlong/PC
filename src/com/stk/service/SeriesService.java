package com.stk.service;



import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stk.entity.Type;
import com.stk.dao.SelTypeDao;
import com.stk.dao.SeriesDao;
import com.stk.entity.Series;
import com.stk.entity.Seriesmp;
import com.stk.entity.Seriesvideo;

@Service
public class SeriesService {

	@Autowired
	private SeriesDao seriesDao;
	//MP3
			
	//轮播图 音频文件
	public List<Seriesmp> getCarouselfigure(Integer id){
		return seriesDao.getCarouselfigure(id);
	}
	//推荐 音频文件
	public List<Seriesmp> getmppushone(Integer id){
		return seriesDao.getmppushone(id);
	}
	//total 所有音频文件
	public List<Seriesmp> getSeriesermptotal(){
		return seriesDao.getSeriesermptotal();
	}
	//根据 TypeValue 查询一级菜单的音频
	public List<Seriesmp> getSeriesermpyi(Integer id){
		return seriesDao.getSeriesermpyi(id);
	}
	//根据 Type2Value 查询二级菜单的音频
	public List<Seriesmp> getSeriesermper(Integer id){
		return seriesDao.getSeriesermper(id);
	}
	//查询菜单的名称
	public String seltypename(Integer id){
		return seriesDao.seltypename(id);
	}
	//根据 ParentID 查询下一级菜单的名称
	public List<Type> wxgetMulvsanmp(Integer id){
		return seriesDao.wxgetMulvsanmp(id);
	}
	
	//MP3
	
	public void addseries(Series series){
		seriesDao.addseries(series);
	}
	
	public void upserieser(Series series){
		seriesDao.upserieser(series);
	}
	public void upseriessan(Series series){
		seriesDao.upseriessan(series);
	}
	public Series hsgetSeries(Integer id){
		return seriesDao.hsgetSeries(id);
	}
	public void addaccountvideo(List<Seriesvideo> sec){
		seriesDao.addaccountvideo(sec);
	}
	/**关键词搜索*/
	public List<Series> selectKeyService(String search){
		return seriesDao.selectKey(search);
	
	}
	
}
