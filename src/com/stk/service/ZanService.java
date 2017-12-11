package com.stk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stk.dao.ZanDao;
import com.stk.entity.Collect;
import com.stk.entity.Zan;

/**点赞和收藏*/
@Service
public class ZanService {
	@Autowired 
	private ZanDao dao;
	/**查询是否已点赞*/
	public boolean selectCommentService(Integer uid,Integer cid) {
		Integer count=dao.selectComment(uid, cid);
		boolean flag;
		if(count!=0){
			flag=true;
			
		}else{
			flag=false;
		}
		return flag;
	}
	/**查询视频id、评论id、回答id点赞总数*/
	public Integer selectCountService(Integer cid){
		Integer count=dao.selectCount(cid);
		return count;
	}
	/**增加赞*/
	public void addzanService(Zan zan){
		dao.addzan(zan);
	}
	
	/**取消点赞*/
	public void deleteZanService(Integer uid,Integer cid){
		dao.deleteZan(uid, cid);
	}
	/**取消视频点赞*/
	public void deleteZanvo(Integer uid,Integer vid){
		dao.deleteZanvo(uid, vid);
	}
	/**增加或减少视频点赞数量*/
	public void addvideoService(Integer zanNum,Integer id){
		dao.addvideo(zanNum,id);
	}
	/**查询视频点赞量*/
	public Integer selectZanVService(Integer id){
		Integer num=dao.selectZanV(id);
		return num;
	}
	/**查询视频是否已点赞*/
	public boolean selectVideoService(Integer uid,Integer vid) {
		Integer count=dao.selectVideo(uid, vid);
		boolean flag;
		if(count!=0){
			flag=true;
			
		}else{
			flag=false;
		}
		return flag;
	}
	
	/**增加收藏*/
	public void addCollectService(Collect collect){
		dao.addCollect(collect);
	}
	/**增加减少视频收藏数*/
	public void addCollVideo(Integer shoucts,Integer id){
		dao.addCollVideo(shoucts, id);
	}
	/**查询视频收藏量*/
	public Integer selectCollVService(Integer id){
		Integer shoucts=dao.selectCollV(id);
		return shoucts;
	}
	/**查询是否已收藏*/
	public Boolean selectCollect(Integer uid,Integer vid){
		Integer count=dao.selectCollect(uid, vid);
		boolean flagColl;
		if(count!=0){
			flagColl=true;
			
		}else{
			flagColl=false;
		}
		return flagColl;
	}
	/**减少收藏*/
	public void deleteCollectService(Integer uid,Integer vid){
		dao.deleteCollect(uid, vid);
		
	}
	/**查询收藏记录*/
	public List<Collect> selectCollAllService(Integer uid){
		List<Collect> clist=dao.selectCollectAll(uid);
		return clist;
		
	}
}
