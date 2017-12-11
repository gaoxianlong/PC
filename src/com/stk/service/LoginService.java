package com.stk.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stk.dao.LoginDao;
import com.stk.entity.Users;
import com.stk.entity.WxUser;

/**登录业务*/
@Service
public class LoginService {
	@Autowired
	private LoginDao dao;
	
	/**
	 * 判断用户名和密码是否正确
	 * */
	public Users selectPhoneService(String telephone) throws NullPointerException{
		Users u=dao.selectPhone(telephone);
		return u;	
	}
	/**qq登录增加用户*/
	public void addUsersQQService(WxUser users){
		dao.addUsersQQ(users);
	}
	
	/**微信登录通过UnionID来判断用户是否存在*/
	public WxUser selectUnionIDService(String WeiXinID){
		WxUser users=dao.selectUnionID(WeiXinID);
		return users;
	}
	/**微信用户增加*/
	public void addUsersWXService(WxUser user){
		dao.addUsersWX(user);
	}
	/**通过qqid查询用户*/
	public WxUser selectQQService(String qqid){
		WxUser user=dao.selectQQ(qqid);
		return user;
		
	}
	/**通过微信id查询tuser表*/
	public Users selectWxIDService(Integer wxid){
		return dao.selectWxID(wxid);
		
	}
	/**更改用户的微信id*/
	public void updateWxIDService(Users user){
		dao.updateWxID(user);
	}
	/**微信表中添加手机号*/
	public void updataWxPhoneService(WxUser wxuser){
		dao.updataWxPhone(wxuser);
	}
	/**用户表中增加微信用户*/
	public void addWxToUserService(Users user){
		dao.addWxToUser(user);
	}
	/**用户绑定密码*/
	public void updatePassWordService(Users user){
		dao.updatePassWord(user);
	}
	/**通过qqid查询用户表*/
	public Users selectQqidToUserService(Integer qqid){
		return dao.selectQqidToUser(qqid);
	}
}
