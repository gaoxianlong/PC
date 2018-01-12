package com.stk.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stk.dao.SelTypeDao;
import com.stk.entity.Carousel;
import com.stk.entity.Series;
import com.stk.entity.Type;
import com.stk.entity.Users;

@Service
public class SelTypeService {

	@Autowired
	private SelTypeDao selTypeDao;

	/*
	 * 
	 * 
	 * 通过传的id，parentID 找到对应的课程
	 */
	
	public List<Series> getfree(String free){
		return selTypeDao.getfree(free);
	}
	
	public List<Type> getMulvyi(Integer id) {

		return selTypeDao.getMulvyi(id);

	}

	public List<Type> getMulvyisub(Integer id) {

		return selTypeDao.getMulvyi(id);

	}

	public List<Type> getMulver(Integer id) {

		return selTypeDao.getMulver(id);

	}
	public List<Type> getMulverxiugai(Integer id) {

		return selTypeDao.getMulverxiugai(id);

	}

	public List<Type> getMulversub(Integer id) {

		return selTypeDao.getMulversub(id);

	}

	public List<Type> getMulvsan(Integer id) {

		return selTypeDao.getMulvsan(id);

	}

	public List<Type> getMulvsansub(Integer id) {

		return selTypeDao.getMulvsansub(id);

	}

	public List<Type> getMulvtotal() {

		return selTypeDao.getMulvtotal();

	}

	/*
	 * 传递id 判断是（1,2,3）级菜单，取出相对应的课程
	 */
	public List<Series> getSeriesyi(Integer id) {

		return selTypeDao.getSeriesyi(id);

	}

	public List<Series> getSerieser(Integer id) {

		return selTypeDao.getSerieser(id);

	}

	public List<Series> getSeriessan(Integer id) {

		return selTypeDao.getSeriessan(id);

	}

	/*
	 * 
	 * 轮播图
	 */
	public List<Carousel> getCarousel() {

		return selTypeDao.getCarousel();

	}

	public List<Series> getSeriesCarousel(Integer id) {

		return selTypeDao.getSeriesCarousel(id);

	}

	// // 从basic中取出vul_id
	// public String getBasvulById(Integer id) {
	//
	// return basicDao.getBasvulById(id);
	// }

	// 扶贫小学目录
	public List<Type> getFpMulv(Integer id) {
		return selTypeDao.getFpMulv(id);
	}

	// 扶贫学前课程
	public List<Series> getFppreSeries(Integer id) {
		return selTypeDao.getFppreSeries(id);
	}

	// 扶贫小学课程
	public List<Series> getFppreSerieser(Integer id) {
		return selTypeDao.getFppreSerieser(id);

	}

	// 所有扶贫课程
	public List<Series> totalfpSerieser() {
		return selTypeDao.totalfpSerieser();
	}

	// 所有课程
	public List<Series> totalSerieserzh() {
		return selTypeDao.totalSerieserzh();
	}

	// 所有课程
	public List<Series> totalSerieserzr() {
		return selTypeDao.totalSerieserzh();
	}

	// 所有课程
	public List<Series> totalSerieserzx() {
		return selTypeDao.totalSerieserzh();
	}
	
	
	public void addtypeyi(Type type){
		selTypeDao.addtypeyi(type);
	}
	public void addtypeer(Type type){
		selTypeDao.addtypeer(type);
	}
	public void addtypesan(Type type){
		selTypeDao.addtypesan(type);
	}
	
	public void uptypeyi(Type type){
		selTypeDao.uptypeyi(type);
	}
	
	public Type upgetMulvyi(Integer id){
		return selTypeDao.upgetMulvyi(id);
		
	}
	
	public List<Series> selthirdcourse(@Param("ls")List ls){
		return selTypeDao.selthirdcourse(ls);
	}
	
	public List<Series> selsecondcourse(@Param("ls")List ls){
		return selTypeDao.selsecondcourse(ls);
	}
	
	public List<Type> selsecondType(@Param("ls")List ls){
		return selTypeDao.selsecondType(ls);
	}
}
