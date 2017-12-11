package com.stk.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.stk.entity.Comment;
import com.stk.entity.Users;
import com.stk.entity.Zan;
import com.stk.service.CommentService;
import com.stk.service.ZanService;
import com.stk.util.DateUtils;

@Controller
public class CommentController {
	@Autowired
	private CommentService service;
	@Autowired
	private ZanService zanService;
	
	/**查询所有评论   按课程的id查询*/
	@RequestMapping("/selectComment")
	@ResponseBody
	public List<Comment> selectComment( Integer vid,Map<String, Object> map,Integer uid){ 
		List<Comment> comm=service.selectCommService(vid);
		List<Comment> comm1=new ArrayList<Comment>();
		for(Comment c:comm){
			boolean falg=zanService.selectCommentService(uid, c.getId());
			c.setZan(falg);
			Integer num=zanService.selectCountService(c.getId());
			String date1=c.getAddtimes().substring(0,10);
			c.setAddtimes(date1);
			c.setNumzan(num);
			System.out.println("list等于==="+c);
			comm1.add(c);
		}
		map.put("comment", comm1);
		return comm1;		
	}
	@RequestMapping(value="addComment",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String addComment(Comment comment){
		
		comment.setAddtimes(DateUtils.getFormatDateYMDHMS()); 
		System.out.println(comment.toString());
		boolean flag=service.addCommService(comment);
		if(flag){
			return "success";
		}
		return "error";	
	}
}
