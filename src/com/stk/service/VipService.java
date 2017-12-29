package com.stk.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stk.dao.VipDao;
import com.stk.entity.Order;
import com.stk.entity.OrderandSeries;
import com.stk.entity.Wxorder;



@Service
public class VipService {
	@Autowired
	private VipDao vipDao;
	
	
	public Order getOrders(@Param("uid")Integer uid,@Param("seid")Integer seid){
		
		return vipDao.getoor(uid,seid);
	}
	public boolean getoornotnull(@Param("uid")Integer uid,@Param("seid")Integer seid){
		
		return vipDao.getoor(uid,seid) != null;
	}
	
	public Wxorder getwxorder(@Param("uid")Integer uid){
		
		return vipDao.getwxorder(uid);
		
	}
	
	public boolean  judvip(@Param("uid")Integer uid) {

		return vipDao.getwxorder(uid) != null;

	}
	
	public boolean  getpuorder(@Param("statu")String statu) {

		return vipDao.getpuorder(statu) != null;

	}
	
	public boolean getoor(@Param("uid")Integer uid,@Param("seid")Integer seid){
		
		return vipDao.getoor(uid,seid) == null;
	}
	
	public boolean  getTephone(@Param("ID")Integer ID) {
		
		return vipDao.getTephone(ID) != null;

	}
	
	public void addvip(Wxorder wxorder){
		
		 vipDao.addvip(wxorder);
	}

	public void addorder(Order order){
		
		vipDao.addorder(order);
	}
	
	//查询用户自己单个购买的课程订单
	public List<OrderandSeries> selorderandk(Integer id){
		return vipDao.selorderandk(id);
	}
	
}

