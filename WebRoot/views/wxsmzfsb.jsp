<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>手提课-活到老学到老</title>
<meta http-equiv="content-type" content="text/htm" charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta mame="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="keywords" content="2017考研,四六级考试,思维导图,学前,公务员考试,小学,初中,高中,考研专业课,考研公共课,高考,微商,中考,艺考,托福考试,雅思考试,法语口语" />
<link rel="shortcut icon" href="<%=path%>/img/icon/favicon.ico">
<link rel="Bookmark" href="<%=path%>/img/icon/favicon.ico">
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="<%=path%>/css/public.css" />
<style type="text/css">
	.smzf{
		width: 1120px;
		height: 680px;
		margin: 70px auto;
		background: #fff url(<%=path%>/img/wxzfsb.png) no-repeat center 50px;
		padding-top: 396px;
		border-radius: 5px;
		-webkit-border-radius: 5px;
		box-shadow: 1px 0px 13px rgba(0,0,0,.2);
		-webkit-box-shadow: 1px 0px 13px rgba(0,0,0,.2);
		-moz-box-shadow: 1px 0px 13px rgba(0,0,0,.2);
		-o-box-shadow: 1px 0px 13px rgba(0,0,0,.2);
		margin-bottom: 20px;
	}
	.smzf h5,.smzf h6{
		width: 100%;
		height: 34px;
		text-align: center;
		color: #222868;
		font-size: 22px;
		font-weight: normal;
	}
	
	.smzf .fhsy{
		display: block;
		width: 150px;
		height: 40px;
		margin: 40px auto;
		line-height: 40px;
		text-align: center;
		border: 1px solid #222868;
		color: #222868;
		border-radius: 5px;
		-webkit-border-radius: 5px;
	}
	.smzf .fhsy:hover{
		background: #222868;
		color: #fff;
	}
</style>
</head>
<body>
<div class="wrap">
	<div class="navheader clearfix">
		<div class="header clearfix">
			<!--logo-->
			<div class="logo" style="padding-top: 10px;">
				<a href="<%=path%>/getmenuindex" class="navbar-brand" style="padding-top: 10px;"><img src="<%=path%>/img/icon/logo-xin.png" style="width:120px;height： 30px;" /></a>
			</div>
					<!--登录注册-->
				<div class="nav-login">
					<!--初次加载页面未登录注册状态-->
					<c:if test="${empty u.ID}">
						<div class="dl-init">
							<div class="not-vip">
                                <a href="javscript:;" onclick="vip()" >开通VIP</a>							
							</div>
							<ul class="nav-dlzc">
								<li class="cursor">登录</li>
								<li class="cursor">注册</li>
							</ul>
						</div>
					</c:if>
					<!--已登录注册状态 未成为VIP-->
					<c:if test="${!empty u.ID}">
						<c:if test="${u.vip == 0 }">
							<div class="dlzc-notvip" id="not-vip">
								<div class="nav-vip">
									<!-- <a href="javscript:;" onclick="vip()" >开通VIP</a> -->	
							 <a href="javscript:;"  ></a> 
								</div>
								<div class="nav-img">
									<div class="person-img">
										<a href="views/personal.jsp"><img src="${u.headUrl}" /></a>
									</div>
									<div class="nav-img-con">
										<div class="nav-tx">
											<p>
												<img src="${u.headUrl}" />
											</p>
											<span><em class="ellipsis">${u.nickName}</em></span>
											
										</div>
										<div><span id="p-noplay"></span> </div>
										<div class="nav-kcjl">
											<a class="my-bfjl" href="javascript:;">
												<h5>
													<i></i>
													<span class="ellipsis" id="p-title"></span>
												</h5>
												<p>
													<span class="ellipsis" id="p-stitle"></span>
													<span>继续</span>
												</p>
											</a> <a class="my-sybf" href="views/personal.jsp"> 查看所有播放记录 </a>
										</div>
										<div class="nav-colse">
											<a href="${pageContext.request.contextPath}/loginSession">安全退出</a>
										</div>
									</div>
								</div>
							</div>
						</c:if>
						<!--已登录注册状态 成为VIP-->
						<c:if test="${u.vip == 1 }">
							<div class="dlzc-vip" id="vipok">
								<div class="nav-vip">
									<!-- <a href="javscript:;" onclick="vip()" >开通VIP</a> -->	
							 <a href="javscript:;"  ></a> 
								</div>
								<div class="nav-img">
									<div class="person-img">
										<a href="views/personal.jsp"><img src="${ u.headUrl}" /></a>
									</div>
									<div class="nav-img-con">
										<div class="nav-tx">
											<p>
												<img src="${ u.headUrl}" />
											</p>
											<span><em class="ellipsis">${u.nickName}</em><i></i></span>
											<h6>VIP有效期至：${u.viptime}</h6>
										</div>
										<div><span id="p-noplay"></span> </div>
										<div class="nav-kcjl">
											<a class="my-bfjl" href="javascript:;">
												<h5>
													<i></i>
													<span class="ellipsis" id="p-title"></span>
												</h5>
												<p>
													<span class="ellipsis" id="p-stitle"></span>
													<span>继续</span>
												</p>
											</a> <a class="my-sybf" href="views/personal.jsp"> 查看所有播放记录 </a>
										</div>
										<div class="nav-colse">
											<a href="${pageContext.request.contextPath}/loginSession">安全退出</a>
										</div>
									</div>
								</div>
							</div>
						</c:if>
					</c:if>
				</div>
		</div>
	</div>
	<div class="smzf">
		<h5>由于您未及时支付，</h5>
		<h6>导致订单被取消，请重新提交订单</h6>
		<a class="fhsy" href="<%=path%>/getmenuindex">返回首页</a>
	</div>
	<div class="footer">
		<div class="content">
			<div class="con footer-con" style="width: 1200px;">
				<div class="section">
					<div class="footer_left">
						<a href="<%=path%>/views/about/about.jsp">关于我们</a>
						<a href="<%=path%>/views/about/cooperation.jsp">联系我们</a>
						<a href="<%=path%>/views/about/propaganda.jsp">产品宣传片</a>
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
</body>
</html>
<script type="text/javascript" src="<%=path%>/jscript/jquery-2.0.3.js" ></script>
<script type="text/javascript">
</script>
