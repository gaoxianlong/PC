package com.stk.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stk.dao.OrderDao;
import com.stk.entity.Order;
import com.stk.entity.Playrecord;
import com.stk.entity.Seriesvideo;




@Service
public class OrderService {

	@Autowired
	private OrderDao orderDao;
	
//mp3
	
	//判断用户是否添加该课程的播放记录
	public boolean  getrecordmp(Integer uid,Integer vid) {
		return orderDao.getrecordmp(uid,vid) == null;
	}

	//添加播放记录	
	public void addrecordmp(Playrecord playrecord) {
		orderDao.addrecordmp(playrecord);
	}
	
	//得到具体视频的信息
	public Seriesvideo playvideomp(Integer id) {
		return orderDao.playvideomp(id);
	}

	//得到下一个具体视频的信息
	public Seriesvideo selnextmp(Integer seriesID,Integer sort) {
		return orderDao.selnextmp(seriesID,sort);
	}
	
	public List<Seriesvideo> getvideomp(Integer seriesID) {
		return orderDao.getvideomp(seriesID);
	}
	
//mp3
	
	//判断用户是否购买该课程
	public boolean  getorderserid(Integer userID,Integer seriesID) {

		return orderDao.getorderserid(userID,seriesID) != null;

	}
	
	//判断用户是否添加该课程的播放记录
	public boolean  getrecord(Integer uid,Integer vid) {

		return orderDao.getrecord(uid,vid) == null;

	}

	//得到下一个具体视频的信息
	public Seriesvideo selnext(Integer seriesID,Integer sort) {

		return orderDao.selnext(seriesID,sort);

	}
	
	//得到具体视频的信息
	public Seriesvideo playvideo(Integer id) {

		return orderDao.playvideo(id);

	}
	
	/*
	 * 查询课程封面对应的视频
	 */
	public List<Seriesvideo> getvideo(Integer seriesID) {

		return orderDao.getvideo(seriesID);

	}
	
	public List<Seriesvideo> videofree(Integer seriesID) {

		return orderDao.videofree(seriesID);

	}
	
	public List<Seriesvideo> videopay(Integer seriesID) {

		return orderDao.videopay(seriesID);

	}
	
	//查出某个用户播放视频的ID
		public List<Playrecord> playrecord(Integer uid){
			
			return orderDao.playrecord(uid);
			
		}
	//添加播放记录	
		public void addrecord(Playrecord playrecord) {
			orderDao.addrecord(playrecord);
		}
	//查询max(sort)排序 
		public int selmaxsort(Integer seriesID){
			
			return orderDao.selmaxsort(seriesID);
			
		}
		
	//  查询订单是否付款
		public  boolean orderpay(String outtradeno){
			return orderDao.orderpay(outtradeno) == null;
		}
	//  查询VIP是否付款
		public  boolean vippay(String outtradeno){
			return orderDao.vippay(outtradeno) == null;
		}
		

}
