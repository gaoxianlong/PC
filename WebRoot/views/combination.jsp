<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
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
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" href="../content/bootstrap.min.css" />
<link rel="stylesheet" href="../css/public.css" /> 
<link rel="stylesheet" type="text/css" href="../css/combination.css" />
</head>
<body>
<div class="wrap">
	<!--顶部-->
	<div class="navheader clearfix">
		<div class="header clearfix">
			<!--logo-->
			<div class="logo" style="margin-top: -3px;">
				<a href="#" class="navbar-brand"><img src="../img/icon/logo-xin.png" style="width:120px;height： 50px;margin-top: -2px;" /></a>
			</div>
			<div class="stk-menu">
				<div class="head-menu">
					<a href="javascript:;">首页</a>
				</div>
				<div id="mymenu">
					<a href="javascript:;" id="menu-kc">课程 <span class="glyphicon glyphicon-menu-down" style="font-size: 12px;"></span></a>
				    <!--菜单栏-->
					<div class="topmenu">
						<div class="allmenu">
							<ul>
								<li class="menunav">
									<h5>
										<a href="views/subpage.html" target="_blank"><span class="glyphicon glyphicon-user"></span > 学前</a>
									</h5>
									<div class="listmenu" style="display: block">
										<dl>
											<dt><a href="views/subpage.html" target="_blank">国学</a></dt>
											<dd>
												<em><a href="javascript:;">课程课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
											</dd>
										</dl>
										<dl>
											<dt><a href="javascript:;">英语</a></dt>
											<dd>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础基础</a></em>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础</a></em>
											</dd>
										</dl>
										<dl>
											<dt><a href="javascript:;">绘画</a></dt>
											<dd>
												<em><a href="javascript:;">素描</a></em>
												<em><a href="javascript:;">素描</a></em>
												<em><a href="javascript:;">素描</a></em>
												<em><a href="javascript:;">人物</a></em>
												<em><a href="javascript:;">素描</a></em>
												<em><a href="javascript:;">素描素描</a></em>
												<em><a href="javascript:;">素描</a></em>
												<em><a href="javascript:;">素描素描</a></em>
											</dd>
										</dl>
										<dl>
											<dt><a href="javascript:;">儿歌</a></dt>
											<dd>
												<em><a href="javascript:;">三百首</a></em>
												<em><a href="javascript:;">唐诗</a></em>
												<em><a href="javascript:;">七律</a></em>
												<em><a href="javascript:;">绝句</a></em>
												<em><a href="javascript:;">儿歌</a></em>
												<em><a href="javascript:;">儿歌</a></em>
											</dd>
										</dl>
										
									</div>
								</li>
								<li class="menunav">
									<h5>
										<a href="views/subpage.html" target="_blank"><span class="glyphicon glyphicon-tower"></span> 小学</a>
									</h5>
									<div class="listmenu">
										<dl>
											<dt><a href="javascript:;">语文</a></dt>
											<dd>
												<em><a href="javascript:;">课程课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
											</dd>
										</dl>
										<dl>
											<dt><a href="javascript:;">英语</a></dt>
											<dd>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础基础</a></em>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础</a></em>
											</dd>
										</dl>
										<dl>
											<dt><a href="javascript:;">数学</a></dt>
											<dd>
												<em><a href="javascript:;">课程课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
											</dd>
										</dl>
									</div>
								</li>
								<li class="menunav">
									<h5>
										<a href="views/subpage.html" target="_blank"><span class="glyphicon glyphicon-baby-formula"></span> 初中</a>
									</h5>
									<div class="listmenu">
										<dl>
											<dt><a href="javascript:;">初一</a></dt>
											<dd>
												<em><a href="javascript:;">课程课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
											</dd>
										</dl>
										<dl>
											<dt><a href="javascript:;">初二</a></dt>
											<dd>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础基础</a></em>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础</a></em>
											</dd>
										</dl>
									</div>
								</li>
								<li class="menunav">
									<h5>
										<a href="views/subpage.html"><span class="glyphicon glyphicon-erase"></span> 高中</a>
									</h5>
									<div class="listmenu">
										<dl>
											<dt><a href="javascript:;">高一</a></dt>
											<dd>
												<em><a href="javascript:;">课程课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
											</dd>
										</dl>
										<dl>
											<dt><a href="javascript:;">高二</a></dt>
											<dd>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础基础</a></em>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础</a></em>
											</dd>
										</dl>
										<dl>
											<dt><a href="javascript:;">高考</a></dt>
											<dd>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础基础</a></em>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础</a></em>
												
											</dd>
										</dl>
									</div>
								</li>
								<li class="menunav">
									<h5>
										<a href="views/subpage.html"><span class="glyphicon glyphicon-education"></span> 考研</a>
									</h5>
									<div class="listmenu">
										<dl>
											<dt><a href="javascript:;">公共课</a></dt>
											<dd>
												<em><a href="javascript:;">课程课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
											</dd>
										</dl>
										<dl>
											<dt><a href="javascript:;">基础课</a></dt>
											<dd>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础基础</a></em>
												<em><a href="javascript:;">基础</a></em>
												
											</dd>
										</dl>
									</div>
								</li>
								<li class="menunav">
									<h5>
										<a href="views/subpage.html"><span class="glyphicon glyphicon-bishop"></span> 多语种</a>
									</h5>
									<div class="listmenu">
										<dl>
											<dt><a href="javascript:;">法语</a></dt>
											<dd>
												<em><a href="javascript:;">课程课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												<em><a href="javascript:;">课程</a></em>
												
											</dd>
										</dl>
										<dl>
											<dt><a href="javascript:;">韩语</a></dt>
											<dd>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础基础</a></em>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础</a></em>
												<em><a href="javascript:;">基础</a></em>
											</dd>
										</dl>
									</div>
								</li>
							</ul>
						</div>
					</div>
			    </div>
			</div>
			<!--搜索-->
			<form action="" class="navbar-form navbar-left" id="my-form">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="search" style="width: 320px;" />
				    <span class="input-group-addon"><a href="javascript:;"><span class="glyphicon glyphicon-search"></span></a></span>
				</div>
			</form>
			<!--登录注册-->
			<ul class="nav-login">
				<li><a href="views/shopping.html" target="_blank">购物车</a></li>
				<li class="nav-dlzc"><a href="javascript:;">登录</a></li>
				<li class="nav-dlzc"><a href="javascript:;">注册</a></li>
			</ul>
		</div>
	</div>
    <!--内容-->
    <div class="wrapper">
    	<div class="banner-con">
    		<div class="banner">
    			<div class="banner-title">
    				<h1>西医综合导学+政治+英语组合包</h1>
    				<p>西医综合导学+政治+英语组合包西医综合导学+政治+英语组合包西医综合导学+政治+英语组合包西医综合导学+政治+英语组合包</p>
    			</div>
    			<div class="pic">
    				<div class="oldpic">
    					<p>￥99.90</p>
    					<span>原价￥119.90</span>
    				</div>
    				<div class="pic-btn">
    					<a href="shopping.html" target="_blank">
    						<span>购买组合课程</span>
    					    <span class="glyphicon glyphicon-shopping-cart"></span>
    					</a>
    				</div>
    			</div>
    		</div>
    	</div>
        
        <div class="banner-nav">
        	<nav>
        		<a href="javascript:;">西医综合导学</a>
        		<a href="javascript:;">考研政治基础巩固与提高</a>
        		<a href="javascript:;">考研英语全系列</a>
        	</nav>
        </div>
        
        <div class="zhkc-wrap">
        	<div class="zhkc-classify">
        		<h2>考研专业课</h2>
        		<dl>
        			<dt><a href="javascript:;"><img src=""/></a></dt>
        			<dd>
        				<h5>西医综合导学</h5>
        				<b>宁莉莉</b>
        				<p>西医综合导学西医综合导学西医综合导学西医综综合导学学西医综综合导学西医综合导学西医综合导学西医综合导学西医综合导</p>
        				<div class="price">
        					<div class="price-old">
        						<span>￥43.30</span>
        						<span>原价 ￥49.90</span>
        					</div>
        					<div class="price-tryplay"><a href="play.html" target="_blank">免费试看</a></div>
        				</div>
        			</dd>
        		</dl>
        	</div>
        </div>
        
        <div class="zhkc-wrap">
        	<div class="zhkc-classify">
        		<h2>考研公共课</h2>
        		<dl>
        			<dt><a href="javascript:;"><img src=""/></a></dt>
        			<dd>
        				<h5>西医综合导学</h5>
        				<b>宁莉莉</b>
        				<p>西医综合导学西医综合导学西医综合导学西医综综合导学学西医综综合导学西医综合导学西医综合导学西医综合导学西医综合导</p>
        				<div class="price">
        					<div class="price-old">
        						<span>￥43.30</span>
        						<span>原价 ￥49.90</span>
        					</div>
        					<div class="price-tryplay"><a href="play.html" target="_blank">免费试看</a></div>
        				</div>
        			</dd>
        		</dl>
        		<dl>
        			<dt><a href="javascript:;"><img src=""/></a></dt>
        			<dd>
        				<h5>西医综合导学</h5>
        				<b>宁莉莉</b>
        				<p>西医综合导学西医综合导学西医综合导学西医综综合导学学西医综综合导学西医综合导学西医综合导学西医综合导学西医综合导</p>
        				<div class="price">
        					<div class="price-old">
        						<span>￥43.30</span>
        						<span>原价 ￥49.90</span>
        					</div>
        					<div class="price-tryplay"><a href="javascript:;">免费试看</a></div>
        				</div>
        			</dd>
        		</dl>
        	</div>
        </div>
    </div>
    <!--footer-->
	<div class="footer">
		<div class="content">
			<div class="con footer-con">
				<div class="section">
					<div class="footer_left">
						<a href="javascript:;">关于我们</a>
						<a href="javascript:;">媒体报道</a>
						<a href="javascript:;">商务合作</a>
						<a href="javascript:;">加入我们</a>
						<a href="javascript:;">常见问题</a>
						<a href="javascript:;">意见反馈</a>
					</div>
					<div class="footer_right">
						<a href="javascript:;">sub</a>
						<a href="javascript:;">sub</a>
						
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
<script src="../jscript/jquery-2.0.3.js"></script>
<script type="text/javascript" src="../js/public.js"></script>