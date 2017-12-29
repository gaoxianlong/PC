<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
												<a href="selsub?id=${bs.ID }&sort=1"  target="_bank"><span></span><b>${bs.typeName }</b></a>
											</h5>
											<div class="listmenu">
												<c:forEach items="${as }" var="bsd">
													<c:if test="${bsd.parentID == bs.ID }">
														<dl class="clearfix">
															<dt>
																<a href="selsub?id=${bsd.ID }&sort=2" target="_blank"><span></span> ${bsd.typeName }</a>
															</dt>
															<dd>
																<c:forEach items="${asd }" var="asd">
																	<c:if test="${asd.parentID == bsd.ID }">
																		<em><a href="selsub?id=${asd.ID }&sort=3" target="_bank">${asd.typeName }</a></em>
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
						<input type="text" class="form-text" placeholder="如“数学”" name="Title"/>
					    <span class="submit-mask"></span>
					    <input type="submit" class="head-submit" value="" />
					</div>
				</form>
				
                                <!--扶贫入口-->
			
           		<div class="fplogo" style="margin-top: 7px;">
				       <a href="getFpMulu " class="navbar-brand" target="_blank"></a>
				</div>
				<!--登录注册-->
				<ul class="nav-login">
				<c:if test="${vp == 0 }">
					<li class="nav-vip">
						<a href="javascript:;" onclick="vip()">成为VIP</a>
					</li>
				</c:if>
				
				<c:if test="${vp == 1 }">
					<!--<li class="nav-vip">< a href=" " target="_blank">成为VIP</ a></li>-->
					<li class="nav-vip">
						<a href="javscript:;">我的VIP</a>
						<div class="viptime">有效期至：${overtime}</div>
					</li>
				</c:if>
				
				
				
				
				<li class="nav-dlzc"><a href="javascript:;" style="color: #666;"></a></li>
				<c:if test="${empty u.ID}">
				<li class="nav-dlzc"><a href="javascript:;" >登录</a></li>
				<li class="nav-dlzc"><a href="javascript:;" >注册</a></li></c:if>
                 <c:if test="${!empty u.headUrl}">
				<li><a href="views/personal.jsp"><img alt="" src="${u.headUrl}" style="width: 40px;height: 40px;border-radius: 50%;-webkit-border-radius: 50%;"></a></li>
				<li ><a href="${pageContext.request.contextPath}/loginSession" onclick="cookies();" >退出</a></li></c:if>
				 <c:if test="${!empty u.telephone&&!empty u.nickName&&empty u.headUrl}">				
				<li ><a href="views/personal.jsp"  >${u.nickName}</a></li>
				<li  ><a href="${pageContext.request.contextPath}/loginSession" onclick="cookies();" >退出</a></li></c:if>		
				<c:if test="${!empty u.telephone&&empty u.nickName&&empty u.headUrl}">				
				<li  ><a href="views/personal.jsp" >${u.telephone}</a></li>				
				<li ><a href="${pageContext.request.contextPath}/loginSession" onclick="cookies();">退出</a></li></c:if> 
			</ul>
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
