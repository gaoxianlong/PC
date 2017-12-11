<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link rel="stylesheet" type="text/css" href="<%=path %>/content/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/content/ion.calendar.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/public.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/personal.css" />
<script type="text/javascript">

	//直接加载播放记录
	function getplay(){
		
		$.post("${pageContext.request.contextPath}/selectPlay?startpage=1","",
				function(date){
			var json=eval(date);
			
			var item='';
			
			$.each(json,function(index,ele){ 
				
				item+="<li class='myrecords'><div class='records-img'><img src='../cover/"+json[index].picURL+"' width='200' height='124' /></div><div class='records-texts'><div class='records-title'><h2>"+json[index].title+"</h2></div><div class='records-now'>已学习到第"+json[index].sort+"集</div><div class='cursor golearn-btn toplay-btn' onclick='fromplay(this);' value='"+json[index].id+"'send='"+json[index].vid+"'>继续学习</div><p>上次学习时间：<span>"+json[index].addtimes+"</span></p></div></li>";
				
			});
			 
			
			$("#ol1").html(item);
			});
	}
	//点击加载收藏记录
	function getCollect(){
		$.post("${pageContext.request.contextPath}/selectColl.action","",
				function(date){
			var json=eval(date);
			
			var item='';
			
			$.each(json,function(index,ele){ 
				
item+="<li class='myrecords'><div class='records-img'><img src='../cover/"+json[index].picURL+"' width='200' height='124' /></div><div class='records-texts'><div class='records-title'><h2>"+json[index].title+"</h2><span class='glyphicon glyphicon-trash' id='close' onclick='deleteColl(this);' value='"+json[index].uid+"'send='"+json[index].vid+"'></span></div><div class='records-now'></div><div class='cursor golearn-btn' onclick='fromplay(this);' value='"+json[index].id+"'send='"+json[index].vid+"'>继续学习</div><p class='colect'>上次学习时间：<span>"+json[index].addtimes+"</span></p></div></li>";				
			});
			$("#il1").html(item);
			});
	}
	//点击继续学习进入播放页面fromplay();
function fromplay(obj){
	var SID=$(obj).attr("value");
	var id=$(obj).attr("send");
					 $.ajax({  
						 
						 url:"${pageContext.request.contextPath}/selectID?sid="+SID,
				           type: "POST",  
				           success:function(data){  
				        	   //alert(data);
				        	   if(data==true){
				        		   $.post("${pageContext.request.contextPath}/selectHelpCode?uid="+${u.ID},"",function(date){
				        			  //alert(date+"444");
				        			   if(date==true){
				        			    window.location.href = "${pageContext.request.contextPath}/ffpplay?seriesID="+SID+"&id="+id;

					        	   }else{
					                 window.location.href = "${pageContext.request.contextPath}/play?seriesID="+SID+"&id="+id;
					        	   }  
				        		   });
				        	   }else{
					                 window.location.href = "${pageContext.request.contextPath}/play?seriesID="+SID+"&id="+id;

				        	   }
				        	   }  
				    });
					
				}
	//删除收藏记录
	function deleteColl(obj){
		var uid=$(obj).attr("value");
		var vid=$(obj).attr("send");
						 $.ajax({  
							 url:"${pageContext.request.contextPath}/deleteCollect?uid="+uid+"&vid="+vid,
					           type: "POST",  
					           success:function(data){  
					        	   getCollect();
					              }  
					    });
	}
	
	
		
	//退出
	function cookies(){
			$.cookie("password-stk", "", { expires: 0});

	}
</script>
</head>
<body onload="getplay();">
<div class="wrap"  >
	<!--顶部-->
	<div class="navheader clearfix">
		<div class="header clearfix" >
			<!--logo-->
			<div class="logo" style="margin-top: -3px;">
				<a href="<%=path%>/getmenuindex" class="navbar-brand"><img src="../img/icon/logo-xin.png" style="width:120px;height： 50px;margin-top: -2px;" /></a>
			</div>
			<div class="stk-menu">
			
				<div class="head-menu">
					<a href="<%=path%>/getmenuindex">首页</a>
				</div>
				
			</div>
                        <!--扶贫入口-->
			
                        <div class="fplogo" style="margin-top: 7px;">

				<a href="${pageContext.request.contextPath}/getFpMulu " class="navbar-brand" target="_blank"></a>
        
		</div>
			<!--登录注册-->
			<ul class="nav-login">
				<li><a href="javascript:;"></a></li>
				<li class="nav-dlzc"><a href="${pageContext.request.contextPath}/loginSession" onclick="cookies();">退出</a></li>
			</ul>
		</div>
	</div>
		
	<div class="wrapper">
		<!--用户名-->
		<div class="personal-top">
                     <div style="width: 1200px;height: 100%;margin: 0 auto;">
			  <div class="person-userimg">
			  <c:if test="${fn:containsIgnoreCase(u.headUrl, 'http')}">
				 <img src="${u.headUrl}" width="80" height="80" style="border-radius: 50%;-webkit-border-radius: 50%;" />
			  </c:if>
			  <c:if test="${fn:containsIgnoreCase(u.headUrl, 'userhadle')}">
				 <img src="../${u.headUrl}" width="80" height="80" style="border-radius: 50%;-webkit-border-radius: 50%;" />
			  </c:if>
			  </div>
			  <div class="person-usertext">
			  <c:if test="${!empty u.telephone&&!empty u.nickName}">
				 <h1>${u.nickName}</h1></c:if>
			  <c:if test="${!empty u.telephone&&empty u.nickName}">
				 <h1>${u.telephone}</h1></c:if>	
			  </div>
                      </div>
		</div>	
		<!--个人信息-->
		<div class="personal-con">
			<div class="person-left">
				<ul class="my-list">
					<li class="lists">
						<span class="list-img"></span>
						<span class="list-title">播放记录</span>
						<span class="list-icon glyphicon glyphicon-menu-right"></span>
					</li>
					<li class="lists">
						<span class="list-img"></span>
						<span class="list-title" onclick="getCollect()">收藏记录</span>
						<span class="list-icon"></span>
					</li>
					<!-- 
					<li class="lists">
						<span class="list-img"></span>
						<span class="list-title">我的奖学金</span>
						<span class="list-icon"></span>
					</li>
					<li class="lists">
						<span class="list-img"></span>
						<span class="list-title">代言人中心</span>
						<span class="list-icon"></span>
					</li> -->

					<li class="lists">
						<span class="list-img"></span>
						<span class="list-title">基本资料</span>
						<span class="list-icon"></span>
					</li>
					
					<li class="lists">
						<span class="list-img"></span>
						<span class="list-title">账号设置</span>
						<span class="list-icon"></span>
					</li>
				</ul>
			</div>
			<div class="person-right">
				<!--我的播放记录-->
				<div class="person-item item-active" >
					<ol class="play-record" id="ol1">
					
					</ol>
				
				<!--课程分页-->
	    				<!--     <div class="pager">
	    			    	
								<nav aria-label="Page navigation">
									<ul class="pagination">
										<li><a href="${pageContext.request.contextPath}/selectPlay?startpage=1">首页</a></li>

										<c:if test="${pageSeries.hasPreviousPage }">
											<li><a href="${pageContext.request.contextPath}/selectPlay?startpage=${info.pageNum-1 }" aria-label="Previous" > <span
													aria-hidden="true">&laquo;</span>
											</a></li>
										</c:if>
										<c:forEach items="${pageSeries.navigatepageNums }" var="page_Num">
											<c:if test="${page_Num == pageSeries.pageNum }">
												<li class="active"><a href="${pageContext.request.contextPath}/selectPlay?startpage=${page_Num }"  >${page_Num }</a></li>
											</c:if>

											<c:if test="${page_Num != pageSeries.pageNum }">
												<li><a href="${pageContext.request.contextPath}/selectPlay?startpage=${page_Num }" >${page_Num }</a></li>
											</c:if>
										</c:forEach>

										<c:if test="${pageSeries.hasNextPage }">
											<li><a href="${pageContext.request.contextPath}/selectPlay?startpage=${pageSeries.pageNum+1 }"  aria-label="Next" > <span
													aria-hidden="true">&raquo;</span>
											</a></li>
										</c:if>


										<li><a href="${pageContext.request.contextPath}/selectPlay?startpage=${pageSeries.pages }" >末页</a></li>
									</ul>
								</nav>
	    			    </div>-->
	    			    </div>
				<!--我的收藏记录-->
				<div class="person-item">
					<ol class="play-record" id="il1">
						
					</ol>
				</div>
				
				<!--我的奖学金
				<div class="person-item">
					<div class="person-jxj">
						<div class="myjxj">
							<h3>您当前赚取的奖学金</h3>
							<span class="whatjxj">什么是奖学金？</span>
							<span class="jxjgz">奖学金规则？</span>
							
						</div>
						<div class="jxj-img">
							<h1>34.5元</h1>
							<img src=""/>
						</div>
					</div>
				</div>-->
				<!--代言人中心
				<div class="person-item">
					<div class="person-poster">
						<ul>
							<li class="all-money">
								<span>总收益</span>
								<span>￥35.94</span>
							</li>
							<li class="withdrawal">
								<span>可提现收益</span>
								<span>￥15.94</span>
							</li>
							<li class="know-poster">
								<span>了解代言</span>
							</li>
							<li class="enchashment">
								<span class="now-ench"><a href="javascript:;">立即提现</a></span>
								<p class="ench-btn"><span class="glyphicon glyphicon-exclamation-sign"></span><span>了解提现规则</span></p>
							</li>
						</ul>
						<div class="poster-con">
							<img src=""/>
						</div>
					</div>
				</div>-->
				
				<!--基本资料-->
				<div class="person-item">
					<div class="person-information">
						<div class="information">
							<div class="infor-img">
								<div class="infor-relative">
								<form action="<%=path%>/update2.action" method="post" enctype="multipart/form-data">
									 <c:if test="${empty u.headUrl}">
									<div class="my-img"><img src="${u.headUrl}" id="pic" /></div></c:if>
									 <c:if test="${fn:containsIgnoreCase(u.headUrl, 'http')}">
									<div class="my-img"><img src="${u.headUrl}" id="pic" /></div></c:if>
									 <c:if test="${fn:containsIgnoreCase(u.headUrl, 'userhadle')}">
									<div class="my-img"><img src="../${u.headUrl}" id="pic" /></div></c:if>
								 <a class="img-btn" >更改头像<input type="file" class="file" value="更换头像" multiple="multiple" name="mf" /></a>
									
								</div>
							</div>
						<div class="infor-set">
								
									<ul class="clearfix">
										<li>昵称：</li>
										<li>
											<input type="text" hidden="hidden" name="ID" value="${u.ID}">
											<input type="text" value="${u.nickName}" name="nickName" id="nickName"/>
										</li>
									</ul>
									<ul class="clearfix">
														
										<li>真实姓名：</li>
										<li>
											<input type="text" value="${u.realName}" name="realName" id="realName"/>
										</li>
										
									</ul>
									<ul class="clearfix">
										<li>性别：</li>
										<li>
											<select name="sex" class="sex" >
												<option value="">请选择</option>
												<option value="男" ${u.sex == "男" ? 'selected = "selected"' : '' }>男</option>
												<option value="女" ${u.sex == "女" ? 'selected = "selected"' : '' }>女</option>
											</select>
										</li>
									</ul>
								
									
									<ul class="clearfix">
										<li>出生日期：</li>
										<li>
											<input type="text" class="date" readonly="readonly" placeholder="请输入出生年月日" value="${u.birthday}" name="birthday" id="birthday"/>
										</li>
									</ul>
								
									<ul class="clearfix">
										<li>所在地：</li>
										<li>
											<div class="info">
												<div>
													<select id="s_province" name="city1" ></select> 
													<select id="s_city" name="city2" ></select>
													<select id="s_county" name="city3"></select>
													<script class="resources library" src="../jscript/area.js" type="text/javascript"></script>
													<script type="text/javascript">
													//初始值
													var opt0 = [];
													opt0.push("${u.city1}","${u.city2}","${u.city3}");
													console.log(opt0);
													_init_area();
													</script>
												</div>
											    <div id="show"></div>
											
											</div>
										</li>
									</ul>
									<ul class="clearfix grad">
										<li>所在年级：</li>
										<li>
											<select name="education" id="education">
					<option>教育阶段</option>
					<option value="小学" ${u.education == "小学" ? 'selected = "selected"' : '' }>小学</option>
					<option value="初中"${u.education == "初中" ? 'selected = "selected"' : '' }>初中</option>
					<option value="高中"${u.education == "高中" ? 'selected = "selected"' : '' }>高中</option>
				</select>
				<select name="grade" id="grade">
					<option>年级</option>
					<option value="一年级"${u.grade == "一年级" ? 'selected = "selected"' : '' }>一年级</option>
					<option value="二年级"${u.grade == "二年级" ? 'selected = "selected"' : '' }>二年级</option>
					<option value="三年级"${u.grade == "三年级" ? 'selected = "selected"' : '' }>三年级</option>
					<option value="四年级"${u.grade == "四年级" ? 'selected = "selected"' : '' }>四年级</option>
					<option value="五年级"${u.grade == "五年级" ? 'selected = "selected"' : '' }>五年级</option>
					<option value="六年级"${u.grade == "六年级" ? 'selected = "selected"' : '' }>六年级</option>
					<option value="初一"${u.grade == "初一" ? 'selected = "selected"' : '' }>初一</option>
					<option value="初二"${u.grade == "初二" ? 'selected = "selected"' : '' }>初二</option>
					<option value="初三"${u.grade == "初三" ? 'selected = "selected"' : '' }>初三</option>
					<option value="高一"${u.grade == "高一" ? 'selected = "selected"' : '' }>高一</option>
					<option value="高二"${u.grade == "高二" ? 'selected = "selected"' : '' }>高二</option>
					<option value="高三"${u.grade == "高三" ? 'selected = "selected"' : '' }>高三</option>
				</select>
										</li>
									</ul>
									<ul class="clearfix">
										<li>所在学校：</li>
										<li>
											<input type="text" value="${u.school}" name="school" id="school"/>
										</li>
									</ul>
									<ul class="clearfix">
										<li>班主任：</li>
										<li>
											<input type="text" value="${u.teacher}" name="teacher" id="teacher"/>
										</li>
									</ul>
									<ul class="clearfix">
										<li>个性签名：</li>
										<li>
											<textarea name="sign" rows="" cols="" id="sign">${u.sign }</textarea>
										</li>
									</ul>
									<input type="submit" value="保存"/>
								</form>
							</div>
						    
						    
						</div>
					</div>
				</div>
				
				<!--账号设置-->
				<div class="person-item">
					<div class="person-setting">
						<h5>服务安全</h5>
						<div class="set-top">
							<ul>
								<c:if test="${empty u.helpCode}" >
								<li>
									<div class="set-icon">
                                                                                <p></p>
									</div>
									<div class="set-sm notset">
										<p><span>教育扶贫账号</span><span>未绑定</span></p >
										<p>可用于教育扶贫专题页的全部课程免费观看</p >
									</div>
									<div class="set-btn set-yhm">立即绑定</div>
								</li></c:if>
								<c:if test="${!empty u.helpCode}" >
								<li>
									<div class="set-icon">
                                                                                <p></p>
									</div>
									<div class="set-sm">
										<p><span>教育扶贫账号</span><span>已绑定</span></p >
										<p>可用于教育扶贫专题页的全部课程免费观看</p >
									</div>
									<div class="set-btn" style="cursor: not-allowed;background: #ccc;color: #999;border-color: #999;">立即绑定</div>
								</li></c:if>
								<li>
									<div class="set-icon">
										<p></p>
									</div>
									<div class="set-sm">
										<p><span>登录密码</span></p>
										<p>用于保护账号信息和登录安全</p>
									</div>
									<div class="set-btn set-pass">修改密码</div>
								</li>
							</ul>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>	
	<!--footer-->
	<div class="footer" style="background: #fff;">
		<div class="content">
			<div class="con footer-con">
				<div class="section">
					<div class="footer_left">
						<a href="about/about.jsp">关于我们</a>
						<a href="about/about.jsp">联系我们</a>
						<a href="about/about.jsp">产品宣传片</a>
						
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
<!--课程详情弹窗-->
<div class="my-play-record">
	<div class="order-details-top">
		<ul class="clearfix">
			<li class="order-number">订单号：190005084</li>
			<li class="order-timer">下单时间：2017-08-22 17:46:03</li>
			<li class="order-pay-timer">支付时间：2017-08-22 17:46:03</li>
		</ul>
		<div class="order-pay-close"><span class="glyphicon glyphicon-remove"></span></div>
	</div>
	<div class="order-details-con">
		<ul class="clearfix">
			<li class="order-number">
				<div class="kc"></div>
			</li>
			<li class="order-timer">
				<h4>西医综合导学</h4>
				<p>西医导学是一门非常有意思的课程，非常有意思课程</p>
				<span>李莉莉</span>
			</li>
			<li class="order-pay-timer clearfix">
				<div class="order-pay-staus">
					<span>支付成功</span><br />
					<span>微信支付</span>
				</div>
				<div class="order-pay-money">
					<p>课程总价：<span>￥39.90</span></p>
					<p>奖学金抵扣：<span>￥10.30</span></p>
					<p>实付：<span>￥29.60</span></p>
				</div>
			</li>
		</ul>
	</div>
</div>
<div class="person-mask"></div>
<!--奖学金弹窗-->
<div class="jxjxq">
	<h6>什么是奖学金？<span class="poster-btn btn-close"></span></h6>
	<p>什么是奖学金什么是奖学金什么是奖学金什么是奖学金什么是奖学金</p>
</div>
<div class="jxj-gz">
	<h6>奖学金规则? <span class="poster-btn glyphicon glyphicon-remove"></span></h6>
	<p>么是奖学金什么是奖学金什么是奖学金什么是奖学金么是奖学金什么是奖学金什么是奖学金什么是奖学金</p>
</div>
<!--代言人的 详情介绍-->
<div class="poster">
	<h6>什么是代言？<span class="poster-btn glyphicon glyphicon-remove"></span></h6>
	<p>什么什么是什么是吗什么是代言代言代言代言代言代言</p>
</div>
<div class="know-enchashment">
	<h6>提现规则<span class="poster-btn glyphicon glyphicon-remove"></span></h6>
	<p>提现规则提现规则规则</p>
</div>	
<!--账号设置 找回密码-->
<div class="findpass">
	
</div>
<!--未注册时点击绑定优惠码的的弹框-->
<div class="fpzc">
	<div class="fpzctop">
		<a href="javascript:;" class="fptc-close btn-close"></a>
	</div>
	<div class="fpzcmain">
		<div class="fpzcyhm">
		    
				<input type="text" placeholder="输入免费学习验证码" id="fpzc-yhm" />
				<p></p >
				<input type="button" value="提交验证码" id="fpzc-btn" /> 
		    
		</div>
		<p><span class=""></span>已获得”互联网+教育扶贫“免费学习验证码的学校用户，可提交验证码后直接观看课程。</p >
	</div>
	<div class="fplink"><a href="../about/cooperation.jsp" target="_blank">获取免费学习验证码</a></div>
</div>


<div class="xgpass">
	<h6>请输入密码 <span class="poster-btn btn-close" style="margin-top: 25px;"></span></h6>
	<form action="${pageContext.request.contextPath}/updatepassword" method="post"> 
		<input type="password" name="password"/><br />
		<input type="submit" name="" id="sub-but" value="提交" />
	</form>
</div>

</body>
</html>
<script src="../jscript/jquery-2.0.3.js"></script>
<script type="text/javascript" src="../js/public.js"></script>
<script type="text/javascript" src="../jscript/moment.min.js"></script>
<script type="text/javascript" src="../jscript/moment.zh-cn.js"></script>
<script type="text/javascript" src="../jscript/ion.calendar.min.js"></script>
<script type="text/javascript" src="../jscript/area.js"></script>
<script type="text/javascript" src="../js/personal.js"></script>
<script>
//	点击我的订单详情 出现弹窗效果
	$('.order-xq-btn').on('click',function(){
		$('.person-mask').css('display','block');
		$('.my-play-record').css('display','block');
	});
	//关闭 订单详情弹窗
	$('.order-pay-close').on('click',function(){
		$('.person-mask').css('display','none');
		$('.my-play-record').css('display','none');
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
