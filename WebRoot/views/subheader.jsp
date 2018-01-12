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
<link rel="shortcut icon" href="<%=path%>/img/icon/favicon.ico">
<link rel="Bookmark" href="<%=path%>/img/icon/favicon.ico">
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
									<a href="javascript:;">我的VIP</a>
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
		</div>
		
		
  </body>
</html>
