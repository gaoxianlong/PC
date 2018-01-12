package com.stk.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.aliyun.mns.model.BatchSmsAttributes;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;
import com.stk.entity.OrderSms;
import com.stk.entity.Users;
import com.stk.service.LoginService;
import com.stk.service.RegisterService;
import com.stk.util.HttpSenderUtils;
import com.stk.util.MD5Util;
import com.stk.util.Sha256Utile;

/**
 * 注册
 * */
@Controller
public class RegisterController {
	@Autowired
	private RegisterService registerService;
	@Autowired
	private LoginService loginService;
	//注入model
		@ModelAttribute
		public void getType(
				@RequestParam(value = "ID", required = false) Integer ID,
				Map<String, Object> map) {
			if (ID != null) {
				map.put("users", registerService.selectUserService(ID));
			}
		}
	
	
	/** 获取短信验证码 */
	@RequestMapping("/SendCodeSMS")
	@ResponseBody
	public String SendCodeSMS(String telephone, HttpServletRequest request,
			HttpSession session) throws Exception {
		Users u = loginService.selectPhoneService(telephone);
		if(u==null){
			HttpSenderUtils.fasong(telephone, session);
			
			return "true";
		
		}
		return null;
		
	}
	/**判断前端用户输入的验证码是否正确*/
	@RequestMapping("/CheckVcode")
	@ResponseBody
	public String CheckVcode(String vcode,HttpSession session){
		System.out.println("前台随机码8888888888888888888/"+vcode);
		
		String vcode1=(String) session.getAttribute("vcode");
		System.out.println("后台随机吗"+vcode1);
		if(vcode.equals(vcode1)){
			return "true";
		}
		return "false";
	}
	@RequestMapping("/CheckVcode2")
	@ResponseBody
	public boolean CheckVcode2(String vcode,HttpSession session){
		System.out.println("前台随机码8888888888888888888/"+vcode);
		
		String vcode1=(String) session.getAttribute("vcode");
		System.out.println("后台随机吗"+vcode1);
		if(vcode.equals(vcode1)){
			return true;
		}
		return false;
	}
	/**用户忘记密码
	 * @throws Exception */
	@RequestMapping("/forgetpwd")
	@ResponseBody
	public String forgetpwd(String telephone,HttpSession session) throws Exception{
		HttpSenderUtils.fasong(telephone, session);
			return "false";
	}

	/**用户注册  只输入手机和密码*/
	@RequestMapping("/addUsers")
	@ResponseBody
	public String addUsers(String telephone,String password,HttpSession session){
		System.out.println("手机号"+telephone+"密码"+password);
		Users users=new Users();
		//给密码加密并且保存到数据库中
		String random=Sha256Utile.getSalt();
		System.out.println(random);
		String random1=random;
		password=Sha256Utile.passWord(random, password);
		users.setPassword(password);
		users.setSalt(random1);
		users.setTelephone(telephone);
		users.setRegistertime(new Date());
		registerService.addphoneService(users);
		//保存后查询用户信息
		Users user=loginService.selectPhoneService(telephone);
		session.setAttribute("u", user);
	//	session.setMaxInactiveInterval(43200);
		
		return "ok";
	}
	/**更改用户资料*/
	@RequestMapping("/update")
	public String update(Users users,HttpSession session,Map<String, Object> map){
		//先获取用户信息
		System.out.println(users.toString());
		Users user=(Users) session.getAttribute("u");
		System.out.println("session中users="+user.toString());
		users.setTelephone(user.getTelephone());
		registerService.updateUsersService(users);
		//保存后查询用户信息
		Users use=loginService.selectPhoneService(users.getTelephone());
		map.put("u", use);
		session.setAttribute("u", use);
		System.out.println(use.toString());
		
		//session.setMaxInactiveInterval(43200);
		return "redirect:/getmenuindex";
	}
	/**更改用户资料*/
	@RequestMapping("/update2")
	public String update2(Users users,MultipartFile mf,HttpSession session){
		//先获取用户信息
		System.out.println(users.toString()+"");
		
		Users user=(Users) session.getAttribute("u");
		System.out.println("session中users="+user.toString());
		users.setTelephone(user.getTelephone());
	
			//保存到文件夹
			try {
			System.out.println("2222222222222222222222222");
			String path=session.getServletContext().getRealPath("userhadle");		
			String fileName=mf.getOriginalFilename();
			if(fileName!=""){
			Integer index=fileName.lastIndexOf(".");
			//File file=new File(path,fileName);
			//在path目录下创建文件
			System.out.println("第一个名字为"+fileName);
			fileName=UUID.randomUUID().toString()+fileName.substring(index);
			File file=new File(path,fileName);
			
			System.out.println("第二个"+fileName);
			FileUtils.writeByteArrayToFile(file, mf.getBytes());
			users.setHeadUrl("userhadle/"+fileName);
			//users.setHeadUrl(fileName);
			}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
			
		registerService.updateUsersTwoService(users);
		//保存后查询用户信息
		Users use=loginService.selectPhoneService(users.getTelephone());
		session.setAttribute("u", use);
	//	session.setMaxInactiveInterval(43200);
		return "redirect:/views/personal.jsp";
	}
	
	/**优惠码*/
	@RequestMapping("/gethelpCode")
	@ResponseBody
	public String gethelpCode(String HelpCode,HttpSession session){
		boolean flag=registerService.selectCodeService(HelpCode);
		if(flag){
			Users users=(Users) session.getAttribute("u");
			users.setHelpCode(HelpCode);
			registerService.updateHelp(users);
			//保存后查询用户信息
			Users user=loginService.selectPhoneService(users.getTelephone());
			session.setAttribute("u", user);
		//	session.setMaxInactiveInterval(43200);
			return "true";
		}
		return "flase";
	}
	/** 修改用户密码 */
	@RequestMapping("/updatepwd")
	@ResponseBody
	public String updatepwd(String password, String telephone,
			HttpSession session) {
		System.out.println("用户名为：" + telephone + "\t" + "密码为：" + password);
		Users user = loginService.selectPhoneService(telephone);
		
		// 获取随机数
		if (user != null) {
			String random = Sha256Utile.getSalt();
			String random1 = random;
			// 倒序
			password=Sha256Utile.passWord(random, password);
			user.setPassword(password);
			user.setSalt(random1);
			
			registerService.updatePwdService(user);
		
			
			
		} else {
			Users users = new Users();
			// 给密码加密并且保存到数据库中
			String random = Sha256Utile.getSalt();
			String random1 = random;
			password=Sha256Utile.passWord(random, password);

			users.setPassword(password);
			users.setSalt(random1);
			users.setTelephone(telephone);
			users.setRegistertime(new Date());
			registerService.addphoneService(users);
			// 保存后查询用户信息
			
		}
		
		return "redirect:/getmenuindex";

	}

/**修改密码*/
	@RequestMapping("/updatepassword")
	public String updatepassword(String password,
			HttpSession session) {
		System.out.println( "密码为：" + password);
		Users user=(Users) session.getAttribute("u");
			String random = Sha256Utile.getSalt();
			String random1 = random;
			password=Sha256Utile.passWord(random, password);

			user.setPassword(password);
			user.setSalt(random1);
			registerService.updatePwdService(user);
			Users users = loginService.selectPhoneService(user.getTelephone());
			session.setAttribute("u", users);
			//session.setMaxInactiveInterval(43200);
		return "redirect:/views/personal.jsp";
	}
	/**查询该用户是否有优惠码*/
	@RequestMapping("/selectHelpCode")
	@ResponseBody
	public boolean selectHelpCode(Map<String, Object> map,Integer uid){
		Users user=registerService.selectUserService(uid);
		if(user.getHelpCode().length()!=0){
			return true;
		}
		return false;
	}
}

