package com.stk.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.stk.entity.Users;
import com.stk.entity.WxUser;
import com.stk.service.LoginService;
import com.stk.util.AuthUtil;

import net.sf.json.JSONObject;

@Controller
public class WXCallBackService extends HttpServlet {
	@Autowired
	private LoginService loginService;
	@Autowired
	private HttpSession session;

	@RequestMapping("/wxcallBack")
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String code = req.getParameter("code");
		System.out.println(code + "////////////");
		String url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid="
				+ AuthUtil.APPID + "&secret=" + AuthUtil.APPSECRET + "&code="
				+ code + "&grant_type=authorization_code";
		JSONObject jsonObject = AuthUtil.doGetJson(url);
		System.out.println("返回值为+" + jsonObject);
		String openid = jsonObject.getString("openid");
		String token = jsonObject.getString("access_token");
		String info = "https://api.weixin.qq.com/sns/userinfo?access_token="
				+ token + "&openid=" + openid + "&lang=zh_CN";
		JSONObject userInfo = AuthUtil.doGetJson(info);
		System.out.println(userInfo);
		// 对用户进行判断
		String unionid = userInfo.getString("unionid");
		// 微信表中的数据信息
		WxUser wxuser = loginService.selectUnionIDService(unionid);
		session.setAttribute("wxuser", wxuser);
		System.out.println(wxuser + "微信用户信息");
		if (wxuser != null) {
			// 判断手机号有没有有的话直接查询
			System.out.println("微信用户不为空   去判断手机号");
			if (wxuser.getTelephone() != null) {
				System.out.println("手机号不为空哦    去判断用户的密码");
				Users user = loginService.selectWxIDService(wxuser.getID());
				session.setAttribute("u", user);
				if (user.getPassword() == null) {
					// 密码页面
					System.out.println("哦买嘎   用户密码为空  跳转设置密码页面");
					req.getRequestDispatcher("views/wxsmpass.jsp").forward(req,
							resp);
				} else {
					System.out.println("全部都有   跳转主页");

					session.setAttribute("u", user);
					// session.setMaxInactiveInterval(43200);
					resp.sendRedirect("getmenuindex");
				}
			} else {
				// 跳转到绑定手机页面
				System.out.println("我没有手机号啊  ");
				req.getRequestDispatcher("views/wxsmdl.jsp").forward(req, resp);
			}
		} else {
			String nickname = userInfo.getString("nickname");
			Integer sex = userInfo.getInt("sex");
			String HeadUrl = userInfo.getString("headimgurl");
			String City1 = userInfo.getString("city");
			String City2 = userInfo.getString("country");
			WxUser user = new WxUser();
			user.setNickName(nickname);
			user.setCity1(City1);
			user.setCity2(City2);
			user.setHeadUrl(HeadUrl);
			user.setUnionid(unionid);
			user.setOpenid(openid);
			user.setRegistertime(new Date());
			user.setSex(sex == 1 ? "男" : "女");
			loginService.addUsersWXService(user);
			wxuser = loginService.selectUnionIDService(unionid);
			session.setAttribute("wxuser", wxuser);
			System.out.println("我是第一次登录    跳转手机页面");
			// 用户第一次登录 跳转到绑定手机页面
			req.getRequestDispatcher("views/wxsmdl.jsp").forward(req, resp);
		}
		// req.getRequestDispatcher("getmenuindex").forward(req,resp);

	}
}
