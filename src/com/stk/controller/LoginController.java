package com.stk.controller;

import java.io.Reader;
import java.nio.channels.SeekableByteChannel;

import javax.jms.Session;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.stk.entity.Users;
import com.stk.entity.WxUser;
import com.stk.service.LoginService;
import com.stk.service.RegisterService;
import com.stk.util.Sha256Utile;

@Controller
public class LoginController {
	@Autowired
	private LoginService service;
	@Autowired
	private RegisterService registerService;

	/** 通过手机号码查询用户信息 */
	@RequestMapping(value = "/selectphone", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String selectphone(@RequestParam("telephone") String Telephone,
			@RequestParam("password") String Password, HttpSession session) {
		System.out.println("用户名为：" + Telephone + "\t" + "密码为：" + Password);
		Users u = service.selectPhoneService(Telephone);
		// 给密码加密
		String pwd = Password;
		String random = u.getSalt();
		random = new Sha256Utile().swapWords(random);
		random.replace("-", "");
		System.out.println(random);
		StringBuilder sb = new StringBuilder(random);
		sb.replace(1, 2, pwd);
		String marStrNew = sb.toString();
		Password = Sha256Utile.jdksha(marStrNew);
		System.out.println(Password + "密码");
		System.out.println(u.getPassword() + "数据库");
		if (Telephone.equals(u.getTelephone())
				&& Password.equals(u.getPassword())) {
			session.setAttribute("u", u);
			// session.setMaxInactiveInterval(10800);
			System.out.println("该用户信息为+" + u.toString());
			return "true";
		} else {
			return "false";
		}
	}

	/** 输入手机号码后判断手机号是否存在 */
	@RequestMapping(value = "/getphone", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String getphone(@RequestParam("telephone") String telephone,
			HttpSession session) {
		Users u = service.selectPhoneService(telephone);
		if (u == null) {// 如果为空，说明该手机号未注册过
			return "true";
		} else {
			return "false";
		}
	}

	/** 清除session 退出 */
	@RequestMapping("/loginSession")
	public String loginSession(HttpSession session, HttpServletResponse response) {
		session.invalidate();

		Cookie cookie = new Cookie("password-stk", null);
		cookie.setMaxAge(0);
		response.addCookie(cookie);

		return "redirect:/getmenuindex";
	}

	/** 微信扫码后添加手机号 */
	@RequestMapping("/addWxUserPhone")
	public String addWxUserPhone(String telephone, HttpSession session) {
		Users user = service.selectPhoneService(telephone);
		WxUser wxuser = (WxUser) session.getAttribute("wxuser");
		// 判断用户是否有手机号 不为空时 手机号存在 为空时手机号不存在

		if (user != null) {
			System.out.println("用户的信息不为空");
			// 判断是微信还是qq
			if (wxuser.getUnionid() != null) {
					System.out.println("我是已有手机号的微信用户");
					user.setCity1(wxuser.getCity1());
					user.setCity2(wxuser.getCity2());
					user.setUnionid(wxuser.getUnionid());
					user.setWXopendID(wxuser.getID());
				} else {
					System.out.println("我是已有手机号的qq用户");
					user.setQqid(wxuser.getID());
				}
			user.setNickName(wxuser.getNickName());
			user.setHeadUrl(wxuser.getHeadUrl());
			user.setSex(wxuser.getSex());
			service.updateWxIDService(user);
			wxuser.setTelephone(telephone);
			service.updataWxPhoneService(wxuser);
			Users u = service.selectPhoneService(telephone);
			session.setAttribute("u", u);
			return "redirect:/getmenuindex";
		} else {
			// 为空时创建新的信息
			Users u = new Users();
			if (wxuser.getUnionid() != null) {
				System.out.println("我是新增的微信用户");
				u.setCity1(wxuser.getCity1());
				u.setCity2(wxuser.getCity2());
				u.setUnionid(wxuser.getUnionid());
				u.setWXopendID(wxuser.getID());
			} else {
				System.out.println("我是新增的qq用户");
				u.setQqid(wxuser.getID());
			}
			u.setNickName(wxuser.getNickName());
			u.setHeadUrl(wxuser.getHeadUrl());
			u.setRegistertime(wxuser.getRegistertime());
			u.setSex(wxuser.getSex());
			u.setTelephone(telephone);
			service.addWxToUserService(u);
			wxuser.setTelephone(telephone);
			service.updataWxPhoneService(wxuser);
			Users user1 = service.selectPhoneService(telephone);
			session.setAttribute("u", user1);
			// session.setMaxInactiveInterval(10800);
			// 密码页面
			return "redirect:/views/wxsmpass.jsp";
		}
	}

	/** 绑定密码 */
	@RequestMapping("/updateWxPassWord")
	public String updateWxPassWord(String passWord, HttpSession session) {
		Users user = (Users) session.getAttribute("u");
		String random = Sha256Utile.getSalt();
		System.out.println(random);
		String random1 = random;
		passWord=Sha256Utile.passWord(random, passWord);
		System.out.println(passWord+"密码为");
		user.setPassword(passWord);
		user.setSalt(random);
		service.updatePassWordService(user);
		user = registerService.selectUserService(user.getID());
		// 绑定后跳转OK页面
		return "redirect:/views/wxtelok.jsp";

	}
}
