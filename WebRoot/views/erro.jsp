<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta http-equiv="content-type" content="text/htm" charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta mame="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="keywords" content="shoutike" />
<meta name="description" content="shoutike" />
<link rel="stylesheet" type="text/css" href="../content/bootstrap.min.css" />
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="../css/public.css" />

<style>
	html,body{
		width: 100%;
		height: 100%;
		
	}
	.wrap{
		width: 100%;
		height: 100%;
		margin-top: -80px;
	}
	.wrapper{
		width: 100%;
		height: 100%;
		background: #fff url(../img/icon/erro.jpg) no-repeat center 110px;
	}
	.erro{
		width: 203px;
		height: 56px;
		background: url(../img/icon/errobg.png) no-repeat;
		position: fixed;
		left: 50%;
		top: 50%;
		margin-left: -101px;
		margin-top: 135px;
	}
	.erro a{
		display: block;
		left: 100%;
		height: 100%;
	}
	.erro:hover{
		background-position: 0 -56px;
	}
</style>
</head>
<body>
<div class="wrap">
	<!--顶部-->
	<div class="navheader clearfix">
		<div class="header clearfix">
			<!--logo-->
			<div class="logo" style="left: -50px;">
				<a href="javascript:;" class="navbar-brand"><img src="../img/icon/logo-xin.png" style="width:120px;height： 50px;margin-top: -15px;" /></a>
			</div>
			<div class="stk-menu">
				<div class="head-menu">
					<a href="../index.html">首页</a>
				</div>
				<div id="mymenu">
					<a href="javascript:;" id="menu-kc">课程 <span class="glyphicon glyphicon-menu-down" style="font-size: 12px;"></span></a>
				    <!--菜单栏-->
					<div class="topmenu">
						<div class="allmenu">
							<ul>
								<li class="menunav">
									<h5>
										<a href="subpage.html" target="_blank"><span class="glyphicon glyphicon-user"></span > 学前</a>
									</h5>
									<div class="listmenu">
										<dl>
											<dt><a href="views/subpage.html" target="_blank">国学</a></dt>
											<dd>
												<em><a href="javascript:;">课程课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
											</dd>
										</dl>
										<dl>
											<dt><a href="javascript:;">英语</a></dt>
											<dd>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础基础</a></em>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础</a></em>
											</dd>
										</dl>
										<dl>
											<dt><a href="javascript:;">绘画</a></dt>
											<dd>
												<em><a href="javascript:;">素描</a></em>
												<em><a href="javascript:;">素描</a></em>
												<em><a href="javascript:;">素描</a></em>
												<em><a href="javascript:;">人物</a></em>
												<em><a href="javascript:;">素描</a></em>
												<em><a href="javascript:;">素描素描</a></em>
												<em><a href="javascript:;">素描</a></em>
												<em><a href="javascript:;">素描素描</a></em>
											</dd>
										</dl>
										<dl>
											<dt><a href="javascript:;">儿歌</a></dt>
											<dd>
												<em><a href="javascript:;">三百首</a></em>
												<em><a href="javascript:;">唐诗</a></em>
												<em><a href="javascript:;">七律</a></em>
												<em><a href="javascript:;">绝句</a></em>
												<em><a href="javascript:;">儿歌</a></em>
												<em><a href="javascript:;">儿歌</a></em>
											</dd>
										</dl>
										
									</div>
								</li>
								<li class="menunav">
									<h5>
										<a href="subpage.html" target="_blank"><span class="glyphicon glyphicon-tower"></span> 小学</a>
									</h5>
									<div class="listmenu">
										<dl>
											<dt><a href="javascript:;">语文</a></dt>
											<dd>
												<em><a href="javascript:;">课程课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
											</dd>
										</dl>
										<dl>
											<dt><a href="javascript:;">英语</a></dt>
											<dd>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础基础</a></em>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础</a></em>
											</dd>
										</dl>
										<dl>
											<dt><a href="javascript:;">数学</a></dt>
											<dd>
												<em><a href="javascript:;">课程课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
											</dd>
										</dl>
									</div>
								</li>
								<li class="menunav">
									<h5>
										<a href="views/subpage.html" target="_blank"><span class="glyphicon glyphicon-baby-formula"></span> 初中</a>
									</h5>
									<div class="listmenu">
										<dl>
											<dt><a href="javascript:;">初一</a></dt>
											<dd>
												<em><a href="javascript:;">课程课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
											</dd>
										</dl>
										<dl>
											<dt><a href="javascript:;">初二</a></dt>
											<dd>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础基础</a></em>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础</a></em>
											</dd>
										</dl>
									</div>
								</li>
								<li class="menunav">
									<h5>
										<a href="views/subpage.html"><span class="glyphicon glyphicon-erase"></span> 高中</a>
									</h5>
									<div class="listmenu">
										<dl>
											<dt><a href="javascript:;">高一</a></dt>
											<dd>
												<em><a href="javascript:;">课程课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
											</dd>
										</dl>
										<dl>
											<dt><a href="javascript:;">高二</a></dt>
											<dd>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础基础</a></em>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础</a></em>
											</dd>
										</dl>
										<dl>
											<dt><a href="javascript:;">高考</a></dt>
											<dd>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础基础</a></em>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础</a></em>
												
											</dd>
										</dl>
									</div>
								</li>
								<li class="menunav">
									<h5>
										<a href="views/subpage.html"><span class="glyphicon glyphicon-education"></span> 考研</a>
									</h5>
									<div class="listmenu">
										<dl>
											<dt><a href="javascript:;">公共课</a></dt>
											<dd>
												<em><a href="javascript:;">课程课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
											</dd>
										</dl>
										<dl>
											<dt><a href="javascript:;">基础课</a></dt>
											<dd>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础基础</a></em>
												<em><a href="javascript:;">基础</a></em>
												
											</dd>
										</dl>
									</div>
								</li>
								<li class="menunav">
									<h5>
										<a href="views/subpage.html"><span class="glyphicon glyphicon-bishop"></span> 多语种</a>
									</h5>
									<div class="listmenu">
										<dl>
											<dt><a href="javascript:;">法语</a></dt>
											<dd>
												<em><a href="javascript:;">课程课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												
											</dd>
										</dl>
										<dl>
											<dt><a href="javascript:;">韩语</a></dt>
											<dd>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础基础</a></em>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础</a></em>
											</dd>
										</dl>
									</div>
								</li>
							</ul>
						</div>
					</div>
			    </div>
			</div>
			<!--搜索-->
			<!--<form action="" class="navbar-form navbar-left" id="my-form">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="search" style="width: 320px;" />
				    <span class="input-group-addon"><a href="javascript:;"><span class="glyphicon glyphicon-search"></span></a></span>
				</div>
			</form>-->
			<!--登录注册-->
			<ul class="nav-login">
				<!--<li><a href="shopping.html" target="_blank"><span class="glyphicon glyphicon-shopping-cart"></span> 购物车</a></li>-->
				<li></li>
				<li class="nav-dlzc"><a href="javascript:;">登录</a></li>
				<li class="nav-dlzc"><a href="javascript:;">注册</a></li>
			</ul>
		</div>
	</div>
    <!--内容-->
    <div class="wrapper">
    	<div class="erro">
    		<a href="../index.html"></a>
    	</div>
    </div>
    <!--底部-->
    <div class="footer">
		<div class="content">
			<div class="con footer-con" style="width: 1120px;padding: 0;">
				<div class="section">
					<div class="footer_left">
						<a href="about/about.html" target="_blank">关于我们</a>
						<a href="about/cooperation.html" target="_blank">媒体报道</a>
						<a href="about/cooperation.html" target="_blank">商务合作</a>
						<a href="javascript:;">加入我们</a>
						<a href="javascript:;">常见问题</a>
						<a href="javascript:;">意见反馈</a>
					</div>
					<div class="footer_right">
						<a href="javascript:;">sub</a>
						<a href="javascript:;">sub</a>
						
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
</div>
<!--登录注册页面-->
<div class="login">
	<div class="login-header">
		<div class="login-tab">
			<span class="active-title">登录</span>
			<span>注册</span>
		</div>
		<span class="btn-close">x</span>
	</div>
	<!--登录-->
	<div class="login-con logreg-active">
		<form action="" method="post" id="login-form">
			<div class="call">
				<input type="text" placeholder="请输入登录手机号" class="username" id="UserName" />
				<p></p>
			</div>
			<div class="pass">
				<input type="password" placeholder="6-16位密码，区分大小写，不能用空格" class="password" id="login-pass" />
				<p></p>
			</div>
			<div class="forget"><span class="cursor login-forget">忘记密码</span></div>
			<input type="submit" value="登录" class="login-btn" />
		</form>
		<div class="qt-login">
			<h6>其他方式登录：
				<span>
					<a href="http://www.shoutike.com/account/wxlogin" connect="wechat" config=" 'cp': 0, 'cpp': 0, 'width': 400, 'height': 570, 'title': '微信' " title="用微信扫码登录" charset="hz-4009931-1000494">微信</a>
				</span>
				<span>
					<a href="http://www.shoutike.com/account/qqlogin" connect="qzone" config=" 'cp': 1000208, 'cpp': 4001521, 'width': 710, 'height': 400, 'title': '腾讯QQ' " title="用QQ账号登录" charset="hz-4003757-1000494">QQ</a>
				</span>
				<span>
					<a href="http://www.shoutike.com/account/wblogin" connect="weibo" config=" 'cp': 1000208, 'cpp': 4002404, 'width': 950, 'height': 700, 'title': '微博' " title="用新浪微博账号登录" charset="hz-4003755-1000494">微博</a>
				</span>
			</h6>
		</div>
	</div>
	<!--注册-->
	<div class="login-con">
		<form action="" method="post" id="reg-form">
			<div class="call">
				<input type="text" placeholder="请输入注册手机号" class="username" id="myUserName" />
				<p></p>
			</div>
			<div class="xym">
				<input type="text" id="code" class="" placeholder="请输入右边的校验码" onblur="checkCode($('#codeSpan'));" />
				<span id="codeSpan" onclick="createCode($('#codeSpan'));"></span>
				<span id="cSpan"></span>
			</div>
			<div class="yzm">
				<input type="text" placeholder="请输入短信验证码" disabled="disabled" id="CheckCode" name="" />
				<a href="javascript:;" class="yzm-btn" id="getKey">获取验证码</a>
				<span id="randomSpan"></span>
			</div>
			<div class="pass">
				<input type="password" placeholder="设置6-16位密码，区分大小写，不能用空格" class="password" id="zc-pass" />
				<p></p>
			</div>
			<div class="stk-tk">
				<span><input type="checkbox" checked="checked" name="" id="agree-check" data-check="true" value="" /></span>
				<span>我已阅读并接受《手提课协议条款》</span>
			</div>
			<input type="submit" value="注册" id="zc-btn" />
		</form>
		<div class="qt-login">
			<h6>其他方式登录：
				<span>
					<a href="http://www.shoutike.com/account/wxlogin" connect="wechat" config=" 'cp': 0, 'cpp': 0, 'width': 400, 'height': 570, 'title': '微信' " title="用微信扫码登录" charset="hz-4009931-1000494">微信</a>
				</span>
				<span>
					<a href="http://www.shoutike.com/account/qqlogin" connect="qzone" config=" 'cp': 1000208, 'cpp': 4001521, 'width': 710, 'height': 400, 'title': '腾讯QQ' " title="用QQ账号登录" charset="hz-4003757-1000494">QQ</a>
				</span>
				<span>
					<a href="http://www.shoutike.com/account/wblogin" connect="weibo" config=" 'cp': 1000208, 'cpp': 4002404, 'width': 950, 'height': 700, 'title': '微博' " title="用新浪微博账号登录" charset="hz-4003755-1000494">微博</a>
				</span>
			</h6>
		</div>
	</div>
</div>
<!--完善资料-->
<div class="register-next">
	<div class="reg-head">注册成功！请完善资料！</div>
	<div class="reg-con">
		<form action="">
			<div class="nickname">
				<input type="text" placeholder="昵称" />
				<p></p>
			</div>
			<div class="name">
				<input type="text" placeholder="真实姓名" />
				<p></p>
			</div>
			<div class="sex-bir">
				<div class="sex">
					<select name="性别" placeholder="性别">
						<option value="性别">性别</option>
						<option value="男">男</option>
						<option value="女">女</option>
					</select>
				</div>
				<div class="birthday">
					<input type="text" class="date" readonly="readonly" placeholder="请输入出生年月日" />
				</div>
			</div>
			<div class="seat">
				<div class="info">
					<div>
						<select id="s_province" name="s_province"></select> 
						<select id="s_city" name="s_city" ></select>
						<select id="s_county" name="s_county"></select>
						<script class="resources library" src="../jscript/area.js" type="text/javascript"></script>
						<script type="text/javascript">_init_area();</script>
					</div>
				    <div id="show"></div>
				
				</div>
			</div>
			<div class="grade">
				<select name="" id="">
					<option>教育阶段</option>
					<option>小学</option>
					<option>初中</option>
					<option>高中</option>
				</select>
				<select name="" id="">
					<option>年级</option>
					<option>一年级</option>
					<option>二年级</option>
					<option>三年级</option>
					<option>四年级</option>
					<option>五年级</option>
					<option>六年级</option>
					<option>初一</option>
					<option>初二</option>
					<option>初三</option>
					<option>高一</option>
					<option>高二</option>
					<option>高三</option>
				</select>
				<input type="text" placeholder="所在学校"/>
			</div>
			<div class="teacher">
				<input type="text" name="" id="" value="" placeholder="班主任" />
			</div>
			<div class="fpyhm">
				<input type="text" name="" id="fpyhm" value="" placeholder="免费学习验证码(输入验证码免费学习课程)" />
				<p style="color: red;"></p>
			</div>
			<div class="tjzl">
				<input type="submit" value="提交资料" id="tjzl" />
			    <span class="cursor">跳过</span>
			</div>
			<b>完善资料即可获赠10元奖学金，奖学金可用来购买课程</b>
		</form>
	</div>
</div>
<!--忘记密码-->
<div class="forgetpass">
	<div class="forget-head">
		<h4>找回密码</h4>
		<span class="btn-close">x</span>
	</div>
	<div class="forget-con">
		<form action="" method="post" id="forget-form">
			<div class="call">
				<input type="text" placeholder="请输入注册手机号" class="username" id="forget-call" />
				<p></p>
			</div>
			<div class="xym">
				<input type="text" id="forget-code" class="" placeholder="请输入右边的校验码" onblur="checkCode($('#forget-codeSpan'));" />
				<span id="forget-codeSpan" onclick="createCode($('#forget-codeSpan'));"></span>
				<span id="forget-cSpan"></span>
			</div>
			<div class="yzm">
				<input type="text" placeholder="请输入短信验证码" disabled="disabled" id="forget-CheckCode" name="" />
				<a href="javascript:;" class="yzm-btn" id="forget-getKey">获取验证码</a>
				<span id="forget-randomSpan"></span>
			</div>
			<div class="pass">
				<input type="password" placeholder="设置8-16位密码，区分大小写，不能用空格" class="password" id="forget-pass" />
				<p></p>
			</div>
			<input type="submit" value="找 回 密 码" id="forget-btn" />
		</form>
	</div>
</div>
<div class="login-mask"></div>
</body>
</html>
<script type="text/javascript" src="../jscript/jquery-2.0.3.js"></script>
<script type="text/javascript" src="../jscript/moment.min.js"></script>
<script type="text/javascript" src="../jscript/moment.zh-cn.js"></script>
<script type="text/javascript" src="../jscript/ion.calendar.min.js"></script>
<script type="text/javascript" src="../jscript/area.js"></script>
<!--菜单效果代码-->
<script type="text/javascript" src="../js/public.js"></script>
<!--登录注册找回密码补充资料-->
<script type="text/javascript" src="../js/login-public.js"></script>
<!--课程内容移入移出代码-->
<script type="text/javascript" src="../js/kc_public.js"></script>