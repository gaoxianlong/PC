package com.stk.dao;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder.In;

import com.stk.entity.Comment;

/**评论业务*/
public interface CommentDao {
	/**查询评论*/
	public List<Comment> selectComm(Integer vid);
	/**增加评论*/
	public boolean addComm(Comment comment);
	
}
