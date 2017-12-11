package com.stk.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.qq.connect.QQConnectException;
import com.qq.connect.api.OpenID;
import com.qq.connect.api.qzone.UserInfo;
import com.qq.connect.javabeans.AccessToken;
import com.qq.connect.javabeans.qzone.UserInfoBean;
import com.qq.connect.oauth.Oauth;
import com.stk.entity.Users;
import com.stk.entity.WxUser;
import com.stk.service.LoginService;
import com.stk.util.HttpUtil;


/**qq和微信 */
@Controller

public class QQLoginController {
	@Value("${qqconnectconfig_app_ID}")  
    public  String app_ID; 
    @Value("${qqconnectconfig_app_KEY}")  
    public  String app_KEY; 
    @Value("${qqconnectconfig_redirect_URI}")  
    public  String redirect_URI; 
    @Autowired
	private LoginService loginService;
	
	@RequestMapping(value="/qqlogin",method=RequestMethod.GET)
	public String qqlogin(HttpServletRequest request,HttpServletResponse response)throws Exception{
		//设置响应编码
		response.setContentType("text/html;charset=utf-8");
		//跳转第三方登录页面
		try {
			response.sendRedirect(new Oauth().getAuthorizeURL(request));
			
		} catch (QQConnectException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	//调回函数
	@RequestMapping("/afterlogin")
	public String afterlogin(HttpServletRequest request,HttpServletResponse response,HttpSession session)throws Exception{
        String code=request.getParameter("code");
        System.out.println("code为+"+code);
        String url = "https://graph.qq.com/oauth2.0/token?grant_type=authorization_code&client_id=" + app_ID
				+"&client_secret=" + app_KEY + "&code=" + code + "&redirect_uri=" + redirect_URI;
		String context = HttpUtil.getOrPost(url, "get", null);
		
		try {
            AccessToken accessTokenObj = (new Oauth()).getAccessTokenByRequest(request);
            String accessToken   = null,
                   openID        = null;
            long tokenExpireIn = 0L;
            if (accessTokenObj.getAccessToken().equals("")) {
                System.out.print("没有获取到响应参数");
                
                return "redirect:/getmenuindex";
            }else{
                accessToken = accessTokenObj.getAccessToken();
                session.setAttribute("accessToken", accessToken);
                tokenExpireIn = accessTokenObj.getExpireIn();
                OpenID openIDObj =  new OpenID(accessToken);
                openID = openIDObj.getUserOpenID();
                session.setAttribute("openID", openID);
                UserInfo qzoneUserInfo = new UserInfo(accessToken, openID);
                UserInfoBean userInfoBean = qzoneUserInfo.getUserInfo();
                String name = userInfoBean.getNickname();
                String sex=userInfoBean.getGender();//性别
                String headUrl=userInfoBean.getAvatar().getAvatarURL50();
                String qqid=openID;
                System.out.println("用户：+"+userInfoBean);
                System.out.println("openid+"+openID);
                System.out.println("qqid+"+qqid);
                //通过qqid查询到微信表中的用户
                WxUser qquser=loginService.selectQQService(qqid);
                session.setAttribute("wxuser", qquser);
                if(qquser==null){
                	//用户不存在  在微信表中保存用户  跳转绑定手机号
                	System.out.println("用户不存在  在微信表中保存用户  跳转绑定手机号");
                	WxUser user1=new WxUser();
                	System.out.println(name);
                	user1.setNickName(name);
                	user1.setSex(sex);
                	user1.setHeadUrl(headUrl);
                	user1.setQqid(qqid);
                	user1.setRegistertime(new Date());
                	loginService.addUsersQQService(user1);
                	WxUser user2=loginService.selectQQService(qqid);
                	session.setAttribute("wxuser", user2);
    				//session.setMaxInactiveInterval(10800);
    				System.out.println("我要跳转手机页面喽");
    				return "redirect:/views/wxsmdl.jsp";
                }else{
                	//已存在微信表中    来判断是否绑定手机号
                	System.out.println("我要看看手机号是否为空");
                	if(qquser.getTelephone()!=null){
                		System.out.println("我得手机号不为空哦");
                		Users user=loginService.selectQqidToUserService(qquser.getID());
                		if(user.getPassword()==null){
                			System.out.println("我得密码为空哦");
                			return "redirect:/views/wxsmpass.jsp";
                		}else{
                			session.setAttribute("u", user);
                		
                			System.out.println("我都齐全 。。 跳主页喽");
                			return "redirect:/getmenuindex";
                		}
                	}else{
                			System.out.println("我手机为空哦   要跳转到绑定手机号页面");
                			return "redirect:/views/wxsmdl.jsp";
                	}
                	
                }
                
            }

        }catch(Exception e){
            e.printStackTrace();
        }
		
        return "redirect:/getmenuindex";
	}
	 
}
