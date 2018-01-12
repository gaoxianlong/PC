﻿<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="<%=path%>/content/bootstrap.min.css" />
<link rel="stylesheet" href="<%=path%>/css/public.css" /> 
<link rel="stylesheet" type="text/css" href="<%=path%>/css/kc_public.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/css/search_public.css" />
<link rel="stylesheet" href="<%=path%>/css/subpage.css" />
<style>
</style>
<script>
        
        function lanjieplayi(obj) {
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
</script>
</head>
<body>
<div class="wrap">
	<%@include file="../../headertwo.jsp"%>
	<div class="wrapper">
		<div class="subpage-top">
			<div class="subpage-con">
				<!--筛选课程条件-->
				<div class="screen">
					<div class="screen-content">
						<dl class="clearfix">
							<dt>品类</dt>
							<dd>
								<a href="#" name="mode" class="all"
										data-id="${totall }" value="0">全部</a>
									<c:if test="${sub == null }">
										<c:forEach items="${type }" var="bs">
											<a href="selsub?id=${bs.ID }&sort=1" name="mode"
												class="sx_child" value="${bs.ID }">${bs.typeName }</a>
										</c:forEach>
									</c:if>
									<c:if test="${sub == 1 }">
										<c:forEach items="${type1 }" var="bs">
											<a href="selsub?id=${bs.ID }&sort=1" name="mode"
												data-id="${point }" value="${bs.ID }" class="sx_child">${bs.typeName }</a>
										</c:forEach>
									</c:if>
							</dd>
						</dl>
						<dl class="clearfix">
							<dt>进度</dt>
							<dd>
								<a href="#" name="stage" class="all"
										data-id="${totall2 }" value="0">全部</a>
									<c:if test="${sub == null }">
										<c:forEach items="${type }" var="bs">
											<c:forEach items="${as }" var="bsd">
												<c:if test="${bsd.parentID == bs.ID }">
													<a href="selsub?id=${bsd.ID }&sort=2" name="stage"
														value="${bsd.ID }" class="sx_child"> ${bsd.typeName }</a>
												</c:if>
											</c:forEach>
										</c:forEach>
									</c:if>
									<c:if test="${sub == 1 }">
										<c:forEach items="${type1 }" var="bs">
											<c:forEach items="${as1 }" var="bsd">
												<c:if test="${bsd.parentID == bs.ID }">
													<a href="selsub?id=${bsd.ID }&sort=2" name="stage"
														data-id="${point2 }" value="${bsd.ID }" class="sx_child">
														${bsd.typeName }</a>
												</c:if>
											</c:forEach>
										</c:forEach>
									</c:if>
							</dd>
						</dl>
						<dl class="clearfix">
							<dt>科目</dt>
							<dd>
								<a href="#" name="board" class="all"
										data-id="${totall3 }" value="0">全部</a>
									<c:if test="${sub == null }">
										<c:forEach items="${type }" var="bs">
											<c:forEach items="${as }" var="bsd">
												<c:if test="${bsd.parentID == bs.ID }">
													<c:forEach items="${asd }" var="asd">
														<c:if test="${asd.parentID == bsd.ID }">
															<a href="selsub?id=${asd.ID }&sort=3" name="board"
																value="${asd.ID }" class="sx_child">${asd.typeName }</a>
														</c:if>
													</c:forEach>
												</c:if>
											</c:forEach>
										</c:forEach>
									</c:if>
								<c:if test="${empty thirdtotal}">
									<c:if test="${sub == 1 }">
										<c:forEach items="${type1 }" var="bs">
											<c:forEach items="${as1 }" var="bsd">
												<c:if test="${bsd.parentID == bs.ID }">
													<c:forEach items="${asd1 }" var="asd">
														<c:if test="${asd.parentID == bsd.ID }">
															<a href="selsub?id=${asd.ID }&sort=3" name="board"
																data-id="${point3 }" value="${asd.ID }" class="sx_child">${asd.typeName }</a>	
														</c:if>
													</c:forEach>
												</c:if>
											</c:forEach>
										</c:forEach>
									</c:if>
								</c:if>
								<c:if test="${!empty thirdtotal}">
									<a href="selsub?id=1&sort=4" name="board" data-id="${point3 }" value="1" class="sx_child">语文</a>	
									<a href="selsub?id=2&sort=4" name="board" data-id="${point3 }" value="2" class="sx_child">数学</a>
									<a href="selsub?id=3&sort=4" name="board" data-id="${point3 }" value="3" class="sx_child">英语</a>
									<a href="selsub?id=4&sort=4" name="board" data-id="${point3 }" value="4" class="sx_child">物理</a>
									<a href="selsub?id=5&sort=4" name="board" data-id="${point3 }" value="5" class="sx_child">化学</a>
									<a href="selsub?id=6&sort=4" name="board" data-id="${point3 }" value="6" class="sx_child">生物</a>
									<a href="selsub?id=7&sort=4" name="board" data-id="${point3 }" value="7" class="sx_child">政治</a>
									<a href="selsub?id=8&sort=4" name="board" data-id="${point3 }" value="8" class="sx_child">历史</a>
									<a href="selsub?id=9&sort=4" name="board" data-id="${point3 }" value="9" class="sx_child">地理</a>								
								</c:if>
							</dd>
						</dl>
					</div>
				</div>
			</div>
	    </div>
	    <!--页面主体内容-->
	    <div class="subpage-wrap">
	    	<div class="subpage-con clearfix">
	    		<div class="leftfloat">
	    			<h5>热门精品课程</h5>
	    			<div class="sidebar">
	    				<ul>
	    					<c:forEach items="${seriestuijian }" var="tui" begin="0" end="2" >
		    					<li class="clearfix">
		    						<a onclick="lanjieplayi(this)" href="javascript:;" value="${tui.ID }" target="_blank">
		    							<p class="cont">${tui.title }</p>
		    						</a>
		    					</li>
	    					</c:forEach>
	    				</ul>
	    			</div>
	    		</div>
	    		<div class="rightfloat">
	    			<div class="tab">
	    				<ul>
		    				<li class="tabs tabs-active">综合</li>
		    			</ul>
	    			</div>
	    		    <!--综合-->
	    			<div class="tabs-con con-active">
	    				<div class="tabs-main">
		    				<ul class="clearfix">
		    				
		    						<c:forEach items="${series }" var="ser">
										<li>
											<a onclick="lanjieplayi(this)" href="javascript:;" value="${ser.ID }" target="_blank">
												<div class="kc">
													<div class="kctop">
														<img class="lazy" alt="" width="200" height="124" src="cover/${ser.picURL }" />
													</div>	
												</div>
												<div class="texts">
													<div class="titles">${ser.title}<em></em></div>
													<div class="kcsm">
														<div class="kcsm-top">
															<p>
															<span></span> 
															<span>${ser.clickRate }</span>
														</p>
														<p>
															<em>￥${ser.realPrice }</em>
														</p>
														</div>
														<div class="kcsm-foot">
															<p>${ser.remark }</p>
														</div>
													</div>
												</div>
											</a>
										</li>
									</c:forEach>	
		    				</ul>
	    			    </div>
	    			    <div class="pager">
								<nav aria-label="Page navigation">
									<ul class="pagination">
										<li><a href="selsub?sort=${sort }&id=${menuid }&startpage=1">首页</a></li>

										<c:if test="${info.hasPreviousPage }">
											<li><a href="selsub?sort=${sort }&id=${menuid }&startpage=${info.pageNum-1 }" aria-label="Previous" > <span
													aria-hidden="true">&laquo;</span>
											</a></li>
										</c:if>

										<c:forEach items="${info.navigatepageNums }" var="page_Num">
											<c:if test="${page_Num == info.pageNum }">
												<li class="active"><a href="selsub?sort=${sort }&id=${menuid }&startpage=${page_Num }"  >${page_Num }</a></li>
											</c:if>

											<c:if test="${page_Num != info.pageNum }">
												<li><a href="selsub?sort=${sort }&id=${menuid }&startpage=${page_Num }" >${page_Num }</a></li>
											</c:if>
										</c:forEach>

										<c:if test="${info.hasNextPage }">
											<li><a href="selsub?sort=${sort }&id=${menuid }&startpage=${info.pageNum+1 }"  aria-label="Next" > <span
													aria-hidden="true">&raquo;</span>
											</a></li>
										</c:if>

										<li><a href="selsub?sort=${sort }&id=${menuid }&startpage=${info.pages }" >末页</a></li>
									</ul>
								</nav>
	    			    </div>
	    			</div>
	    			<!--最热-->
	    			<div class="tabs-con">
	    				<div class="tabs-main">
		    				<ul class="clearfix">
		    					<li>
		    						<div class="kc">
										<div class="kctop">
											<a href="javascript:;"><img class="lazy" alt="" width="200" height="124" data-original="img/example.jpg" /></a>
										</div>
										<div class="kcmask"></div>
									</div>
									<div class="texts">
										<div class="titles">西医综合导学</div>
										<div class="kcsm">
											<div class="kcsm-top">
												<p>
													<span>考研</span>
													<span>医学</span>
												</p>
												<p>
													<span class="glyphicon glyphicon-play-circle"></span>
													<span>43543</span>
												</p>
											</div>
											<div class="kcsm-foot">
												<p>西医导学是一门非常有意思的课程，非常非常有意思的课</p>
											</div>
										</div>
									</div>
		    					</li>
		    				</ul>
		    			</div>
	    				<div class="pager">
	    			    	<ul class="page clearfix" maxshowpageitem="5" pagelistcount="10"  id="page2"></ul>
	    			    </div>
	    			</div>
	    			<!--最新-->
	    			<div class="tabs-con">
	    				<div class="tabs-main">
		    				<ul class="clearfix">
		    					<li>
		    						<div class="kc">
										<div class="kctop">
											<a href="javascript:;"><img class="lazy" alt="" width="200" height="124" data-original="img/example.jpg" /></a>
										</div>
										<div class="kcmask"></div>
									</div>
									<div class="texts">
										<div class="titles">西医综合导学</div>
										<div class="kcsm">
											<div class="kcsm-top">
												<p>
													<span>考研</span>
													<span>医学</span>
												</p>
												<p>
													<span class="glyphicon glyphicon-play-circle"></span>
													<span>43543</span>
												</p>
											</div>
											<div class="kcsm-foot">
												<p>西医导学是一门非常有意思的课程，非常非常有意思的课</p>
											</div>
										</div>
									</div>
		    					</li>
		    				</ul>
		    			</div>
	    				<div class="pager">
	    			    	<ul class="page clearfix" maxshowpageitem="5" pagelistcount="10"  id="page3"></ul>
	    			    </div>
	    			</div>
	    		</div>
	    	</div>
	    </div>
	</div>
    <%@include file="../../footer.jsp"%>
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
<!--<script src="<%=path%>/jscript/jquery-2.0.3.js"></script>-->
<script src="http://demo.jb51.NET/js/2011/lazyload/Js/lazyload/jquery.js"></script>
<script src="<%=path%>/jscript/jquery.lazyload.min.js"></script> 
<script src="<%=path%>/jscript/jquery-2.0.3.js"></script>
<script src="<%=path%>/jscript/page.js"></script>
<script type="text/javascript" src="jscript/jquery.cookie.js"></script>
<script type="text/javascript" src="<%=path%>/js/public.js"></script>
<script type="text/javascript" src="<%=path%>/js/kc_public.js"></script>
<script src="<%=path%>/js/login-public.js"></script>
<script src="<%=path%>/js/subpage.js"></script>
<script type="text/javascript">
//关闭没有视频的弹窗
$('.notvideo-close').click(function(){
		$(this).parent().parent().hide();
		$('.login-mask').hide();
	});

	//分页效果
    function tt(dd){
          alert(dd);
    }
//  maxshowpageitem ：最多显示的页码数字，必需写 。     pagelistcount:每一个页面显示的数据的个数，必需写。      id:不用解释了吧，必需。三、初始化分页
    var GG = {
        "kk":function(mm){
            alert(mm);
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
