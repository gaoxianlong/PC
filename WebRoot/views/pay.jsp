<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<meta http-equiv="content-type" content="text/htm" charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta mame="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="keywords" content="shoutike" />
<meta name="description" content="shoutike" />
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" href="<%=path %>/content/bootstrap.min.css" />
<link rel="stylesheet" href="<%=path %>/css/public.css" /> 
<link rel="stylesheet" type="text/css" href="<%=path %>/css/orders.css"/>
</head>
<body>
<div class="wrap">
	<!--顶部-->
	<div class="navheader clearfix">
		<div class="header clearfix">
			<!--logo-->
			<div class="logo">
				<a href="<%=path%>/getmenuindex" class="navbar-brand" style="padding-top: 10px;"><img src="<%=path%>/img/icon/logo-xin.png" style="width:120px;height： 30px;" /></a>
			</div>
			<div class="stk-menu">
				<div class="head-menu">
					<a href="<%=path%>/getmenuindex">首页</a>
				</div>
			</div>
			<!--扶贫入口-->
			<div class="fplogo" style="margin-top: 7px;">
				<a href="<%=path%>/getFpMulu" class="navbar-brand" target="_blank"></a>
			</div>
			<!--登录注册-->
			<ul class="nav-login">
				<li class="nav-dlzc"><a href="javascript:;" style="color: #fff;"></a></li>
				
				<c:if test="${!empty u.headUrl}">
					<li><a href="<%=path%>/views/personal.jsp"><img alt="" src="${u.headUrl}" style="width: 40px;height: 40px;border-radius: 50%;-webkit-border-radius: 50%;"></a></li>
					<li><a href="${pageContext.request.contextPath}/loginSession">退出</a></li>
				</c:if>
				<c:if test="${!empty u.telephone&&!empty u.nickName&&empty u.headUrl}">				
					<li ><a href="<%=path%>/views/personal.jsp"  >${u.nickName}</a></li>
					<li  ><a href="${pageContext.request.contextPath}/loginSession"  >退出</a></li>
				</c:if>		
				<c:if test="${!empty u.telephone&&empty u.nickName&&empty u.headUrl}">				
					<li  ><a href="<%=path%>/views/personal.jsp" >${u.telephone}</a></li>				
					<li ><a href="${pageContext.request.contextPath}/loginSession">退出</a></li>
				</c:if> 
			</ul>
		</div>
	</div>
	<div class="wrapper">
		<div class="shopping-title">
			<div class="title-con">
				<div class="myshopping">
					<h1>订单支付</h1>
				</div>
			</div>
		</div>
		<div class="shopping-con">
			<div class="mykc">
				<div class="table">
					<div class="table-box">
						<h4>订单号: ${ordernum}</h4>	
						<ul class="orders-list">
							<li class="list-con">
								<div class="list_img">
		                        	<a href="javascript:;"><img src="cover/${series.picURL }" alt="" width="128" height="80" style="border-radius:5px;-webkit-border-radius: 5px;"></a>
		                        </div>
		                        <div class="list_text">
		                        	<a href="javascript:;">${series.title}</a>
		                        </div>
							</li>
							<li class="list_sum">
		                        <p class="sum_price">￥${series.realPrice}</p>
		                    </li>	
						</ul>	
					</div>
					<!--底部 价钱-->
					<div class="bar-wrapper">
						<div class="bar-top zf">
							<div class="jxj-choice">
								<div class="choice-zf zf-active">
									<img src="<%=path %>/img/icon/wxzficon.png"/>
								</div>
								<!--<div class="choice-zf">支付宝支付</div>-->
							</div>
						</div>
			            <div class="bar-right">
			                <div class="nowMoney clearfix">
			                	<div class="totalMoney">总计金额: <strong class="total_text" id="lastMoney">￥${series.realPrice}</strong></div>
			                    <div class="calBtn">
			                    <a href="<%=path %>/104-orde-${series.ID}-${series.realPrice}-${ordernum}" >立即支付</a>
			                     <!-- 
			                    <a href="" >立即支付</a> -->
			                    </div>
			                </div>
			            </div>
			        </div>
				</div>
			</div>
		</div>
	</div>
	<!--footer-->
	<div class="footer">
		<div class="content">
			<div class="con footer-con">
				<div class="section">
					<div class="footer_left">
						<a href="<%=path%>/views/about/about.jsp">关于我们</a>
						<a href="<%=path%>/views/about/cooperation.jsp">联系我们</a>
						<a href="<%=path%>/views/about/propaganda.jsp">产品宣传片</a>
					</div>
					<div class="footer_right">	
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
<script src="<%=path %>/jscript/jquery-2.0.3.js"></script>
<script type="text/javascript" src="<%=path %>/js/public.js"></script>
<script type="text/javascript">
	//支付页面点击立即支付
	$('.jxj-choice .choice-zf').on('click',function(){
		$('.jxj-choice .choice-zf').removeClass('zf-active');
		$(this).addClass('zf-active');
	});
	$('.calBtn a').on('click',function(){
		
		//if($('.zf-active').html() == '微信支付'){
			//alert('微信支付');
			//return;
			$(this).href('');
		//}else{
			//alert('支付宝支付');
		//	return;
		//	$(this).href('');
		//}	
	});
	
	function a(){
	var b=true;
	return b;
}
console.log(a());
</script>