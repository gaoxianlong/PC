<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<title>手提课-活到老学到老</title>
<meta http-equiv="content-type" content="text/htm" charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta mame="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="keywords" content="2017考研,四六级考试,思维导图,学前,公务员考试,小学,初中,高中,考研专业课,考研公共课,高考,微商,中考,艺考,托福考试,雅思考试,法语口语" />
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="<%=path%>/css/public.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/css/wxsmdl.css"/>
</head>
<body>
<div class="wrap">
	<div class="wxdlcall">
		<div class="wxdl_title">
			<div class="title_top"><i></i><span>验证成功！</span></div>
			<h5 class="title_text">尊敬的用户，请绑定您的手机号</h5>
		</div>
		<div class="wxdl_con">
			<div class="floatleft">
				<div class="left_title"><i></i><span>微信登录</span></div>
				<div class="wximg">
					<div class="imgicon">
						<img src="${wxuser.headUrl}"/>
					</div>
					<p class="wxnkname">${wxuser.nickName}</p>
				</div>
			</div>
			<div class="floatright">
				<h6><i></i><span>手提课账号</span></h6>
				<div class="form">
					<form action="<%=path%>/addWxUserPhone" method="post" id="wxtel-form">
						<div class="wxtel">
							<input type="" name="telephone" id="myUserName" value="" class="tel" placeholder="手机号" />
						    <p class="error1"></p>
						</div>
						<div class="wxyzm">
							<input type="" name="vcode" id="CheckCode" value="" class="numyzm" placeholder="验证码" onblur="vcodeCheck();"/>
							<a href="javascript:;" class="yzmbtn" id="getKey">发送验证码</a>
							<p class="error2"></p>
						</div>
						
						<input type="submit" value="同意协议并绑定" class="tel_submit" id="" />
						<p class="wxxy">我已阅读并接受《手提课协议条款》</p>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
<script type="text/javascript" src="<%=path%>/jscript/jquery-2.0.3.js" ></script>
<script type="text/javascript" src="<%=path%>/js/wxsmdl.js"></script>
