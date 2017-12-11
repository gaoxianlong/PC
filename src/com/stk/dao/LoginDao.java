package com.stk.dao;

import org.springframework.beans.factory.annotation.Autowired;

import com.stk.entity.Users;
import com.stk.entity.WxUser;
/**
 * 登录
 * */
public interface LoginDao {
	/**
	 * 判断用户名和密码是否正确
	 * */
	public Users selectPhone(String telephone);
	/**qq登录增加用户*/
	public void addUsersQQ(WxUser users);
	/**微信登录通过UnionID来判断用户是否存在*/
	public WxUser selectUnionID(String WeiXinID);
	/**微信用户增加*/
	public void addUsersWX(WxUser user);
	/**通过qqid查询用户*/
	public WxUser selectQQ(String qqid);
	/**通过微信id查询tuser表*/
	public Users selectWxID(Integer wxid);
	/**更改用户的微信id*/
	public void updateWxID(Users user);
	/**微信表中添加手机号*/
	public void updataWxPhone(WxUser wxuser);
	/**用户表中增加微信用户*/
	public void addWxToUser(Users user);
	/**用户绑定密码*/
	public void updatePassWord(Users user);
	/**通过qqid查询用户表*/
	public Users selectQqidToUser(Integer qqid);
}
