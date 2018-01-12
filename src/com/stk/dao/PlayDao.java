package com.stk.dao;

import java.util.List;

import com.stk.entity.Seriesmp;
import com.stk.entity.Playrecord;
import com.stk.entity.Series;

/**播放记录*/
public interface PlayDao {
	/**查询播放记录*/
	//mp3
	
	public void ClickRatemp(Integer id);
	public Seriesmp getplaySeriesmp(Integer seriesID);
	//mp3
	public List<Playrecord> selectPlay(Integer uid);
	public void ClickRate(Integer id);
	public Series getplaySeries(Integer id);
	public Playrecord selectPlayOne(Integer id);

	
}
