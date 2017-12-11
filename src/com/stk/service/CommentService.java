package com.stk.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stk.dao.CommentDao;
import com.stk.entity.Comment;
@Service
public class CommentService {
	@Autowired
	private CommentDao dao;
	/**查询所有评论*/
	public List<Comment> selectCommService(Integer vid){
		List<Comment> comm=dao.selectComm(vid);
		
		return comm;
	}
	/**增加评论*/
	public boolean addCommService(Comment comment) {
		if(comment.getCid()==null){
			comment.setCid(null);
		}
		
		boolean falg=dao.addComm(comment);
		if(falg!=true){
			return false;
		}
		return true;
	}
}
