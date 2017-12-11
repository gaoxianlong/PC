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
<link rel="shortcut icon" href="<%=path%>/icon/favicon.ico">
<link rel="Bookmark" href="<%=path%>/icon/favicon.ico">
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="../../content/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="../../css/public.css" /> 

<link rel="stylesheet" type="text/css" href="../../css/about/cooperation.css" />
</head>
<body>
<div class="wrap">
	<!--顶部-->
	<div class="navheader clearfix">
		<div class="header clearfix">
			<!--logo-->
			<div class="logo" style="margin-top: -3px;">
				<a href="<%=path %>/getmenuindex" class="navbar-brand"><img src="../../img/icon/logo-xin.png" style="width:120px;height： 50px;margin-top: -2px;" /></a>
			</div>
			<div class="stk-menu">
				<div class="head-menu">
				
					<a href="about.jsp">关于我们</a>
					<!--<a href="cooperation.html">媒体报道</a>-->
					<a href="cooperation.jsp">联系我们</a>
					<!--<a href="javascript:;">加入我们</a>-->
					<!--<a href="javascript:;">意见反馈</a>-->
					<a href="propaganda.jsp">产品宣传片</a>
				</div>
			</div>
			
		</div>
	</div>
    <!--con-->
	<div class="wrapper">
		<div class="about-top">
			<div class="top-banner">
				
			</div>
		</div>
		<div class="coo-con">
			<div class="coo-main">
				<ul>
					<li>
						<div class="floatleft">
							<h5 style="margin-bottom: 0px;">校方合作</h5>
							<h6>若校方想开通互联网+教育扶贫专题板块，或获取免费学习验证码，请与我们联系。</h6>
							<p>
								<span>联系人：张老师</span>
								<span>电话：010-62422719</span>
								<span>邮箱：zhangzhou@shoutike.com</span>
							</p>
						</div>
						<div class="floatright">
							<p><img src="../../img/icon/zhangzhou.jpg" alt="" width="100" height="100" /></p>
						</div>
					</li>
					<li>
						<div class="floatleft">
							<h5 style="margin-bottom: 0px;">校方合作</h5>
							<h6>若校方想开通互联网+教育扶贫专题板块，或获取免费学习验证码，请与我们联系。</h6>
							<p>
								<span>联系人：张老师</span>
								<span>电话：010-62422719</span>
								<span>邮箱：zhangruoyun@shoutike.com</span>
							</p>
						</div>
						<div class="floatright">
							<p><img src="../../img/icon/ruoyun.jpg" alt="" width="100" height="100" /></p>
						</div>
					</li>
					<li>
						<div class="floatleft">
							<h5 style="margin-bottom: 0px;">校方合作</h5>
							<h6>若校方想开通互联网+教育扶贫专题板块，或获取免费学习验证码，请与我们联系。</h6>
							<p>
								<span>联系人：叶老师</span>
								<span>电话：010-62422719</span>
								<span>邮箱：yezi@shoutike.com</span>
							</p>
						</div>
						<div class="floatright">
							<p><img src="../../img/icon/yezi.jpg" alt="" width="100" height="100" /></p>
						</div>
					</li>
					<li>
						<div class="floatleft">
							<h5>商务合作</h5>
							<p>
								<span>联系人：张老师</span>
								<span>电话：010-62422719</span>
								<span>邮箱：zhangzhou@shoutike.com</span>
							</p>
						</div>
						<div class="floatright">
							<p><img src="../../img/icon/zhangzhou.jpg" alt="" width="100" height="100" /></p>
						</div>
					</li>
					<li>
						<div class="floatleft">
							<h5>媒体采访</h5>
							<p>
								<span>联系人：罗老师</span>
								<span>电话：010-62422719</span>
								<span>邮箱：luojiutian@shoutike.com</span>
							</p>
						</div>
						<div class="floatright">
							<p><img src="../../img/icon/luo.jpg" alt="" width="100" height="100" /></p>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
    <!--footer-->
	<div class="footer">
		<div class="content">
			<div class="con footer-con" style="width: 1120px;padding: 0;padding-top: 18px;">
				<div class="section">
					<div class="footer_left">
						<a href="about.jsp">关于我们</a>
						<!--<a href="javascript:;">媒体报道</a>-->
						<a href="cooperation.jsp">联系我们</a>
						<!--<a href="javascript:;">加入我们</a>
						<a href="javascript:;">常见问题</a>-->
						<a href="propaganda.jsp">产品宣传片</a>
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
<script type="text/javascript" src="../../jscript/jquery-2.0.3.js"></script>

<script type="text/javascript" src="../../js/public.js"></script>
<script type="text/javascript" src="../../js/login-public.js"></script>
<script type="text/javascript">
	
</script>