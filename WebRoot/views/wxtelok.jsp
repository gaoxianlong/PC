<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>手提课-活到老学到老</title>
<meta http-equiv="content-type" content="text/htm" charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta mame="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="keywords" content="2017考研,四六级考试,思维导图,学前,公务员考试,小学,初中,高中,考研专业课,考研公共课,高考,微商,中考,艺考,托福考试,雅思考试,法语口语" />
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="<%=path%>/css/public.css" />
<style type="text/css">
	html,body{
		width: 100%;
		height: 100%;
	}
	.wrap{
		height: 100%;
		margin: 0;
		padding-top: 100px;
	}
	.wxtelok{
		width: 372px;
		height: 500px;
		margin: 0 auto;
	}
	.wxtelok .wxdl_title{
		width: 100%;
	    height: 400px;
	    padding-top: 300px;
	    background: url(<%=path%>/img/wxtelok.png) no-repeat center 10px;
	}
	.wxtelok .wxdl_title .title_top{
		width: 100px;
	    height: 24px;
	    margin: 0 auto;
	    margin-bottom: 5px;
	}
	.wxtelok .wxdl_title .title_top i{
		float: left;
		width: 26px;
		height: 24px;
		background: url(<%=path%>/img/icon/wxicon.png) no-repeat center;
		margin-right: 5px;
	}
	.wxtelok .wxdl_title .title_top span{
		float: left;
		height: 24px;
		line-height: 24px;
		color: #4aa71e;
	}
	.wxtelok .wxdl_title .title_text{
		width: 100%;
	    height: 24px;
	    line-height: 24px;
	    text-align: center;
	    font-size: 14px;
	    font-weight: normal;
	}
</style>
</head>
<body>
<div class="wrap">
	<div class="wxtelok">
		<div class="wxdl_title">
			<div class="title_top"><i></i><span>绑定成功！</span></div>
			<h5 class="title_text"><b style="color: #d21213;">5</b>s后自动跳回首页</h5>
		</div>
		
	</div>
</div>
</body>
</html>
<script type="text/javascript" src="<%=path%>/jscript/jquery-2.0.3.js" ></script>
<script type="text/javascript">
var jssec = 5;
changes();
function changes() {
	$('.title_text b').html(jssec);
	//如果过了3秒后 按钮的disabled为 true  即可再点 否则 为false 不能再点 然后移出输入验证码栏的 disabled 可以输入
    jssec--;
    if (jssec > -1) {
        timer = setTimeout('changes()', 1000);//调用自身实现
    }
    else {
        window.location.href = '<%=path%>/getmenuindex';
        clearTimeout(timer);
        
    }
}

</script>
