package com.stk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.stk.entity.Carousel;
import com.stk.entity.Series;
import com.stk.entity.Type;

public interface SelTypeDao {
/*
 * 
 * 
 * 
 * 通过传的id，parentID 找到对应的课程
 */
	
	public List<Series> getfree(String free);
	
	public List<Type> getMulvyisub(Integer id);
	
	public List<Type> getMulvyi(Integer id);

	public List<Type> getMulversub(Integer id);
	
	public List<Type> getMulver(Integer id);
	public List<Type> getMulverxiugai(Integer id);
	
	public List<Type> getMulvsan(Integer id);
	
	public List<Type> getMulvsansub(Integer id);
	public List<Type> getMulvtotal();
	
	
	//根据传入的一级id值取出对应的课程封面
	public List<Series> getSeriesyi(Integer id);
	//根据传入的二级id值取出对应的课程封面
	public List<Series> getSerieser(Integer id);
	//根据传入的三级id值取出对应的课程封面
	public List<Series> getSeriessan(Integer id);

	//public Basic getBasById(Integer id);

	//轮播图的id
	public List<Carousel> getCarousel();

	public List<Series> getSeriesCarousel(Integer id);
	//扶贫小学目录
	public List<Type> getFpMulv(Integer id);
	//扶贫学前课程
	public List<Series> getFppreSeries(Integer id);
	//扶贫小学课程
	public List<Series> getFppreSerieser(Integer id);
	//所有扶贫课程
	public List<Series> totalfpSerieser();
	//所有课程
	public List<Series> totalSerieserzh();
	public List<Series> totalSerieserzr();
	public List<Series> totalSerieserzx();
	
	public void addtypeyi(Type type);
	public void addtypeer(Type type);
	public void addtypesan(Type type);
	
	public void uptypeyi(Type type);
	
	public Type upgetMulvyi(Integer id);
	
	//三级菜单的total 视频
	public List<Series> selthirdcourse(@Param("ls")List ls);
	//二级菜单的total 视频
	public List<Series> selsecondcourse(@Param("ls")List ls);
	
	public List<Type> selsecondType(@Param("ls")List ls);
	
}
