package com.stk.dao;

import com.stk.entity.HelpCodes;
import com.stk.entity.Users;

public interface RegisterDao {
	/**按手机号密码增加用户*/
	public void addphone(Users users);
	/**更改信息*/
	public void updateUsers(Users users);
	/**比对优惠码*/
	public HelpCodes selectCode(String HlepCode);
	/**更改优惠码信息*/
	public void updateCode(HelpCodes codes);
	/**更改学生是否为扶贫*/
	public void updateHelp(Users users);
	/**修改密码*/
	public void updatePwd(Users users);
	/**通过用户id查询*/
	public Users selectUser(Integer id);
	public void updateTwoUsers(Users users);
}
