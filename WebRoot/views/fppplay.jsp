<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
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
<link rel="stylesheet" href="<%=path%>/content/bootstrap.min.css" />
<link rel="stylesheet" href="<%=path%>/css/public.css" /> 
<link rel="stylesheet" href="<%=path%>/css/play.css" />

<script type="text/javascript">
	function getComment(){
		var content=$("#content").val();
		$("#formid").submit(
		$.ajax({
				   url:"addComment.action?uid=${u.ID}&vid=${playing}&uname=${u.nickName}",
	                type:"post",
	                data:{content:content},
	                
	                success:function(flag){
	                    if(flag.length>5){
				document.getElementById("content").value = "";
	                    	$.post("selectComment.action?vid=${playing}&uid=${u.ID}",
	                    			"",function(date){
	                    		$("#div1").html("");
	             
	                    		var json=eval(date);
	                    		
	                    			var item='';
	                    			$.each(json,function(index,ele){ 
	                    				
	                    				item+="<dl><dt><span><img alt='' src='"+json[index].headUrl+"' style='width: 50px;height: 50px;border-radius: 50%;-webkit-border-radius: 50%;'></span></dt><dd><input type='text' hidden='hidden' id='cid' value='"+json[index].id+"'/><h5>"+json[index].nickName+"</h5><div class='kcpl-item'><p>"+json[index].content+"</p><div class='kcpl-item-xq'><div class='time'>"+json[index].addtimes+"</div><div class='item-thumbs-up'><span class='pldz' data-btn='"+json[index].zan+"' id='"+json[index].id+"' ></span><span class='num' >"+json[index].numzan+"</span></div></div></div></dd></dl>";
	                    				
	                    			});
	                    			$("#div1").html(item);
	                    	});
	                    };
	                },
	                error:function(e){
	                    alert("错误！！");
	                   
	                }
			})      	
		);
	}
</script>
</head>
<body>
<div class="wrap" style="background: #efefef;">
	<!--顶部-->
	<div class="navheader clearfix">
		<div class="header clearfix">
			<!--logo-->
			<div class="logo" style="margin-top: -3px;">
				<a href="getFpMulu" class="navbar-brand"><img src="<%=path%>/img/icon/logo-xin.png" style="width:120px;height： 50px;margin-top: -2px;" /></a>
			</div>
			<div class="stk-menu" style="width: 400px;">
				<div class="head-menu" style="width: 100%;color: #fff;">
					<span></span>
					<span></span>
				</div>
			</div>
                        <!--扶贫入口
			
	        <div class="fplogo" style="margin-top: 7px;">
				<a href=" " class="navbar-brand" target="_blank"></a>
			</div>-->
			<!--登录注册-->
			<ul class="nav-login">
				<li class="nav-dlzc"><a href="javascript:;" style="color: #fff;"></a></li>
				<c:if test="${empty u.ID}">
				<li class="nav-dlzc"><a href="javascript:;" target="_blank" style="color: #fff;">登录</a></li>
				<li class="nav-dlzc"><a href="javascript:;" target="_blank" style="color: #fff;">注册</a></li></c:if>
				<c:if test="${!empty u.headUrl}">
				<li><a href="views/personal.jsp"><img alt="" src="${u.headUrl}" style="width: 40px;height: 40px;border-radius: 50%;-webkit-border-radius: 50%;"></a></li>
				<li><a href="${pageContext.request.contextPath}/loginSession">退出</a></li></c:if>
				 <c:if test="${!empty u.telephone&&!empty u.nickName&&empty u.headUrl}">				
				<li ><a href="views/personal.jsp"  >${u.nickName}</a></li>
				<li  ><a href="${pageContext.request.contextPath}/loginSession"  >退出</a></li></c:if>		
				<c:if test="${!empty u.telephone&&empty u.nickName&&empty u.headUrl}">				
				<li  ><a href="views/personal.jsp" >${u.telephone}</a></li>				
				<li ><a href="${pageContext.request.contextPath}/loginSession">退出</a></li></c:if> 
			</ul>
		</div>
	</div>
	<div class="wrapper">
		<!--播放视频和列表-->
		<div class="play-main">
			<!--播放界面和点赞分享-->
			<div class="myplay">
				<div class="player">
					<div class="video">
						<!--极酷阳光播放器/代码开始-->
			            <div class="video2" id="CuPlayer">
			                <script>
			                    var vID = "";			                    var vWidth = "100%";            //播放器宽度设置
			                    var vHeight = "100%";               //播放器高度设置
			                    var vFile = "<%=path%>/jscript/v3/CuSunV3set.xml";
			                    var vPlayer = "<%=path%>/jscript/v3/player.swf?v=3.5";
			                    var vPic = "";//视频缩略图
			                    var vCssurl = "<%=path%>/content/wxcss/mini.css";
			                    var vMp4url = "http://oss.shoutike.com/${itemvo.videoURL}"; 
//                              var vMp4url = "C:\Users\Administrator\Desktop\demo\TWST.mp4";
			                </script>
			                <script class="CuPlayerVideo" data-mce-role="CuPlayerVideo" type="text/javascript" src="<%=path%>/jscript/v3/CuSunX1.min.js"></script>
					</div>
				<!--点赞收藏分享-->
					<div class="myfx">
						<div class="thumb-up">
						<input hidden="hidden" id="vid" value="${param.id}"/>
							<span class="pldz-vo cursor" data-btn="${flag}"></span>
							<span>${voZan}</span>
						</div>
						<div class="collent">
							<span class="pldz-coll cursor" data-btn="${flagColl}"></span>
							<span>${numColl}</span>
						</div>
						<!--  p class="buynow">立即购买</p>
						<p class="shopping">加入购物车</p>-->
					</div>
				</div>
			</div>
			<!--播放列表和笔记-->
			<div class="play-list">
				<div class="list-tabs">
					<ul style="overflow:hidden;">
						<li class="kc-zj"  style="padding:0 10px;width: auto;">${Title}</li>
					</ul>
				</div>
				<div class="play-box">
					<!--章节列表-->
					<div class="play-con">
						
						<ul id="playid">
							
							<c:forEach items="${lsvideo }" var="vo" varStatus="flag">
								<li  data-id="${playing }" value="${vo.ID }" name="playlist">
									<a href="ffpplay?seriesID=${vo.SID }&id=${vo.ID }" title="${vo.title}">${vo.title}</a>
										<c:forEach items="${playrecord }" var="ro">
											<c:if test="${ro.vid == vo.ID }">
											<i class="glyphicon glyphicon-ok-circle"></i>
											</c:if>
										</c:forEach>
								</li>    
							</c:forEach>							
							<input id="nextUrl" name="nextUrl" type="hidden" value="ffpplay?seriesID=${itemvo.SID}&id=${nextid }&oldid=${itemvo.ID}" />
							<c:forEach items="${videopay }" var="vo">
								<li class="notplaying" data-id="0" value="1">
									<a href="#" title="${vo.title}">${vo.title }</a><i></i>
								</li>
							</c:forEach>
						</ul>
				    </div>
				    <!--笔记-->
					
				</div>
			</div>
		</div>
	</div>
	    <!--课程详情和评论 提问-->
		<div class="play-kcjs clearfix">
		
			<!--左边内容部分-->
			<div class="play-left">
				<div class="left-tabs">
					<ul>
						<li class="kcsm" >课程评论</li>	
					</ul>
				</div>
				<div class="left-box">
					<!--课程评论-->
					<div class="left-con">
						<div class="left-kcpl">
							<!--发表评论-->
							<input type="text" hidden="hidden" value="${sessionScope.u.ID}" id="uid"/>
							<div class="kcpl-txts">
								<dl>
									<dt><span><img alt="" src="${u.headUrl}" style="width: 50px;height: 50px;border-radius: 50%;-webkit-border-radius: 50%;"></span></dt>
									<dd>
										<form action="" method="post" id="fromid">
											<textarea id="content" name="content" rows="" cols="" placeholder="我认为..."></textarea>
											<p><input type="button" value="发表评论" onclick="getComment();" style="background: #d21213;color: #fff;"/></p>
										</form>
									</dd>
								</dl>
							</div>
							<!--评论展示-->
							<div class="kcpl-con" id="div1">
							<c:forEach items="${comment}" var="c">
								<dl>
									<dt><span><img alt="" src="${c.headUrl}" style="width: 50px;height: 50px;border-radius: 50%;-webkit-border-radius: 50%;"></span></dt>
									<dd>
									<input type="text" hidden="hidden" id="cid" value="${c.id}"/>
										<c:if test="${empty c.nickName}">
										<h5>小手</h5> 
										</c:if>
										<c:if test="${!empty c.nickName}">
										<h5>${c.nickName}</h5>
										</c:if>
										<div class="kcpl-item">
											<p>${c.content}</p>
											<div class="kcpl-item-xq">
												<div class="time">${c.addtimes}</div>
												<div class="item-thumbs-up">
													<span class="pldz" data-btn="${c.zan}" id="${c.id}" ></span>
													<span class="num" >${c.numzan}</span>
													
												</div>
											</div>
										</div>
									</dd>
								</dl>
								</c:forEach>
							</div>
						    <!--分页器-->
						</div>
					</div>
				</div>
			</div>
			<!--右边内容部分-->
		</div>
	</div>
	<!--底部-->
    <div class="footer">
		<div class="content">
			<div class="con footer-con" style="width: 1200px;padding-top: 18px;">
				<div class="section">
					<div class="footer_left">
						<a href="<%=path %>/about.jsp">关于我们</a>
						<a href="<%=path %>/cooperation.jsp">联系我们</a>
						<a href="<%=path %>/propaganda.jsp">产品宣传片</a>	
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
<!--登录注册页面-->
<div class="login">
	<div class="login-header">
		<div class="login-tab">
			<span class="active-title">登录</span>
			<span>注册</span>
		</div>
		<button class="btn-close">x</button>
	</div>
	<!--登录-->
	<div class="login-con logreg-active">
		<form action="" method="post">
			<div class="call">
				<input type="text" placeholder="请输入登录手机号" />
				<p></p>
			</div>
			<div class="pass">
				<input type="text" placeholder="6-16位密码，区分大小写，不能用空格" />
				<p></p>
			</div>
			<div class="forget"><span>忘记密码</span></div>
			<input type="submit" value="登录"/>
		</form>
	</div>
	<!--注册-->
	<div class="login-con">
		<form action="" method="post">
			<div class="call">
				<input type="text" placeholder="请输入注册手机号" />
				<p></p>
			</div>
			<div class="yzm">
				<input type="text" placeholder="请输入验证码" />
				<button class="yzm-btn">获取验证码</button>
			</div>
			<div class="pass">
				<input type="text" placeholder="请设置登录密码，区分大小写，不能用空格" />
				<p></p>
			</div>
			<div class="stk-tk">
				<span>√</span>
				<span>我已阅读并接受《手提课协议条款》</span>
			</div>
			<input type="submit" value="注册" id="zc-btn" />
		</form>
	</div>
</div>
<!--完善资料-->
<div class="register-next">
	<div class="reg-head">注册成功！请完善资料！</div>
	<div class="reg-con">
		<form action="">
			<div class="nickname">
				<input type="text" placeholder="昵称" />
				<p></p>
			</div>
			<div class="name">
				<input type="text" placeholder="真实姓名" />
				<p></p>
			</div>
			<div class="sex">
				<select name="性别" placeholder="性别">
					<option value="性别">性别</option>
					<option value="男">男</option>
					<option value="女">女</option>
				</select>
			</div>
			<div class="birthday">
				
			</div>
			<div class="seat">
				
			</div>
			<div class="grade">
				
			</div>
			<div class="student">
				
			</div>
			<div class="fpyhm">
				
			</div>
			<div class="tjzl">
				<input type="submit" value="提交资料" id="tjzl" />
			    <span>跳过</span>
			</div>
			<b>完善资料即可获赠10元奖学金，奖学金可用来购买课程</b>
		</form>
	</div>
</div>
<div class="login-mask"></div>
</body>
</html>
	<script type="text/javascript">
							 function getNext(pars) {
            var url = $("#nextUrl").val();
            
            
            console.log(url);
            if (url == undefined || url == "") {
                return false;
            }
            window.location = url;
        }
							</script>
<script type="text/javascript" src="<%=path%>/jscript/jquery-2.0.3.js"></script>
<script type="text/javascript" src="<%=path%>/jscript/page.js"></script>
<script type="text/javascript" src="<%=path%>/js/public.js"></script>
<script type="text/javascript" src="<%=path%>/js/play.js"></script>
<script type="text/javascript">
$('#playid li').each(function(){
	if($(this).attr('data-id') == $(this).attr('value')){
		
		$(this).addClass('playering');
	}
	
});


$('#CuPlayerVideo_video').height('512px');
	//分页效果
    function tt(dd){
          
    }
//  maxshowpageitem ：最多显示的页码数字，必需写 。     pagelistcount:每一个页面显示的数据的个数，必需写。      id:不用解释了吧，必需。三、初始化分页
    var GG = {
        "kk":function(mm){
            
              console.log("hellos");
//            window.location.href="test.html?page="+mm;
        }
    }
    //调用分页的方法 参数 （3个参数） 第一个 所有数据条数  第二个默认第一页  第三个调用GG的kk方法 回调函数 进入第几页面
    $("#page").initPage(100,1,GG.kk);
    /*$("#page1").initPage(100,1,GG.kk);*/
   
    $("#page2").initPage(60,1,GG.kk);
    
    $("#page3").initPage(40,1,GG.kk);
   
</script>