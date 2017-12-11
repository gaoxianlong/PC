package com.stk.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stk.dao.BackDao;
import com.stk.entity.Backuser;




@Service
public class BackService {

	@Autowired
	private BackDao backDao;

	public Backuser login(Backuser back){
		
		return backDao.login(back);
	}

}
