package com.stk.dao;

import java.util.List;

import com.stk.entity.Collect;
import com.stk.entity.Seriesvideo;
import com.stk.entity.Zan;

/**点赞和收藏*/
public interface ZanDao {
	/**查询是否已点赞   需要用户id和视频id、评论id、回答id*/
	public Integer selectComment(Integer uid,Integer cid);
	/**查询视频id、评论id、回答id点赞总数*/
	public Integer selectCount(Integer cid);
	/**增加赞*/
	public void addzan(Zan zan);
	/**取消评论点赞*/
	public void deleteZan(Integer uid,Integer cid);
	/**取消视频点赞*/
	public void deleteZanvo(Integer uid,Integer vid);
	/**增加或减少视频点赞数量*/
	public void addvideo(Integer zanNum,Integer id);
	/**查询视频点赞量*/
	public Integer selectZanV(Integer id);
	/**查询视频是否已点赞   需要用户id和视频id、评论id、回答id*/
	public Integer selectVideo(Integer uid,Integer vid);
	/**增加收藏*/
	public void addCollect(Collect collect);
	/**增加减少视频收藏数*/
	public void addCollVideo(Integer shoucts,Integer id);
	/**查询视频收藏量*/
	public Integer selectCollV(Integer id);
	/**查询是否已收藏*/
	public Integer selectCollect(Integer uid,Integer vid);
	/**减少收藏*/
	public void deleteCollect(Integer uid,Integer vid);
	/**查询收藏记录*/
	public List<Collect> selectCollectAll(Integer uid);

}
