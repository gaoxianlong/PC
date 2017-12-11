package com.stk.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stk.dao.RegisterDao;
import com.stk.entity.HelpCodes;
import com.stk.entity.Users;

@Service
public class RegisterService {
	@Autowired
	private RegisterDao registerDao;
	
	/**增加用户 手机号码和密码*/
	public void addphoneService(Users users){
		registerDao.addphone(users);
	}
	/**更改信息*/
	public void updateUsersService(Users users){
		registerDao.updateUsers(users);
	}
	/**比对优惠码*/
	public boolean selectCodeService(String hlepCode){
		HelpCodes code=registerDao.selectCode(hlepCode);
		if(code!=null){
			if(code.getNum()>0){
			Integer num=code.getNum()-1;
			code.setNum(num);
			System.out.println("数量为777"+num);
			registerDao.updateCode(code);
			return true;
			}
		}
		return false;
	}
	/**更改为扶贫学生*/
	public void updateHelp(Users users){
		registerDao.updateHelp(users);
	}
	
	/**修改密码*/
	public void updatePwdService(Users users){
		registerDao.updatePwd(users);
	}
	/**通过用户id查询*/
	public Users selectUserService(Integer id){
		return registerDao.selectUser(id);
	}
	
}
