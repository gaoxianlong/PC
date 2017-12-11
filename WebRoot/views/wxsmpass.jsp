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
<title></title>
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
<link rel="stylesheet" type="text/css" href="<%=path%>/css/wxsmdl.css"/>
</head>
<body>
<div class="wrap">
	<div class="wxdlcall">
		<div class="wxdl_title">
			<div class="title_top"><i></i><span>验证成功！</span></div>
			<h5 class="title_text">尊敬的用户，请设置您的密码</h5>
		</div>
		<div class="wxdl_con">
			<div class="floatleft">
				<div class="left_title"><i></i><span>微信登录</span></div>
				<div class="wximg">
					<div class="imgicon">
						<img src="${wxuser.headUrl}"/>
					</div>
					<p class="wxnkname">${wxuser.nickName}</p>
				</div>
			</div>
			<div class="floatright">
				<h6><i></i><span>手提课账号</span></h6>
				<div class="form" style="padding-top: 50px;">
					<form action="<%=path%>/updateWxPassWord" method="post" id="wxpass-form">
						<div class="wxtel">
							<input type="text" name="passWord" id="myPass" value="" class="tel" placeholder="请设置密码(8-16位数字字母组合,区分大小写)" />
						    <p class="error1"></p>
						</div>
						<input type="submit" value="完成" class="tel_submit" id="" />
						
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
<script type="text/javascript" src="<%=path%>/jscript/jquery-2.0.3.js" ></script>
<script type="text/javascript">
	
$('#myPass').focus(function(){
	$('.error1').html('');
	$('.error1').hide();
});
$('#myPass').blur(function(){
	checkPass($(this));
});

$('#wxpass-form').submit(function(e){
	if(!checkPass($('#myPass'))){
		return false;
		e.preventDefault();
	}
});

//密码验证
function checkPass(obj){
	reg1 = /^.*[\d]+.*$/;
    reg2 = /^.*[A-Za-z]+.*$/;
    reg3 = /^.*[_@#%&^+-/*\/\\]+.*$/;//验证密码
    var Pval = obj.val();
    
    if (Pval == '') {
        $(".error1").html("请填写密码");
        $(".error1").show();
    }
    else if (Pval.length > 16 || Pval.length < 8) {
        $(".error1").html("密码应为8-16个字符，区分大小写");
        $(".error1").show();
    }
	else if (!((reg1.test(Pval) && reg2.test(Pval)) || (reg1.test(Pval) && reg3.test(Pval)) || (reg2.test(Pval) && reg3.test(Pval)))) {
	   
	    $(".error1").html("需至少包含数字、字母和符号中的两种类型");
	    $(".error1").show();
	}
    else {
       
        return true;
    }
    return false;
}


</script>
