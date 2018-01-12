<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
<meta http-equiv="content-type" content="text/html" charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta mame="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="keywords" content="2017考研,四六级考试,思维导图,学前,公务员考试,小学,初中,高中,考研专业课,考研公共课,高考,微商,中考,艺考,托福考试,雅思考试,法语口语" />
<meta name="description" content="手提课，是全球第一家提出“互联网+教育扶智”的综合性微课教育平台，也是翻转课堂的倡导者和践行者。手提课为学前、小学、初中、高中等人群提供包括语文、数学、英语等精品微课服务。微课简短精炼，生动有趣，满足课前预习，课后复习的学习需求。公众号“手提课K12”" />
<link rel="shortcut icon" href="<%=path%>/img/icon/favicon.ico">
<link rel="Bookmark" href="<%=path%>/img/icon/favicon.ico">
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="<%=path%>/css/public.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/css/member.css"/>
</head>
<body>
<div class="wrap">
	<!--顶部-->
	<div class="navheader clearfix">
		<div class="header clearfix">
			<!--logo-->
			<div class="logo" style="padding-top: 10px;">
				<a href="<%=path%>/getmenuindex" class="navbar-brand" style="padding-top: 10px;"><img src="<%=path%>/img/icon/logo-xin.png" style="width:120px;height： 30px;" /></a>
			</div>
			<!--<div class="stk-menu" style="width: 400px;">
				<div class="head-menu" style="width: 100%;color: #fff;">
					<span>考研数学预测与冲刺</span>
					<span>1,高等数学之微积分学</span>
				</div>
			</div>-->
						<!--登录注册-->
				<div class="nav-login">
					<!--初次加载页面未登录注册状态-->
					<c:if test="${empty u.ID}">
						<div class="dl-init">
							<div class="not-vip">
								<!-- <a href="javscript:;" onclick="vip()" >开通VIP</a> -->	
							 <a href="javscript:;"  ></a> 
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
										<c:if test="${fn:containsIgnoreCase(u.headUrl, 'http')}">
										<a href="javscript:;"><img src="${u.headUrl}"/></a>
			 						  </c:if>
			  			              <c:if test="${fn:containsIgnoreCase(u.headUrl, 'userhadle')}">
										<a href="javscript:;"><img src="../${u.headUrl}"/></a>
			                          </c:if>
									</div>
									<div class="nav-img-con">
										<div class="nav-tx">
											<p>
												<c:if test="${fn:containsIgnoreCase(u.headUrl, 'http')}">
											<img src="${u.headUrl}" />
			 						  	</c:if>
			  			              	<c:if test="${fn:containsIgnoreCase(u.headUrl, 'userhadle')}">
										 	<img src="../${u.headUrl}" />
			                          	</c:if>
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
									<a href="javascript:;">我的VIP</a>
								</div>
								<div class="nav-img">
									<div class="person-img">
										<c:if test="${fn:containsIgnoreCase(u.headUrl, 'http')}">
										<a href="javscript:;"><img src="${u.headUrl}"/></a>
			 						  </c:if>
			  			              <c:if test="${fn:containsIgnoreCase(u.headUrl, 'userhadle')}">
										<a href="javscript:;"><img src="../${u.headUrl}"/></a>
			                          </c:if>
									</div>
									<div class="nav-img-con">
										<div class="nav-tx">
											<p>
												<c:if test="${fn:containsIgnoreCase(u.headUrl, 'http')}">
											<img src="${u.headUrl}" />
			 						  	</c:if>
			  			              	<c:if test="${fn:containsIgnoreCase(u.headUrl, 'userhadle')}">
										 	<img src="../${u.headUrl}" />
			                          	</c:if>
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
	<div class="wrapper">
		<div class="vipcon">
			<div class="viptop">
				<div class="vipimg">
					<img src="<%=path%>/img/icon/vip_logo.png"/>
				</div>
				<div class="vipxq">
					<h3>手提课VIP会员</h3>
					<h6>小学板块海量同步精讲课程畅快学，更有兴趣类课外知识课程、素质类课程等你哦~</h6>
					<h5>选择时长</h5>
					<ul class="viptime">
						<li class="list vip_active">
							<strong>1个月VIP</strong>
						    <p><em>99</em>元</p>
						    <input type="hidden" value="1"/>
						</li>
						<li class="list">
							<strong>3个月VIP</strong>
						    <p><em>199</em>元</p>
						    <input type="hidden" value="2"/>
						</li>
						<li class="list">
							<strong>6个月VIP</strong>
						    <p><em>299</em>元</p>
						    <span>*赠送诗词课程和记忆课程</span>
						    <input type="hidden" value="3"/>
						</li>
					</ul>
					<div class="vipbtn">立即加入</div>
				</div>
			</div>
			<div class="vipicon">
				<h4>VIP特权</h4>
				<div class="vip_content">
					<dl>
						<dt></dt>
						<dd>课外知识</dd>
					</dl>
					<dl>
						<dt></dt>
						<dd>英语数学同步精讲</dd>
					</dl>
					<dl>
						<dt></dt>
						<dd>素质课程</dd>
					</dl>
				</div>
			</div>
		</div>
	</div>
    <!--底部-->
    <div class="footer">
		<div class="content">
			<div class="con footer-con" style="width: 1120px;padding: 0;">
				<div class="section">
					<div class="footer_left">
						<a href="<%=path%>/views/about/about.jsp">关于我们</a>
						<a href="<%=path%>/views/about/cooperation.jsp">联系我们</a>
						<a href="<%=path%>/views/about/propaganda.jsp">产品宣传片</a>
					</div>
					<!--<div class="footer_right">
						<a href="javascript:;">sub</a>
						<a href="javascript:;">sub</a>
						
					</div>-->
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
<script type="text/javascript" src="<%=path%>/jscript/jquery-2.0.3.js"></script>
<script type="text/javascript">
	$('.viptime li').each(function(){
		$(this).on('click',function(){
			$('.viptime li').removeClass('vip_active');
			$(this).addClass('vip_active');
		});
	});
	
	$('.vipbtn').on('click',function(){
		var vippic = $('.vip_active').find('em').html();
		var check = $('.vip_active').find('input').val();
		//alert(vippic);
		//alert(check);
		window.location.href='<%=path%>/vipvippay?vipso=vip&pric='+vippic+'&check='+check;
	});
</script>