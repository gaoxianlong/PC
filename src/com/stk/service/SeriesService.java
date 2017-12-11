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
			//total
	public List<Seriesmp> getSeriesermptotal(){
		return seriesDao.getSeriesermptotal();
	}
	public List<Seriesmp> getSeriesermpyi(Integer id){
		return seriesDao.getSeriesermpyi(id);
	}
	public List<Seriesmp> getSeriesermper(Integer id){
		return seriesDao.getSeriesermper(id);
	}
	public String seltypename(Integer id){
		return seriesDao.seltypename(id);
	}
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
