<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
  </head>
  
  <body>
  	<!--footer-->
		<div class="footer">
		<div class="content" style="background: #fff;padding-top: 18px;box-shadow: rgba(0, 0, 0, 0.1) 0px 3px 40px;-webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 3px 40px;"">
			<div class="con footer-con">
				<div class="section">
					<div class="footer_left">
						<a href="<%=path%>/views/about/about.jsp" target="_blank">关于我们</a>
						<a href="<%=path%>/views/about/cooperation.jsp" target="_blank">联系我们</a>
						<a href="<%=path%>/views/about/propaganda.jsp" target="_blank">产品宣传片</a>
						<!--<a href="javascript:;">加入我们</a>
						<a href="javascript:;">常见问题</a>
						<a href="javascript:;">意见反馈</a> -->
					</div>
					<div class="footer_right">
						<!--<a href="javascript:;">sub</a>
						<a href="javascript:;">sub</a>-->	
					</div>
				</div>
				<div class="section">
					<a href="http://www.miitbeian.gov.cn">
					    <p class="copy">&copy; shoutike.com 京ICP备16043579号-1</p>
					</a>
				</div>
			</div>
		</div>
	</div>
		
<!--登录注册页面-->
<div class="login">
	<div class="login-header">
		<div class="login-tab">
			<span class="active-title">登录</span>
			<span>注册</span>
		</div>
		<button class="btn-close"></button>
	</div>
	<!--登录-->
	<div class="login-con logreg-active">
		<form action="" >
			<div class="call">
				<input type="text" placeholder="请输入登录手机号" class="username" id="UserName" name="telephone"/>
				<p></p>
			</div>
			<div class="pass">
				<input type="password" placeholder="8-16位字母和数字，区分大小写，不能用空格" class="password" id="login-pass" name="password" />
				<p id="passid"></p>
			</div>
			<div class="stk-tk">
				
				<span><input type="hidden" checked="checked" name="" id="RememberMe" data-check="false" value="" /></span>
							<span></span>
				<span class="cursor login-forget" style="float: right;">忘记密码</span>
		
			</div>
			<input type="button" value="登录" class="login-btn" style="background: #d21213;color: #fff;" />
			</form>
		<div class="qt-login">
		
			<h6>其他方式登录：
				<span>
					<a href="wxLogin" connect="wechat" config=" 'cp': 0, 'cpp': 0, 'width': 400, 'height': 570, 'title': '微信' " title="用微信扫码登录" charset="hz-4009931-1000494"><img src="${pageContext.request.contextPath}/img/wx.png" /></a>
				</span>
				
			 	<span>
					<a href="qqlogin" connect="qzone" config=" 'cp': 1000208, 'cpp': 4001521, 'width': 710, 'height': 400, 'title': '腾讯QQ' " title="用QQ账号登录" charset="hz-4003757-1000494" target="_blank"><img src="${pageContext.request.contextPath}/img/qq.png" /></a>
				</span>
			<!--	<span>
					<a href="http://www.shoutike.com/account/wblogin" connect="weibo" config=" 'cp': 1000208, 'cpp': 4002404, 'width': 950, 'height': 700, 'title': '微博' " title="用新浪微博账号登录" charset="hz-4003755-1000494">微博</a>
				</span> -->
			</h6>
		</div>
	</div>
	<!--注册-->
	<div class="login-con">
		<form action="" method="post" id="reg-form">
			<div class="call">
				<input type="text" placeholder="请输入注册手机号" class="username" id="myUserName" />
				<p id="phoneSpan"></p>
			</div>
			<div class="xym">
				<input type="text" id="code" class="" placeholder="请输入右边的校验码"  />
				<span id="codeSpan" onclick="createCode($('#codeSpan'));"></span>
				<span id="cSpan"></span>
			</div>
			<div class="yzm">
				<input type="text" placeholder="请输入短信验证码" disabled="disabled" id="CheckCode" onblur="checkrandomSpan();" />
				<a href="javascript:;" class="yzm-btn" id="getKey" style="background: #d21213;corlor: #fff;">获取验证码</a>
				<span id="randomSpan" style="float: left;"></span>
			</div>
			<div class="pass">
				<input type="password" placeholder="设置8-16位字母和数字，区分大小写" class="password" id="zc-pass"  />
				<p></p>
			</div>
			<div class="stk-tk">
				<span><input type="checkbox" checked="checked" name="" id="agree-check" data-check="true"/></span>
				<span>我已阅读并接受《手提课协议条款》</span>
			</div>
			<input type="submit" value="注册" id="zc-btn" style="background: #d21213;corlor: #fff;" />
		</form>
		<div class="qt-login">
		</div>
	</div>
</div>
<!--完善资料-->
<div class="register-next">
	<div class="reg-head">注册成功！请完善资料！</div>
	<div class="reg-con">
		<form action="update.action" method="post">
			<div class="nickname">
				<input type="text" placeholder="昵称" id="nickName" name="nickName"/>
				<p></p>
			</div>
			<div class="name">
				<input type="text" placeholder="真实姓名" id="realName" name="realName"/>
				<p></p>
			</div>
			<div class="sex-bir">
				<div class="sex">
					<select name="sex" placeholder="性别" id="sex">
						<option value="性别">性别</option>
						<option value="男">男</option>
						<option value="女">女</option>
					</select>
				</div>
				<div class="birthday">
					<input type="text" class="date" readonly="readonly" placeholder="请输入出生年月日" id="birthday" name="birthday" />
				</div>
			</div>
			<div class="seat">
				<div class="info">
					<div>
						<select id="s_province" name="city1"></select> 
						<select id="s_city" name="city2" ></select>
						<select id="s_county" name="city3"></select>
						<script class="resources library" src="jscript/area.js" type="text/javascript"></script>
						<script type="text/javascript">
						     var opt0 = ["省份","地级市","市、县级市"];//初始值
						      _init_area();
						</script>
					</div>
				</div>
			</div>
			<div class="grade">
				<select name="education" id="education">
					<option>教育阶段</option>
					<option value="小学">小学</option>
					<option value="初中">初中</option>
					<option value="高中">高中</option>
				</select>
				<select name="grade" id="grade">
					<option>年级</option>
					<option value="一年级">一年级</option>
					<option value="二年级">二年级</option>
					<option value="三年级">三年级</option>
					<option value="四年级">四年级</option>
					<option value="五年级">五年级</option>
					<option value="六年级">六年级</option>
					<option value="初一">初一</option>
					<option value="初二">初二</option>
					<option value="初三">初三</option>
					<option value="高一">高一</option>
					<option value="高二">高二</option>
					<option value="高三">高三</option>
				</select>
				<input type="text" placeholder="所在学校" id="school" name="school"/>
			</div>
			<div class="teacher">
				<input type="text" name="teacher" id="teacher"  placeholder="班主任" />
			</div>
			<div class="fpyhm">
				<input type="text" name="HelpCode" id="preferential"  placeholder="免费学习验证码(输入验证码免费学习课程)" />
				<p ></p >
			</div>
			<div class="tjzl">
				<input type="submit" value="提交资料" id="tjzl" />
			    <a href="getmenuindex.action"><span>跳过</span></a>
			</div>
			<b></b>
		</form>
	</div>
</div>
<!--忘记密码-->
<div class="forgetpass">
	<div class="forget-head">
		<h4>找回密码</h4>
		<button class="btn-close"></button>
	</div>
	<div class="forget-con">
		<form action="" method="post" id="forget-form">
			<div class="call">
				<input type="text" placeholder="请输入注册手机号" class="username" id="forget-call" onblur="selectphonefor();" name="telephone" />
				<p></p >
			</div>
			<div class="xym">
				<input type="text" id="forget-code" class="" placeholder="请输入右边的校验码" onblur="checkCode($('#forget-codeSpan'));" name="password"/>
				<span id="forget-codeSpan" onclick="createCode($('#forget-codeSpan'));"></span>
				<span id="forget-cSpan"></span>
			</div>
			<div class="yzm">
				<input type="text" placeholder="请输入短信验证码" disabled="disabled" id="forget-CheckCode" onoff="flase"/>
				<a href="javascript:;" class="yzm-btn" id="forget-getKey">获取验证码</a>
				<span id="forget-randomSpan"></span>
			</div>
			<div class="pass">
				<input type="password" placeholder="设置8-16位密码，区分大小写，不能用空格" class="password" id="forget-pass" />
				<p></p >
			</div>
			<input type="submit" value="找 回 密 码" id="forget-btn" style="background: #d21213;color: #fff;"/>
		</form>
	</div>
</div>
<div class="login-mask"></div>
</body>
</html>