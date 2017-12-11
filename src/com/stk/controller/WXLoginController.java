package com.stk.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.stk.util.AuthUtil;



@Controller
public class WXLoginController extends HttpServlet{
	@RequestMapping("/wxLogin")
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//https://open.weixin.qq.com/connect/qrconnect?appid=APPID&redirect_uri=REDIRECT_URI&response_type=code&scope=SCOPE&state=STATE#wechat_redirect
		//http://www.shoutike.com?url="192.168.8.42:8080/QQTest/afterlogin.do"
		String backurl="http://www.shoutike.com/wxcallBack";
		String url="https://open.weixin.qq.com/connect/qrconnect?appid="+AuthUtil.APPID
		+"&redirect_uri="+URLEncoder.encode(backurl)
		+"&response_type=code"
		+"&scope=snsapi_login"
		+"&state=STATE#wechat_redirect";

		resp.sendRedirect(url);
	}
	
	
}
