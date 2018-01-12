<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
</script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
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
						style="width:120px;height： 50px;margin-top: -2px;" /></a>
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
									<c:forEach items="${type }" var="bs" begin="1">
										<li class="menunav">
											<h5>
												<a href="selsub?id=${bs.ID }&sort=1" target="_bank"><span></span><b>${bs.typeName }</b></a>
											</h5>
											<div class="listmenu">
												<c:forEach items="${as }" var="bsd">
													<c:if test="${bsd.parentID == bs.ID }">
														<dl class="clearfix">
															<dt>
																<a href="selsub?id=${bsd.ID }&sort=2" target="_blank"><span></span>
																	${bsd.typeName }</a>
															</dt>
															<dd>
																<c:forEach items="${asd }" var="asd">
																	<c:if test="${asd.parentID == bsd.ID }">
																		<em><a href="selsub?id=${asd.ID }&sort=3"
																			target="_bank">${asd.typeName }</a></em>
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
					<div class="head-audio">
						<a href="mpindexmp" target="_blank">音频</a>
					</div>
				</div>

				<!--搜索-->
				<form action="selectkey" class="head-form" id="my-form" method="get">
					<div class="head-input">
						<input type="text" class="form-text" placeholder="如“数学”"
							name="Title" /> <span class="submit-mask"></span> <input
							type="submit" class="head-submit" value="" />
					</div>
				</form>

				<!--扶贫入口-->

				<div class="fplogo" style="margin-top: 7px;">
					<a href="getFpMulu " class="navbar-brand" target="_blank"></a>
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
						<c:if test="${vp == 0 }">
							<div class="dlzc-notvip" id="not-vip">
								<div class="nav-vip">
								<a href="javscript:;" onclick="vip()" >开通VIP</a> 
							  
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
											<span><em class="ellipsis" id="nickName">${u.nickName}</em></span>
											
										</div>
										<div><span id="p-noplay"></span> </div>
										<div class="nav-kcjl">
											<a class="my-bfjl" href="javascript:;">
												<h5>
													<i></i>
													<span class="ellipsis" id="p-title" title=""></span>
												</h5>
												<p>
													<span class="ellipsis" id="p-stitle" title=""></span>
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
						<c:if test="${vp == 1 }">
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
											<h6>VIP有效期至：${overtime}</h6>
										</div>
										<div><span id="p-noplay"></span> </div>
										<div class="nav-kcjl">
											<a class="my-bfjl" href="javascript:;">
												<h5>
													<i></i>
													<span class="ellipsis" id="p-title" title=""></span>
												</h5>
												<p>
													<span class="ellipsis" id="p-stitle" title=""></span>
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
</body>
</html>
<script type="text/javascript">
     
	//$(".input-group-addon").on("click",function(){
		
		//$("#my-form").submit(function(e){
			
		//});
	//});

</script>
