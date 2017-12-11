package com.stk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;






import com.stk.entity.Order;
import com.stk.entity.Playrecord;
import com.stk.entity.Seriesvideo;
import com.stk.entity.Wxorder;





public interface OrderDao {
//mp3
	//判断用户是否添加该课程的播放记录
	public Playrecord getrecordmp(@Param("uid")Integer uid,@Param("vid")Integer vid);
	//添加播放记录	
	public void addrecordmp(Playrecord playrecord);
	//得到具体视频的信息
	public Seriesvideo playvideomp(Integer id);
	//得到下一个具体视频的信息
	public Seriesvideo selnextmp(@Param("seriesID")Integer seriesID,@Param("sort")Integer sort);
	public List<Seriesvideo> getvideomp(Integer seriesID);
	
//mp3
	
	//判断用户是否购买该课程
	public Order getorderserid(@Param("userID")Integer userID,@Param("seriesID")Integer seriesID);
	//得到具体视频的信息
	public Seriesvideo playvideo(Integer id);
	//得到下一个具体视频的信息
	public Seriesvideo selnext(@Param("seriesID")Integer seriesID,@Param("sort")Integer sort);
	/*
	 * 查询课程封面对应的视频
	 */
	public List<Seriesvideo> getvideo(Integer seriesID);
	public List<Seriesvideo> videofree(Integer seriesID);
	public List<Seriesvideo> videopay(Integer seriesID);
	//查出用户的播放视频的ID
	public List<Playrecord> playrecord(Integer uid);
	
	//判断用户是否添加该课程的播放记录
	public Playrecord getrecord(@Param("uid")Integer uid,@Param("vid")Integer vid);
	//添加播放记录	
	public void addrecord(Playrecord playrecord);
	
	public int selmaxsort(Integer seriesID);
	
	//  查询订单是否付款
	public  Order orderpay(String outtradeno);
	//  查询VIP是否付款
	public  Wxorder vippay(String outtradeno);
	
}
