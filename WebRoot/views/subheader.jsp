<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<title>手提课-活到老学到老</title>
<meta http-equiv="content-type" content="text/htm" charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta mame="viewport"
	content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="keywords" content="2017考研,四六级考试,思维导图,学前,公务员考试,小学,初中,高中,考研专业课,考研公共课,高考,微商,中考,艺考,托福考试,雅思考试,法语口语" />
<meta name="description" content="手提课，是全球第一家提出“互联网+教育扶智”的综合性微课教育平台，也是翻转课堂的倡导者和践行者。手提课为学前、小学、初中、高中等人群提供包括语文、数学、英语等精品微课服务。微课简短精炼，生动有趣，满足课前预习，课后复习的学习需求。公众号“手提课K12”" />
<link rel="shortcut icon" href="<%=path%>/icon/favicon.ico">
<link rel="Bookmark" href="<%=path%>/icon/favicon.ico">
</head>  
  <body>
  <div class="wrap">
		<!--顶部-->
		<div class="navheader clearfix">
			<div class="header clearfix">
				<!--logo-->
				<div class="logo" style="margin-top: -3px;">
					<a href="getmenuindex" class="navbar-brand"><img
						src="img/icon/logo-xin.png"
						style="width:120px;height： 50px;margin-top: -15px;" /></a>
				</div>
				<div class="stk-menu">
					<div class="head-menu">
						<a href="getmenuindex">首页</a>
					</div>
					<div id="mymenu">
						<a href="javascript:;" id="menu-kc">课程 <span
							class="glyphicon glyphicon-menu-down" style="font-size: 12px;"></span></a>
						<!--菜单栏-->
						<div class="topmenu">
							<div class="allmenu">
								<ul>
									<c:forEach items="${type }" var="bs">
										<li class="menunav">
											<h5>
												<a href="selsub?id=${bs.ID }&sort=1">${bs.typeName }</a>
											</h5>
											<div class="listmenu">
												<c:forEach items="${as }" var="bsd">
													<c:if test="${bsd.parentID == bs.ID }">
														<dl>
															<dt>
																<a href="selsub?id=${bsd.ID }&sort=2">${bsd.typeName }</a>
															</dt>
															<dd>
																<c:forEach items="${asd }" var="asd">
																	<c:if test="${asd.parentID == bsd.ID }">
																		<em><a href="selsub?id=${asd.ID }&sort=3">${asd.typeName }</a></em>
																	</c:if>
																</c:forEach>
															</dd>
														</dl>
													</c:if>
												</c:forEach>
											</div>
										</li>
									</c:forEach>

								</ul>
							</div>
						</div>
					</div>
				</div>
				<!--搜索-->
				<form action="selectkey" class="navbar-form navbar-left" id="my-form" method="post">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="search" name="search" style="width: 320px;" />
					 <!--<span class="input-group-addon">
					          <a href="javascript:;"><span class="glyphicon glyphicon-search" ></span></a>
					    </span>-->
					    <input type="submit" class="input-group-addon" value="搜索" /> 
					</div>
				</form>
				<!--登录注册-->
				<ul class="nav-login">
				<li><a href="views/shopping.jsp" target="_blank">购物车</a></li>
				<c:if test="${empty u.ID}">
				<li class="nav-dlzc"><a href="javascript:;">登录</a></li>
				<li class="nav-dlzc"><a href="javascript:;">注册</a></li></c:if>
				<c:if test="${!empty u.headUrl}">
				<li><a href="views/personal.jsp"><img alt="" src="${u.headUrl}" style="width: 40px;height: 40px;border-radius: 50%;-webkit-border-radius: 50%;"></a></li>
				<li><a href="${pageContext.request.contextPath}/loginSession" onclick="cookies();">退出</a></li></c:if>
				 <c:if test="${!empty u.telephone&&!empty u.nickName&&empty u.headUrl}">				
				<li ><a href="views/personal.jsp"  >${u.nickName}</a></li>
				<li  ><a href="${pageContext.request.contextPath}/loginSession" onclick="cookies();">退出</a></li></c:if>		
				<c:if test="${!empty u.telephone&&empty u.nickName&&empty u.headUrl}">				
				<li  ><a href="views/personal.jsp" >${u.telephone}</a></li>				
				<li ><a href="${pageContext.request.contextPath}/loginSession" onclick="cookies();">退出</a></li></c:if> 
			</ul>
			</div>
		</div>
		
		
		
  </body>
</html>
