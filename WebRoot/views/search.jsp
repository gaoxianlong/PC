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
<link rel="stylesheet" type="text/css" href="<%=path%>/css/search.css" />
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
<%@include file="../../headertwo.jsp"%>
<div class="wrap">
		<div class="search-box">
			<!--最热-->
			<div class="search-con">
				
				<!--搜索课程-->
				<div class="search-kc">
					<div class="kc-title">
					<p>共有${numKey}个包含 “${search}” 的课程</p>
						<p class="gd-btn"><a href="javascript:;">更多 <span class="glyphicon glyphicon-menu-up"></span></a></p>
					</div>
					<div class="kc-content rightfloat">
					<c:if test="${empty keylist}">
							<h1 style="height: 30px;line-height: 30px;font-size: 16px;text-align:center;">不好意思暂时没有课程</h1>
						</c:if>
						<div class="tabs-con">
							<div class="tabs-main">
	    						<ul class="clearfix">
	    							<c:forEach items="${keylist}"  var="k">
	    							<li>
		    							<a onclick="lanjieplayi(this)" value="${k.ID }" target="_blank">
											<div class="kc">
												<div class="kctop">
													<img class="lazy" alt="" width="208" height="124"   src="cover/${k.picURL}" />
												</div>
												<div class="kcmask"></div>
											</div>
											<div class="texts">
												<div class="titles ellipsis">${k.title}<em></em></div>
												<div class="kcsm">
													<div class="kcsm-top">
														<p>
															<span></span>
															<span>${k.clickRate}</span>
															
														</p>
														<p>
															<em>${k.typeName}</em>
															
														</p>
													</div>
													<div class="kcsm-foot">
														<p>${k.remark}</p>
													</div>
												</div>
											</div>
										</a>
									</li>
									</c:forEach>	
	    						</ul>
	    				   </div>
	    				<!--课程分页-->
	    				      <div class="pager">
	    			    	
								<nav aria-label="Page navigation">
									<ul class="pagination">
										<li><a href="selectkey?Title=${search }&startpage=1">首页</a></li>

										<c:if test="${pageSeries.hasPreviousPage }">
											<li><a href="selectkey?Title=${search }&startpage=${info.pageNum-1 }" aria-label="Previous" > <span
													aria-hidden="true">&laquo;</span>
											</a></li>
										</c:if>

										<c:forEach items="${pageSeries.navigatepageNums }" var="page_Num">
											<c:if test="${page_Num == pageSeries.pageNum }">
												<li class="active"><a href="selectkey?Title=${Title }&startpage=${page_Num }"  >${page_Num }</a></li>
											</c:if>

											<c:if test="${page_Num != pageSeries.pageNum }">
												<li><a href="selectkey?Title=${search }&startpage=${page_Num }" >${page_Num }</a></li>
											</c:if>
										</c:forEach>

										<c:if test="${pageSeries.hasNextPage }">
											<li><a href="selectkey?Title=${search }&startpage=${pageSeries.pageNum+1 }"  aria-label="Next" > <span
													aria-hidden="true">&raquo;</span>
											</a></li>
										</c:if>

										<li><a href="selectkey?Title=${search }&startpage=${pageSeries.pages }" >末页</a></li>
									</ul>
								</nav>
	    			    	</div>
	    				</div>
					</div>
				</div>
			</div>
			<!--最新-->
			<div class="search-con">
				<!--组合课程-->
				<div class="search-zhkc">
					<div class="kc-title">
						<p>共有6个包含 “考研” 的课程组合包</p>
						<p class="gd-btn"><a href="javascript:;">更多 <span class="glyphicon glyphicon-menu-up"></span></a></p>
					</div>
					<div class="kc-content rightfloat">
						<div class="tabs-con">
							<div class="tabs-main">
	    						<ul class="clearfix">	
									<li>
										<div class="kc">
											<div class="kctop">
												<a href="javascript:;"><img class="lazy" alt="" width="208" height="124" data-original="img/example.jpg" /></a>
											</div>
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
	    				</div>
					</div>
				</div>
			    <!--搜索课程-->
			    <div class="search-kc">
			    	<div class="kc-title">
						<p>共有21个包含 “考研” 的课程</p>
						<p class="gd-btn"><a href="javascript:;">更多 <span class="glyphicon glyphicon-menu-up"></span></a></p>
					</div>
					<div class="kc-content rightfloat">
						<div class="tabs-con">
							<div class="tabs-main">
	    						<ul class="clearfix">
									<li>
										<div class="kc">
											<div class="kctop">
												<a href="javascript:;"><img class="lazy" alt="" width="208" height="124" data-original="img/example.jpg" /></a>
											</div>
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
	    				    <!--课程分页-->
	    				    <div class="pager">
		    			    	<ul class="page clearfix" maxshowpageitem="5" pagelistcount="10"  id="page2"></ul>
		    			    </div>
	    				</div>
					</div>
			    </div>
			</div>
		</div>
	</div>
	
	<!--footer-->
<%@include file="../../footer.jsp"%>
</div>
</body>
</html>
<script src="<%=path%>/jscript/jquery-2.0.3.js"></script>
<script src="<%=path%>/jscript/page.js"></script>
<script type="text/javascript" src="<%=path%>/js/public.js"></script>
<script type="text/javascript" src="jscript/jquery.cookie.js"></script>

<link rel="stylesheet" type="text/css" href="<%=path%>/js/kc_public.js" />
<script type="text/javascript" src="js/login-public.js"></script>
<script src="<%=path%>/js/search.js"></script>
<script type="text/javascript">
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
    
   
</script>
