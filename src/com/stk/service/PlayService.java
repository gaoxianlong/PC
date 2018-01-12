package com.stk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stk.entity.Seriesmp;
import com.stk.dao.PlayDao;
import com.stk.entity.Playrecord;
import com.stk.entity.Series;
@Service
public class PlayService {
	@Autowired
	private PlayDao playDao;
	
//mp3
	
	public void ClickRatemp(Integer id){
		playDao.ClickRatemp(id);
	}
		
	public Seriesmp getplaySeriesmp(Integer seriesID){
		return playDao.getplaySeriesmp(seriesID);
	}
//mp3
	/**查询播放记录*/
	public List<Playrecord> selectPlayService(Integer uid){
		List<Playrecord> plist=playDao.selectPlay(uid);
		return plist;	
	}
	
	public void ClickRate(Integer id){
		playDao.ClickRate(id);
	}
	public Series getplaySeries(Integer id){
		return playDao.getplaySeries(id);
	}

	public Playrecord selectPlayOneService(Integer id) {
		// TODO Auto-generated method stub
		return playDao.selectPlayOne(id);
	}
}

