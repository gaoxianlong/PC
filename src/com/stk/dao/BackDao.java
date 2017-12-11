package com.stk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;





import com.stk.entity.Backuser;
import com.stk.entity.Order;
import com.stk.entity.Playrecord;
import com.stk.entity.Seriesvideo;





public interface BackDao {

	
	public Backuser login(Backuser back);
	
}
