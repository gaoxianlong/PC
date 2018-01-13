<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="json" uri="http://www.atg.com/taglibs/json"%>
<%@ page import="com.stk.entity.Series" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>手提课-活到老学到老</title>
<meta http-equiv="content-type" content="text/htm" charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta mame="viewport"
	content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="keywords" content="2017考研,四六级考试,思维导图,学前,公务员考试,小学,初中,高中,考研专业课,考研公共课,高考,微商,中考,艺考,托福考试,雅思考试,法语口语" />
<meta name="description" content="手提课，是全球第一家提出“互联网+教育扶智”的综合性微课教育平台，也是翻转课堂的倡导者和践行者。手提课为学前、小学、初中、高中等人群提供包括语文、数学、英语等精品微课服务。微课简短精炼，生动有趣，满足课前预习，课后复习的学习需求。公众号“手提课K12”" />
<link rel="shortcut icon" href="<%=path%>/img/icon/favicon.ico">
<link rel="Bookmark" href="<%=path%>/img/icon/favicon.ico">
<link rel="stylesheet" href="<%=path%>/content/bootstrap.min.css" />
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" href="<%=path%>/css/public.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/css/kc_public.css"/>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/FP/fp_index.css"/>
</head>
<body>
<div class="wrap" style="background: #f8fafe;">
	<!--顶部-->
	<div class="navheader clearfix">
		<div class="header clearfix">
			<!--logo-->
			<div class="logo" style="margin-top: -3px;left: 20px;">
				<a href="<%=path%>/getmenuindex" class="navbar-brand"><img src="<%=path%>/img/icon/logo-xin.png" style="width:120px;height： 50px;margin-top: -2px;" /></a>
			</div>
			<div class="stk-menu" style="width: 300px;left: 150px;">
				<div class="head-menu">
					<a href="<%=path%>/getmenuindex">首页</a>
				</div>
				<div class="head-menu" style="width: 110px;">
					<a href="getFpsort?sort=1&yi=2">学前课程</a>
				</div>
				<div id="mymenu" style="width: 110px;">
					<a href="getFpsort?sort=1&yi=1" id="menu-kc" target="_blank">小学课程 <span class="glyphicon glyphicon-menu-down" style="font-size: 12px;"></span></a>
				    <!--菜单栏-->
					<div class="topmenu" style="width: 110px;">
						<div class="allmenu" style="width: 110px;">
							<ul>
								<c:forEach items="${fptype }" var="fptype">
									<li class="menunav">
										<h5>
											<a href="getFpsort?sort=2&erid=${fptype.ID }" target="_blank">${fptype.typeName }</a>
										</h5>
									</li>		
								</c:forEach>
							</ul>
						</div>
					</div>
			    </div>
			</div>
			
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
	<!--countent-->
	<div class="wrapper">
		<!--banner-->
		<div class="content fp-con">
			<div class="con" style="padding: 0;width: 100%;">
				<div class="banner">
					<div class="banner-con">
						<ul>
							<li><a href="javascript:;"></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	    <!--扶贫课程-->
	    <!--学前课程-->
	    
<script>
        
        function fpplay(obj) {
            var id=$(obj).attr("value");
          
		$.ajax({
			url : "judge",
			type : "POST",
			
			data : {
				"seriesID" : id,	
			},
			success : function(msg) {
				
			if(msg.id==1){
			var ids=msg.seid;
			
			$.ajax({
			url : "judgefp",
			type : "POST",
			
			data : {
				"seriesID" : ids,	
			},
			success : function(msg) {
				
			if(msg.id==1){
				var tsid=msg.seid;
					$.ajax({
						url : "fpjdnul",
						type : "POST",
						
						data : {
							"seriesID" : tsid,	
						},
						success : function(msgs) {
							
						if(msgs.id==1){
						window.location.href="ffpfirstplay?seriesID="+msgs.seid;
						//window.open("ffpfirstplay?seriesID="+msgs.seid);
						
						}
						if(msgs.id==0){
						   $('.login-mask').show();
						   $('.nofindvideo').show();
						}
						

						},
						error : function(res) {
							//alert(res.responseText);
							alert("0000000");
						}
					});
			}
			if(msg.id==0){
			
			    $('.login-mask').show();
			  //  $('.login').show();
			   $('.fpzc').show();
			}

			},
			error : function(res) {
				//alert(res.responseText);
				alert("未扶贫。");
			}
		});
			
			
		/////		
			
			}
			if(msg.id==0){
			
			    $('.login-mask').show();
			    $('.login').show();
			//   $('.fpzc').show();
			}
			

			},
			error : function(res) {
				//alert(res.responseText);
				alert("请您先登录。");
			}
		});
	}
</script> 
	    <div class="content fp-xq" style="margin-top:0px;">
			<div class="con">
				<div class="section" id="stk-sec-b">
					<div class="m_pos">
						<div class="stk-head clearfix">
							<h3>学前课程</h3>
							<div class="kc-nav">	
							</div>
							<strong><a href="getFpsort?sort=1&yi=2" target="_blank">查看所有</a></strong>
						</div>
						<div class="stk-body">
							<div class="tabs clearfix">
							<c:forEach items="${preSeries }" var="preSeries">
								<ul class="tabs_con">
									<li>
										<a onclick="fpplay(this)" value="${preSeries.ID }" href="javascript:;" target="_blank">
											<div class="kc">
												<div class="kctop">
													<img class="lazy" alt="" width="200" height="124" src="cover/${preSeries.picURL }" />
												</div>
								                <div class="kcmask"></div>
											</div>
											<div class="texts">
												<div class="titles ellipsis">${preSeries.title }</div>
												<div class="kcsm">
													<p>
														<span></span>
														<span>${preSeries.clickRate }</span>
													</p>
													<p>
													</p>
												</div>
											</div>
										</a>
									</li>
								</ul>
							</c:forEach>
								<!-- jieshu -->
							</div>
						</div>
						<div class="butn prev" id="prev2" title="上一组"></div>
						<div class="butn next" id="next2" title="下一组"></div>
					</div>
				</div>
			</div>	
		</div>
	    <!--小学课程-->
	    <div class="content fp-xx">
			<div class="con">
				<div class="section" id="stk-sec-c">
					<div class="m_pos">
						<div class="stk-head">
							<h3 style="margin-right: 30px;">小学课程</h3>
							<div class="kc-nav">
							<c:forEach items="${fptype }" var="fptype">
								<a href="getFpsort?sort=2&erid=${fptype.ID }">${fptype.typeName }</a>
								
								</c:forEach>
							</div>
							<strong><a href="getFpsort?sort=1&yi=1" target="_blank">查看所有</a></strong>
						</div>
						<div class="stk-body zgkc">
							<div class="tabs">
							
							<%
									Integer seriessmallnumber=(Integer)request.getAttribute("fpseriessmallnumber");
									 
									int number = seriessmallnumber;
									
									if(number%2!=0){
									
									number=number/2+1;
									}
									if(number%2==0){
									
									number=number/2;
									}
									for(int i=1;i<=number;i++){
								
									%>
								<ul class="tabs_con">
									<c:forEach items="${smallSeries }" var="bs" begin="<%=i*2-1 %>" end="<%=i*2 %>">
										<li>
											<a onclick="fpplay(this)" value="${bs.ID }" href="javascript:;" target="_blank">
												<div class="kc">
													<div class="kctop">
														<img class="lazy" alt="" width="200" height="124" src="cover/${bs.picURL }" />
													</div>
									                <div class="kcmask"></div>
												</div>
												<div class="texts">
													<div class="titles ellipsis">${bs.title}</div>
													<div class="kcsm">
														<p>
															<span></span>
															<span>${bs.clickRate }</span>	
														</p>
														<p>	
														</p>
													</div>
												</div>
											</a>
										</li>
									</c:forEach>
								</ul>
									<% 	}
									 %>
							</div>
						</div>
						<div class="butn prev" id="prev3" title="上一组"></div>
						<div class="butn next" id="next3" title="下一组"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>	
<!--未注册时点击视频的弹框-->
<div class="fpzc">
	<div class="fpzctop">
		<a href=" " class="fptc-close btn-close"></a>
	</div>
	<div class="fpzcmain">
		<div class="fpzcyhm">
				<input type="text" placeholder="输入免费学习验证码" id="fpzc-yhm" />
				<p></p >
				<input type="button" value="提交验证码" id="fpzc-btn" onblur="yhm();"/>  
		</div>
		<p><span class=""></span>已获得”互联网+教育扶贫“免费学习验证码的学校用户，可提交验证码后直接观看课程。</p >
	</div>
	<div class="fplink"><a href="<%=path%>/views/about/cooperation.jsp" target="_blank">获取免费学习验证码</a></div>
</div>
<%@include file="../../footer.jsp"%>
<!--找不到视频-->
<div class="nofindvideo">
	<div class="nokc">
		<p>该课程正在紧锣密鼓的准备中，敬请期待~</p >
		<span class="notvideo-close">好，继续浏览其他课程</span>
	</div>
</div>
</body>
</html>
<script type="text/javascript" src="<%=path%>/jscript/jquery-2.0.3.js" ></script>
<script type="text/javascript" src="<%=path%>/js/public.js"></script>
<script type="text/javascript" src="jscript/jquery.cookie.js"></script>
<script type="text/javascript" src="<%=path%>/js/login-public.js"></script>
<script type="text/javascript" src="<%=path%>/js/home.js"></script>
<script type="text/javascript" src="<%=path%>/js/kc_public.js"></script>
<script type="text/javascript" src="<%=path%>/js/fp/fppublic.js"></script>
<script type="text/javascript">
//关闭没有视频的弹窗
$('.notvideo-close').click(function(){
		$(this).parent().parent().hide();
		$('.login-mask').hide();
	});
		//日期调用
$('.date').each(function(){
	$(this).ionDatePicker({
		lang: 'zh-cn',
		format: 'YYYY-MM-DD'
	});
});
</script>
