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
 <script>
        
        function lanjieplay(obj) {
            var id=$(obj).attr("value"); 
		$.ajax({
			url : "lanjiejudge",
			type : "POST",
			
			data : {
				"seriesID" : id,	
			},
			success : function(msg) {
				
			if(msg.id==1){
			//window.location.href="firstplay?seriesID="+msg.seid;
			var tsid=msg.seid;    
					$.ajax({
						url : "jdgecourse",
						type : "POST",
						
						data : {
							"seriesID" : tsid,	
						},
						success : function(msgs) {
							
						if(msgs.id==1){
						window.location.href="firstplay?seriesID="+msgs.seid;
						//window.open("firstplay?seriesID="+msgs.seid);
						
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
			    $('.login').show();
			}
			
			},
			error : function(res) {
				//alert(res.responseText);
				alert("请您先登录。");
			}
		});
	}
	      
        //
      function vip() {  
		$.ajax({
			url : "lanjiejudge",
			type : "POST",
			
			data : {
				"seriesID" : 0,
			},
			success : function(msg) {
				
				//begin
				if(msg.id==1){
				//window.location.href="<%=path%>/views/member.jsp";
					$.ajax({
						url : "vipjudge",
						type : "POST",
						
						data : {
							
						},
						success : function(msg) {
							
						if(msg==1){
						
						     alert("您已经是VIP了，无需再次购买！");
						}
						if(msg==0){
							window.location.href="<%=path%>/views/member.jsp";
						}
						
						},
						error : function(res) {
							//alert(res.responseText);
							alert("请您先登录。");
						}
					});   
				//over   
			}
			if(msg.id==0){
			    $('.login-mask').show();
			    $('.login').show();
			}
			
			},
			error : function(res) {
				//alert(res.responseText);
				alert("请您先登录。");
			}
		});
	}   
        //
        </script>

<meta charset="utf-8" />
<title>手提课-活到老学到老</title>
<meta http-equiv="content-type" content="text/htm" charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta mame="viewport"
	content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="keywords" content="2017考研,四六级考试,思维导图,学前,公务员考试,小学,初中,高中,考研专业课,考研公共课,高考,微商,中考,艺考,托福考试,雅思考试,法语口语" />
<meta name="description" content="手提课，是全球第一家提出“互联网+教育扶智”的综合性微课教育平台，也是翻转课堂的倡导者和践行者。手提课为学前、小学、初中、高中等人群提供包括语文、数学、英语等精品微课服务。微课简短精炼，生动有趣，满足课前预习，课后复习的学习需求。公众号“手提课K12”" />
<link rel="shortcut icon" href="img/icon/favicon.ico">
<link rel="Bookmark" href="img/icon/favicon.ico">
<link rel="stylesheet" href="content/bootstrap.min.css" />
<link rel="stylesheet" href="content/swiper.min.css" />

<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" href="css/public.css" />
<link rel="stylesheet" type="text/css" href="css/kc_public.css"/>
<link rel="stylesheet" type="text/css" href="content/ion.calendar.css" />
<link rel="stylesheet" href="css/index.css" />
<link rel="stylesheet" href="css/menu.css" />
<style type="text/css">
</style>
</head>
<body style="margin-top: 50px;" data-spy="scroll"
	data-target="#myNavbar" data-offset="100"> 
	<%@include file="header.jsp"%>
		<div class="wrapper">
			<div class="content" style="background: #bfbfbf;box-shadow: rgba(0, 0, 0, 0.1) 0px 3px 40px;-webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 3px 40px;">
			<div class="con" style="padding: 0;width: 100%;">
				<!--banner-->
				<div class="banner" id="myTop">
					<div class="banner-con">
						<ul class="bannerlist">
							<li class="banner-item banneractive">
								<a href="<%=path%>/getFpMulu" target="_bank"></a>
							</li>
							<li class="banner-item">
								<a onclick="lanjieplay(this)" value="155"></a>
							</li>
							<li class="banner-item">
								<a onclick="lanjieplay(this)" value="135"></a>
							</li>
							<li class="banner-item">
								<a onclick="lanjieplay(this)" value="128"></a>
							</li>
							<li class="banner-item">
								<a onclick="lanjieplay(this)" value="173"></a>
							</li>
							<li class="banner-item">
								<a onclick="lanjieplay(this)" value="268"></a>
							</li>
							<li class="banner-item">
								<a onclick="lanjieplay(this)" value="169"></a>
							</li>
							<li class="banner-item">
								<a onclick="lanjieplay(this)" value="258"></a>
							</li>
							<li class="banner-item">
								<a href="views/about/about.jsp"></a>
							</li>
							<li class="banner-item">
								<a href="views/about/propaganda.jsp"></a>
							</li>
						</ul>
					</div>
					<div class="icon">
						<ul class="iconlist">
							<li class="icon-item iconactive">
								<a href="<%=path%>/getFpMulu" target="_bank"><p>教育扶贫：</p><p class="cont">互联网+教育扶贫</p></a>
							</li>
							<li class="icon-item">
								<a onclick="lanjieplay(this)" value="155"><p>高考化学：</p><p class="cont">如何秒出答案</p></a>
							</li>
							<li class="icon-item">
								<a onclick="lanjieplay(this)" value="135"><p>考研政治：</p><p class="cont">考前冲刺课</p></a>
							</li>
							<li class="icon-item">
								<a onclick="lanjieplay(this)" value="128"><p>考研数学：</p><p class="cont">高数预测与冲刺</p></a>
							</li>
							<li class="icon-item">
								<a onclick="lanjieplay(this)" value="173"><p>小学数学：</p><p class="cont">同步课堂精讲</p></a>
							</li>
							<li class="icon-item">
								<a onclick="lanjieplay(this)" value="268"><p>新概念：</p><p class="cont">艺术生冲刺</p></a>
							</li>
							<li class="icon-item">
								<a onclick="lanjieplay(this)" value="169"><p>小学英语：</p><p class="cont">同步课程精讲</p></a>
							</li>
							<li class="icon-item">
								<a onclick="lanjieplay(this)" value="258"><p>小学作文：</p><p class="cont">作文方法之立意技巧</p></a>
							</li>
							<li class="icon-item">
								<a href="views/about/about.jsp"><p>品牌介绍：</p><p class="cont">独一无二的品牌个性</p></a>
							</li>
							<li class="icon-item">
								<a href="views/about/propaganda.jsp"><p>产品介绍：</p><p class="cont">独一无二的服务产品</p></a>
							</li>
						</ul>
					</div>
				</div>
			</div>	
		</div>
		<div class="wrapp-main">
			<!-- 课程分类-->
			<div class="content">
				<div class="con">
					<div class="section">
						<div class="m_pos">
							<div class="stk-head">
								<h3 style="width: 100%;border: 0;text-align: center;">课程分类</h3>
							</div>
							<div class="stk-body" style="height: 124px;">
								<div class="tabs clearfix">
									<ul>
										<li>
											<div class="kc">
												<div class="kctop">
													<a href="selsub?id=188&sort=1" target="_blank" class="kcfl">
														<img class="lazy" alt="" width="200" height="124" data-original="img/kcfl01.jpg" src="img/kcfl01.jpg" />
														<div class="kc_mask"><p class="kcfl-title">学 前</p ></div>
													</a>
											   </div>
											</div>
										</li>
									</ul>
									<ul>
										<li>
											<div class="kc">
												<div class="kctop">
													<a href="selsub?id=189&sort=1" class="kcfl" target="_blank">
														<img class="lazy" alt="" width="200" height="124" data-original="img/kcfl02.jpg" src="img/kcfl02.jpg" />
														<div class="kc_mask"><p class="kcfl-title">小 学</p ></div>
													</a>
												</div>
								               
											</div>
										</li>
									</ul>
									<ul>
										<li>
											<div class="kc">
												<div class="kctop">
													<a href="selsub?id=190&sort=1" class="kcfl" target="_blank">
														<img class="lazy" alt="" width="200" height="124" data-original="img/kcfl03.jpg" src="img/kcfl03.jpg" />
														<div class="kc_mask"><p class="kcfl-title">初 中</p ></div>
													</a>
												</div>
								                
											</div>
										</li>
									</ul>	
									<ul>
										<li>
											<div class="kc">
												<div class="kctop">
													<a href="selsub?id=206&sort=1" class="kcfl" target="_blank">
														<img class="lazy" alt="" width="200" height="124" data-original="img/kcfl04.jpg" src="img/kcfl04.jpg" />
														<div class="kc_mask"><p class="kcfl-title">高 中</p ></div>
													</a>	
												</div>  
											</div>
										</li>
									</ul>
									<ul>
										<li>
											<div class="kc">
												<div class="kctop">
													<a href="selsub?id=207&sort=1" class="kcfl" target="_blank">
														<img class="lazy" alt="" width="200" height="124" data-original="img/kcfl05.jpg" src="img/kcfl05.jpg" />
														<div class="kc_mask"><p class="kcfl-title">考 研</p ></div>
													</a>
												</div>   
											</div>
										</li>
									</ul>
								</div>
							</div>
							<div class="butn prev" id="prev1" title="上一组" style="margin-top: -14px;">
								<!--<a href="#" title="上一组"><</a>-->
							</div>
							<div class="butn next" id="next1" title="下一组" style="margin-top: -14px;">
								<!--<a href="#" title="下一组">></a>-->
							</div>
                                                        <div id="stk-sec-a"></div>
						</div>
					
					</div>
				</div>
				<!--专题活动-->
				<div class="con" style="margin-bottom: 50px;">
					<a href="getFpMulu" class="fp" target="_blank"></a>
				</div>
			</div>
			
			<!-- 免费 -->
			
			<div class="content">
				<div class="con">
					<div class="section">
						<div class="m_pos">
							<div class="stk-head clearfix">
								<h3>免费专区</h3>
							</div>
							<div class="stk-body">
								<div class="tabs clearfix">									
								<c:forEach items="${seriesfree }" var="bsd" >
									<ul class="tabs_con">
										<li>
											<a href="freeplay?seriesID=${bsd.ID }" value="${bsd.ID }" target="_blank">
												<div class="kc">
													<div class="kctop">
														<img class="lazy" alt="" width="200" height="124" src="cover/${bsd.picURL }" />
													</div>
													<div class="kcmask"></div>
												</div>
												<div class="texts">
													<div class="titles ellipsis">${bsd.title }</div>
													<div class="kcsm">
														<p>
															<span></span> 
															<span>${bsd.clickRate }</span>
														</p>
														<p>
															<em>免费</em>
														</p>
													</div>
												</div>
											</a>
										</li>
									</ul>
									
								</c:forEach>	
									<ul class="tabs_con">
										<li style="height: 124px;">
											<a href="javascript:;" onclick="vip()">
												<div class="kc">
													<div class="kctop">
														<img class="lazy" data-original="img/mfzqvip.png" src="img/mfzqvip.png" alt="" width="200" height="124" />
													</div>
												</div>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 免费 -->
			<!--学前课程-->
			<div class="content">
				<div class="con">
					<div class="section" id="stk-sec-b">
						<div class="m_pos">
							<div class="stk-head clearfix">
							<c:forEach items="${type }" var="bs" begin="0" end="0">
								<h3>${bs.typeName }</h3>
								</c:forEach>
								<div class="kc-nav">
									<c:forEach items="${type }" var="bs" begin="0" end="0">
										<c:forEach items="${as }" var="bsd" >
											<c:if test="${bsd.parentID == bs.ID }">
												<a href="selsub?id=${bsd.ID }&sort=2" target="_blank">${bsd.typeName }</a>	     	
											</c:if>
											</c:forEach>	
									</c:forEach>	
								</div>
								<strong><a href="selsub?id=188&sort=1" target="_blank">查看所有</a></strong>
							</div>
							<div class="stk-body">
								<div class="tabs clearfix">
									<c:forEach items="${type }" var="bs" begin="0" end="0">
										<c:forEach items="${seriesseltotal }" var="bsd" >
											<c:if test="${bsd.typeValue == bs.ID }">	
												<ul class="tabs_con">
													<li>
														<a onclick="lanjieplay(this)" value="${bsd.ID }" target="_blank">
															<div class="kc">
																<div class="kctop">
																	<img class="lazy" alt="" width="200" height="124" src="cover/${bsd.picURL }" />
																</div>
																<div class="kcmask"></div>
															</div>
															<div class="texts">
																<div class="titles ellipsis">${bsd.title }</div>
																<div class="kcsm">
																	<p>
																		<span></span> 
																		<span>${bsd.clickRate }</span>
																	</p>
																	<p>
																		<em>￥${bsd.realPrice }</em>
																	</p>
																</div>
															</div>
														</a>
													</li>
												</ul>
											</c:if>
										</c:forEach>	
									</c:forEach>
								</div>
							</div>
							<div class="butn prev" id="prev2" title="上一组"></div>
							<div class="butn next" id="next2" title="下一组"></div>
						</div>
					</div>
				</div>
			</div>
			<!--小学课程-->
			<div class="content">
				<div class="con">
					<div class="section" id="stk-sec-c">
						<div class="m_pos">
							<div class="stk-head">
							<c:forEach items="${type }" var="bs" begin="1" end="1">
								<h3>${bs.typeName }</h3>
								</c:forEach>
								<div class="kc-nav">
									<c:forEach items="${type }" var="bs" begin="1" end="1">
											<c:forEach items="${as }" var="bsd">
												<c:if test="${bsd.parentID == bs.ID }">
													<a href="selsub?id=${bsd.ID }&sort=2" target="_blank">${bsd.typeName }</a>		
												</c:if>
											</c:forEach>	
									</c:forEach>				
								</div>
							<strong><a href="selsub?id=189&sort=1" target="_blank">查看所有</a></strong>
							</div>
							<div class="stk-body zgkc">
								<div class="tabs">
								
							<!--  -->	
								<c:forEach items="${seriessmall }" var="bs" begin="5" end="5">
									<div class="fir">
										<div class="only">
											<a onclick="lanjieplay(this)" value="${bs.ID }" target="_blank">
												<div class="kc">
													<div class="kctop">
														<img class="lazy" alt="" width="200" height="322" src="cover/${bs.picURL2}" />
													</div>
													<div class="kcmask"></div>
												</div>
												<div class="texts">
													<div class="titles ellipsis">${bs.title }</div>
													<div class="kcsm">
														<p>
															<span></span> 
															<span>${bs.clickRate }</span>
														</p>
														<p>
															<em>￥${bs.realPrice }</em>
														</p>
													</div>
												</div>
											</a>
										</div>
									</div>
								</c:forEach>
									
									<%
									Integer seriessmallnumber=(Integer)request.getAttribute("seriessmallnumber");
									List list = (List)request.getAttribute("seriessmall"); 
									 
									int number = seriessmallnumber-1;
									
									if(number%2!=0){
									
									number=number/2+1;
									}
									if(number%2==0){
									
									number=number/2;
									}
									for(int i=1;i<=number;i++){
								
									%>
									
															
									<ul class="tabs_con">
										<c:forEach items="${seriessmall }" var="bs" begin="<%=i*2-2 %>" end="<%=i*2-1 %>">
											<li>
												<a onclick="lanjieplay(this)" value="${bs.ID }" target="_blank">
													<div class="kc">
														<div class="kctop">
															<img class="lazy" alt="" width="200" height="124" src="cover/${bs.picURL }" />
														</div>
														<div class="kcmask"></div>
													</div>
													<div class="texts">
														<div class="titles ellipsis">${bs.title} </div>
														<div class="kcsm">
															<p>
																<span></span> 
																<span>${bs.clickRate }</span>
															</p>
															<p>
																<em>￥${bs.realPrice }</em>
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
			<!--中学课程-->
			<div class="content">
				<div class="con">
					<div class="section" id="stk-sec-d">
						<div class="m_pos">
							<div class="stk-head">
								<c:forEach items="${type }" var="bs" begin="2" end="2">
								<h3>${bs.typeName }</h3>
								</c:forEach>
								<div class="kc-nav">
									<c:forEach items="${type }" var="bs" begin="2" end="2">
										<c:forEach items="${as }" var="bsd">
											<c:if test="${bsd.parentID == bs.ID }">
													<a href="selsub?id=${bsd.ID }&sort=2" target="_blank">${bsd.typeName }</a>		
											</c:if>
									 	</c:forEach>	
									</c:forEach>	
								</div>
								<strong><a href="selsub?id=190&sort=1" target="_blank">查看所有</a></strong>
							</div>
							<div class="stk-body zgkc">
								<div class="tabs clearfix">
								
								<c:forEach items="${seriesmiddle }" var="bs" begin="3" end="3">
								
									<div class="zxkc">
										<div class="only">
											<a onclick="lanjieplay(this)" value="${bs.ID }" target="_blank">
												<div class="kc">
													<div class="kctop">
														<img class="lazy" alt="" width="420" height="322" src="cover/${bs.picURL2 }" />
													</div>
												
													<div class="kcmask"></div>
												</div>
												<div class="texts">
													<div class="titles ellipsis">${bs.title }</div>
													<div class="kcsm">
														<p>
															<span></span> 
															<span>${bs.clickRate }</span>
														</p>
														<p>
															<em>￥${bs.realPrice }</em>
														</p>
													</div>
												</div>
											</a>
										</div>
									</div>
									
								</c:forEach>
									<%
								Integer seriesmiddlenumber=(Integer)request.getAttribute("seriesmiddlenumber");
									 
									int numbermiddle = seriesmiddlenumber-1;
									
									if(numbermiddle%2!=0){
									
									numbermiddle=numbermiddle/2+1;
									}
									if(numbermiddle%2==0){
									
									numbermiddle=numbermiddle/2;
									}
									for(int i=1;i<=numbermiddle;i++){
								
									%>
									<ul class="tabs_con">
									<c:forEach items="${seriesmiddle }" var="bs" begin="<%=i*2-2 %>" end="<%=i*2-1 %>">
										<li>
											<a onclick="lanjieplay(this)" value="${bs.ID }">
												<div class="kc">
													<div class="kctop">
														<img class="lazy" alt="" width="200" height="124" src="cover/${bs.picURL }" />
													</div>
													<div class="kcmask"></div>
												</div>
												<div class="texts">
													<div class="titles ellipsis">${bs.title }</div>
													<div class="kcsm">
														<p>
															<span></span> 
															<span>${bs.clickRate }</span>
														</p>
														<p>
															<em>￥${bs.realPrice }</em>
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
							<div class="butn prev" id="prev4" title="上一组"></div>
							<div class="butn next" id="next4" title="下一组"></div>
						</div>
					</div>

				</div>
			</div>
			<!--高中课程-->
			<div class="content">
				<div class="con">
					<div class="section" id="stk-sec-e">
						<div class="m_pos">
							<div class="stk-head">
								<c:forEach items="${type }" var="bs" begin="3" end="3">
								<h3>${bs.typeName }</h3>
								</c:forEach>
								<div class="kc-nav">
									<c:forEach items="${type }" var="bs" begin="3" end="3">
											<c:forEach items="${as }" var="bsd">
												<c:if test="${bsd.parentID == bs.ID }">
													<a href="selsub?id=${bsd.ID }&sort=2" target="_blank">${bsd.typeName }</a>		
												</c:if>
											</c:forEach>	
									</c:forEach>
								</div>
								<strong><a href="selsub?id=206&sort=1" target="_blank">查看所有</a></strong>
							</div>
							<div class="stk-body zgkc">
								<div class="tabs">
								<c:forEach items="${serieshigh }" var="bs" begin="9" end="9">
									<div class="zxkc">
										<div class="only">
											<a onclick="lanjieplay(this)" value="${bs.ID }" target="_blank">
												<div class="kc">
												
													<div class="kctop">
														<img class="lazy" alt="" width="420" height="322" src="cover/${bs.picURL2 }" />
													</div>
													
													<div class="kcmask"></div>
												</div>
												<div class="texts">
													<div class="titles ellipsis">${bs.title }</div>
													<div class="kcsm">
														<p>
															<span></span> 
															<span>${bs.clickRate }</span>
														</p>
														<p>
															<em>￥${bs.realPrice }</em>
														</p>
													</div>
												</div>
											</a>
										</div>
									</div>
								</c:forEach>
										<%
								Integer serieshighnumber=(Integer)request.getAttribute("serieshighnumber");
									 
									int numberhigh = serieshighnumber-1;
									
									if(numberhigh%2!=0){
									
									numberhigh=numberhigh/2+1;
									}
									if(numberhigh%2==0){
									
									numberhigh=numberhigh/2;
									}
									for(int i=1;i<=numberhigh;i++){
								
									%>
									
									<div class="tabs_thr">
										<ul class="tabs_con">
											<c:forEach items="${serieshigh }" var="bs" begin="<%=i*2-2 %>" end="<%=i*2-1 %>">
											<li>
												<a onclick="lanjieplay(this)" value="${bs.ID }" target="_blank">
													<div class="kc">
														<div class="kctop">
															<img class="lazy" alt="" width="200" height="124" src="cover/${bs.picURL }" />
														</div>
														<div class="kcmask"></div>
													</div>
													<div class="texts">
														<div class="titles ellipsis">${bs.title }</div>
														<div class="kcsm">
															<p>
															<span></span> 
															<span>${bs.clickRate }</span>
														</p>
														<p>
															<em>￥${bs.realPrice }</em>
														</p>
														</div>
													</div>
												</a>
											</li>
											</c:forEach>	
										</ul>
									</div>
								<% 	}
									 %>
								
								</div>
							</div>
							<div class="butn prev" id="prev5" title="上一组"></div>
							<div class="butn next" id="next5" title="下一组"></div>
						</div>
					</div>
				</div>
			</div>
			<!--kaoyan课程-->
			<div class="content">
				<div class="con">
					<div class="section" id="stk-sec-f">
						<div class="m_pos">
							<div class="stk-head">
							<c:forEach items="${type }" var="bs" begin="4" end="4">
								<h3>${bs.typeName }</h3>
								</c:forEach>
								<div class="kc-nav">
								<c:forEach items="${type }" var="bs" begin="4" end="4">
												<c:forEach items="${as }" var="bsd">
														<c:if test="${bsd.parentID == bs.ID }">
															<a href="selsub?id=${bsd.ID }&sort=2" target="_blank">${bsd.typeName }</a>		
														</c:if>
												</c:forEach>	
								</c:forEach>
								</div>
								<strong><a href="selsub?id=207&sort=1" target="_blank">查看所有</a></strong>
							</div>
							<div class="stk-body zgkc">
								<div class="tabs">
								<c:forEach items="${seriesart }" var="bs" begin="5" end="5">
									<div class="zxkc">
										<div class="only">
											<a onclick="lanjieplay(this)" value="${bs.ID }" target="_blank">
												<div class="kc">
													<div class="kctop">
													
													     <img class="lazy" alt="" width="420" height="322" src="cover/${bs.picURL2 }" />
													</div>
													
													<div class="kcmask"></div>
												</div>
												<div class="texts">
													<div class="titles ellipsis">${bs.title }</div>
													<div class="kcsm">
														<p>
															<span></span> 
															<span>${bs.clickRate }</span>
														</p>
														<p>
															<em>￥${bs.realPrice }</em>
														</p>
													</div>
												</div>
											</a>
										</div>
									</div>
									</c:forEach>
										<%
								Integer seriesartnumber=(Integer)request.getAttribute("seriesartnumber");
									 
									int numberart = seriesartnumber-1;
									
									if(numberart%2!=0){
									
									numberart=numberart/2+1;
									}
									if(numberart%2==0){
									
									numberart=numberart/2;
									}
									for(int i=1;i<=numberart;i++){
									%>
									<ul class="tabs_con">
										<c:forEach items="${seriesart }" var="bs" begin="<%=i*2-2 %>" end="<%=i*2-1 %>">
										<li>
											<a onclick="lanjieplay(this)" value="${bs.ID }" target="_blank">
												<div class="kc">
													<div class="kctop">
														<img class="lazy" alt="" width="200" height="124" src="cover/${bs.picURL }" />
													</div>
													<div class="kcmask"></div>
												</div>
												<div class="texts">
													<div class="titles ellipsis">${bs.title }</div>
													<div class="kcsm">
														<p>
															<span></span> 
															<span>${bs.clickRate }</span>
														</p>
														<p>
															<em>￥${bs.realPrice }</em>
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
							<div class="butn prev" id="prev6" title="上一组"></div>
							<div class="butn next" id="next6" title="下一组"></div>
						</div>
					</div>
				</div>
			</div>
			<!-- yuyan-->
			<div class="content">
				<div class="con">
					<div class="section" id="stk-sec-g">
						<div class="m_pos">
							<div class="stk-head">
								<c:forEach items="${type }" var="bs" begin="5" end="5">
								<h3>${bs.typeName }</h3>
								</c:forEach>
								<div class="kc-nav">
									<c:forEach items="${type }" var="bs" begin="5" end="5">
												<c:forEach items="${as }" var="bsd">
													<c:if test="${bsd.parentID == bs.ID }">
																<a href="selsub?id=${bsd.ID }&sort=2" target="_blank">${bsd.typeName }</a>		
													</c:if>
												</c:forEach>	
									</c:forEach>
								</div>
								<strong><a href="selsub?id=208&sort=1" target="_blank">查看所有</a></strong>
							</div>
						<div class="stk-body">
							<div class="tabs clearfix">	
							<c:forEach items="${type }" var="bs" begin="5" end="5">
								<c:forEach items="${seriesseltotal }" var="bsd" >
									<c:if test="${bsd.typeValue == bs.ID }">
									<ul class="tabs_con">
										<li>
											<a onclick="lanjieplay(this)" value="${bsd.ID }" target="_blank">
												<div class="kc">
													<div class="kctop">
														<img class="lazy" alt="" width="200" height="124" src="cover/${bsd.picURL }" />
													</div>
													<div class="kcmask"></div>
												</div>
												<div class="texts">
													<div class="titles ellipsis">${bsd.title}</div>
													<div class="kcsm">
														<p>
															<span></span> 
															<span>${bsd.clickRate }</span>
														</p>
														<p>
															<em>￥${bsd.realPrice }</em>
														</p>
													</div>
												</div>
											</a>
										</li>
									</ul>
									</c:if>
								</c:forEach>	
							</c:forEach>	
							</div>
						</div>
							<div class="butn prev" id="prev7" title="上一组"></div>
							<div class="butn next" id="next7" title="下一组"></div>
						</div>
					</div>
				</div>
			</div>
			<!--思享-->
			<div class="content">
				<div class="con">
					<div class="section" id="stk-sec-h">
						<div class="m_pos">
							<div class="stk-head">
									<c:forEach items="${type }" var="bs" begin="6" end="6">
								<h3>${bs.typeName }</h3>
								</c:forEach>
								<div class="kc-nav">
										<c:forEach items="${type }" var="bs" begin="6" end="6">
												<c:forEach items="${as }" var="bsd">
													<c:if test="${bsd.parentID == bs.ID }">
																<a href="selsub?id=${bsd.ID }&sort=2" target="_blank">${bsd.typeName }</a>		
													</c:if>
												</c:forEach>	
										</c:forEach>
								</div>
								<strong><a href="selsub?id=209&sort=1" target="_blank">查看所有</a></strong>
							</div>
							<div class="stk-body">
								<div class="tabs">
								<c:forEach items="${type }" var="bs" begin="6" end="6">
									<c:forEach items="${seriesseltotal }" var="bsd" >
										<c:if test="${bsd.typeValue == bs.ID }">
											<ul class="tabs_con">
												<li>
													<a onclick="lanjieplay(this)" value="${bsd.ID }" target="_blank">
														<div class="kc">
															<div class="kctop">
																<img class="lazy" alt=""
																	width="200" height="124" src="cover/${bsd.picURL }" />
															</div>
															<div class="kcmask"></div>
														</div>
														<div class="texts">
															<div class="titles ellipsis">${bsd.title }</div>
															<div class="kcsm">
																<p>
																	<span></span> 
																	<span>${bsd.clickRate }</span>
																</p>
																<p>
																	<em>￥${bsd.realPrice }</em>
																</p>
															</div>
														</div>
													</a>
												</li>
											</ul>
										</c:if>
									</c:forEach>	
								</c:forEach>	
								</div>
							</div>
							<div class="butn prev" id="prev8" title="上一组"></div>
							<div class="butn next" id="next8" title="下一组"></div>
						</div>
					</div>
				</div>
			</div>
			<!--yishu-->
			<div class="content">
				<div class="con">
					<div class="section" id="stk-sec-i">
						<div class="m_pos">
							<div class="stk-head">
									<c:forEach items="${type }" var="bs" begin="7" end="7">
								<h3>${bs.typeName }</h3>
								</c:forEach>
								<div class="kc-nav">
									<c:forEach items="${type }" var="bs" begin="7" end="7">
											<c:forEach items="${as }" var="bsd">
												<c:if test="${bsd.parentID == bs.ID }">
													<a href="selsub?id=${bsd.ID }&sort=2" target="_blank">${bsd.typeName }</a>		
												</c:if>
											</c:forEach>	
									</c:forEach>
								</div>
								<strong><a href="selsub?id=210&sort=1" target="_blank">查看所有</a></strong>
							</div>
							<div class="stk-body">
								<div class="tabs">	
								<c:forEach items="${type }" var="bs" begin="7" end="7">
										<c:forEach items="${seriesseltotal }" var="bsd" >
											<c:if test="${bsd.typeValue == bs.ID }">
												<ul class="tabs_con">
													<li>
														<a onclick="lanjieplay(this)" value="${bsd.ID }" target="_blank">
															<div class="kc">
																<div class="kctop">
																	<img class="lazy" alt="" width="200" height="124" src="cover/${bsd.picURL }" />
																</div>
																<div class="kcmask"></div>
															</div>
															<div class="texts">
																<div class="titles ellipsis">${bsd.title}</div>
																<div class="kcsm">
																	<p>
																		<span></span> 
																		<span>${bsd.clickRate }</span>
																	</p>
																	<p>
																		<em>￥${bsd.realPrice }</em>
																	</p>
																</div>
															</div>
														</a>
													</li>
												</ul>
											</c:if>
										</c:forEach>	
								</c:forEach>
								</div>
							</div>
							<div class="butn prev" id="prev9" title="上一组"></div>
							<div class="butn next" id="next9" title="下一组"></div>
						</div>
					</div>
				</div>
			</div>
			<!--推荐专题-->
			<diV class="content">
				<div class="con bottom" id="stk-sec-j">
					<div class="section">
						<div class="cksy" id="cksy">查看所有分类</div>
					</div>
				</div>
		    </div>
		</div> 
<%@include file="footer.jsp"%>
		<!--竖的导航条 滚动监听-->
	<div id="mynav" style="display: none;width: 52px;height: 460px;position: fixed;left: 10px;top: 50%;margin-top: -120px;opacity: 1;border-radius: 5px;">
		<ul class="nav nav-stacked" style="box-shadow: 0px 5px 10px rgba(0,0,0,.15);-webkit-box-shadow: 0px 5px 10px rgba(0,0,0,.15);">
			<li class="active"><a href="#stk-sec-a">扶贫</a></li>
			<li><a href="#stk-sec-b">学前</a></li>
			<li><a href="#stk-sec-c">小学</a></li>
			<li>
				<a href="#stk-sec-d">初中</a>
			</li>
			<li>
				<a href="#stk-sec-e">高中</a>
			</li>
			<li>
				<a href="#stk-sec-f">考研</a>
			</li>
			<li>
				<a href="#stk-sec-g">语种</a>
			</li>
			<li>
				<a href="#stk-sec-h">艺术</a>
			</li>
			<li>
				<a href="#stk-sec-i">思享</a>
			</li>
		</ul>
		<div class="mytop" style="box-shadow: 0px 5px 10px rgba(0,0,0,.15);-webkit-box-shadow: 0px 5px 10px rgba(0,0,0,.15);">
			<a href="#myTop">返回顶部</a>
		</div>
	</div>
</div>
	<!--找不到视频-->
<div class="nofindvideo">
	<div class="nokc">
		<p>该课程正在紧锣密鼓的准备中，敬请期待~</p >
		<span class="notvideo-close">好，继续浏览其他课程</span>
	</div>
</div>
	
</body>
</html>
<!--<script src="https://code.jquery.com/jquery.js"></script>-->
<script type="text/javascript" src="jscript/jquery-2.0.3.js"></script>
<!--<script type="text/javascript" src="jscript/jquery.lazyload.min.js"></script>-->
<script type="text/javascript" src="jscript/bootstrap.min.js"></script>
<script type="text/javascript" src="jscript/jquery.cookie.js"></script>
<script type="text/javascript" src="jscript/moment.min.js"></script>
<script type="text/javascript" src="jscript/moment.zh-cn.js"></script>
<script type="text/javascript" src="jscript/ion.calendar.min.js"></script>
<script type="text/javascript" src="js/home.js"></script>
<script type="text/javascript" src="js/public.js"></script>
<script type="text/javascript" src="js/kc_public.js"></script>
<script type="text/javascript" src="js/login-public.js"></script>
<script type="text/javascript" src="jscript/area.js"></script>
<script>
//关闭没有视频的弹窗
$('.notvideo-close').click(function(){
		$(this).parent().parent().hide();
		$('.login-mask').hide();
	});

	//底部  查看更多课程 的点击效果
	$('#cksy').on('click', function() {
		if ($(".topmenu").attr('data-onoff') == 'false') {
			$(".topmenu").attr('data-onoff', 'true');
			$('.topmenu').show();
		} else {
			$(".topmenu").attr('data-onoff', 'false');
			$('.topmenu').hide();
		}
	});
	//日期调用
$('.date').each(function(){
	$(this).ionDatePicker({
		lang: 'zh-cn',
		format: 'YYYY-MM-DD'
	});
	
});
//三级联动 城市
var Gid  = document.getElementById ;
var showArea = function(){
	Gid('show').innerHTML = "<h3>省" + Gid('s_province').value + " - 市" + 	

	Gid('s_city').value + " - 县/区" + 

	Gid('s_county').value + "</h3>"
}
//Gid('s_county').setAttribute('onchange','showArea()');
</script>