<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


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
						<!--菜单栏-->
						<div class="topmenu">
						</div>
					</div>
				</div>
				<!--搜索-->
				<form action="selectkey" class="navbar-form navbar-left" id="my-form" method="post">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="如“数学”" name="Title" style="width: 320px;" value="${search}"/>
					 <!--<span class="input-group-addon">
					          <a href="javascript:;"><span class="glyphicon glyphicon-search" ></span></a>
					    </span>-->
					    <input type="submit" class="input-group-addon" value="搜索" /> 
					</div>
				</form>
                                <!--扶贫入口
             <div class="fplogo" style="margin-top: 7px;">
				   <a href="getFpMulu " class="navbar-brand" target="_blank"></a>
			 </div>-->
				<!--登录注册-->
				<ul class="nav-login">
				<li class="nav-dlzc"><a href="javascript:;" style="color: #666;"></a></li>
				<c:if test="${empty u.ID}">
				<li class="nav-dlzc"><a href="javascript:;" >登录</a></li>
				<li class="nav-dlzc"><a href="javascript:;" >注册</a></li></c:if>
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
