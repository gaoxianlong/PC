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
<link rel="stylesheet" type="text/css" href="../../css/about/about.css" />
<style>
	
</style>
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
					<a href="cooperation.jsp">联系我们</a>
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
		<div class="about-stk">
			<div class="about-stk-con">
				<div class="stk-xq">
                                        <h1>公司简介</h1>
					<div class="stk-left">
						<p>手提课互联网教育平台是最专业最优质最全面的综合性知识共享平台，也是全球首先提出“互联网+教育扶贫”的互联网教育平台。 </p>
						<p>平台以优质教育资源均衡发展为中心，以人人共享优质教育资源为原则。通过互联网+教育模式，打破当前优质教育资源不均衡的局面。 </p>
						<p> 为了实现让任何人享有任何优质教育资源（ELE），手提课搭建近400平米的专业录播基地，匠心制作全行业最高品质的精品系列微课，以实现为任何人提供任何知识。最终将搭建一个全球知识共享终身学习平台，让70亿人共享全球公平优质教育资源。</p>
					</div>
				    <div class="stk-right">
				    	<!--极酷阳光播放器/代码开始-->
			            <div class="video2" id="CuPlayer">
			                <script>
			                    var vID = "";
			                    var vWidth = "100%";            //播放器宽度设置
			                    var vHeight = "100%";               //播放器高度设置
			                    var vFile = "../../jscript/v3/CuSunV3set.xml";
			                    var vPlayer = "../../jscript/v3/player.swf?v=3.5";
			                    var vPic = "";//视频缩略图
			                    var vCssurl = "../../content/wxcss/mini.css";
			                    var vMp4url = "http://oss.shoutike.com/stk/stkcpxxp/intro.mp4"; 
//                              var vMp4url = "C:\Users\Administrator\Desktop\demo\TWST.mp4";
			                </script>
			                <script class="CuPlayerVideo" data-mce-role="CuPlayerVideo" type="text/javascript" src="../../jscript/v3/CuSunX1.min.js"></script>
			            </div>
				    </div>
				</div>
				<div class="stk-ys">
					<dl>
						<dt>
							<p></p>
						</dt>
						<dd>
							<p>师资优秀</p>
						</dd>
					</dl>
					<dl>
						<dt>
							<p></p>
						</dt>
						<dd>
							<p>产品种类繁多</p>
						</dd>
					</dl>
					<dl>
						<dt>
							<p></p>
						</dt>
						<dd>
							<p>课程体系完整</p>
						</dd>
					</dl>
					<dl>
						<dt>
							<p></p>
						</dt>
						<dd>
							<p>人人皆学</p>
						</dd>
					</dl>
				</div>
			</div>
		</div>
		
		<div class="about-kc">
			<div class="about-kc-main">
				<ul>
					<li>
						<div class="kc">
							<h4>基础教育</h4>
							<h5>幼儿园至高中全课程<h5>
							<h6>幼儿园至高中全课程<h6>
						</div>
						<div class="aboutmask"></div>
					</li>
				</ul>
				<ul>
					<li>
						<div class="kc">
							<h4>考研</h4>
							<h5>公共课、各学科专业课</h5>
							<h6>公共课、各学科专业课</h6>
						</div>
						<div class="aboutmask"></div>
					</li>
					<li>
						<div class="kc">
							<h4>多国语言</h4>
							<h5>涉及英语、法语等多国语言</h5>
							<h6>涉及英语、法语等多国语言</h6>
						</div>
						<div class="aboutmask"></div>
					</li>
				</ul>
				<ul>
					<li>
						<div class="kc">
							<h4>艺术</h4>
							<h5>兴趣、应试类课程</h5>
							<h6>兴趣、应试类课程</h6>
						</div>
						<div class="aboutmask"></div>
					</li>
					<li>
						<div class="kc">
							<h4>乐享</h4>
							<h5>发现世界、掌握更多技能</h5>
							<h6>发现世界、掌握更多技能</h6>
						</div>
						<div class="aboutmask"></div>
					</li>
				</ul>
			</div>
		</div>
	
	    <div class="about-gs">
	    	<div class="about-gs-main">
	    		<h1>理念概述</h1>
	    		<div class="gsxq">
	    			<p>世界之核心要素，乃教育也，尤以公平教育为上。</p>
	    			<p>民之贫，非教育不能富之；民之愚，非教育不能智之；民之私，非教育不能慷之；</p>
	    			<p>教育之功，功在当代，利在千秋；</p>
	    			<p>教育兴，则国兴。虽一时落后退步，然人才辈出，民心所向，国力犹存。</p>
	    			<p>教育衰，则国衰。纵长期歌舞升平，然万众浮躁，前途迷茫，兴盛乏力。</p>
	    			<p>教育，国之命脉，社稷之根本，公平之基础，牵一发而动全身。百年之国运，立国之根本，皆寄望于教育。</p>
	    			<p>让世界之民不因背景、不因地域、不因时间之限皆能享世界公平优质之教育，此乃万民之福，众生之福也！</p>
	    			<p>长叹吾侪幸而生于斯，当以国盛民智为己任。以一寸赤心普优质教育，怀孜孜之心提民之素养；</p>
	    			<p>应倾毕生之精血，创举世之功业；聚志同道合之良士，献绵绵不绝之良策；为国之兴，民之智，鞠躬尽瘁，尽忠尽责。</p>
	    		</div>
	    	</div>
	    </div>
	    
	    <div class="about-kh">
	    	<div class="about-kc-main">
	    		<dl>
	    			<dt>
	    				<div class="about-kc-img"></div>
	    			</dt>
	    			<dd>
	    				<h6>使命</h6>
	    				<p>Mission</p>
	    				<p>做中国特色社会主义教育</p>
	    			</dd>
	    		</dl>
	    		<dl>
	    			<dt>
	    				<div class="about-kc-img"></div>
	    			</dt>
	    			<dd>
	    				<h6>愿景</h6>
	    				<p>Vision</p>
	    				<p>让70亿人共享公平优质教育资源</p>
	    			</dd>
	    		</dl>
	    		<dl>
	    			<dt>
	    				<div class="about-kc-img"></div>
	    			</dt>
	    			<dd>
	    				<h6>定位</h6>
	    				<p>Position</p>
	    				<p>全球知识共享终身学习平台</p>
	    			</dd>
	    		</dl>
	    		<dl>
	    			<dt>
	    				<div class="about-kc-img"></div>
	    			</dt>
	    			<dd>
	    				<h6>宗旨</h6>
	    				<p>Purpose</p>
	    				<p>全心全意为学习者服务</p>
	    			</dd>
	    		</dl>
	    	</div>
	    </div>
	</div>
        
        <div class="about-gs" style="margin-bottom: 40px;">
	    	<div class="about-gs-main">
	    		<h1 style="width: 55px;padding-right: 0;">互联网+</h1>
                        <h1 style="padding-top: 125px;">教育扶贫</h1>
	    		<div class="gsxq" style="width: 950px;">
	    			<p style="height: auto;text-indent: 30px;">为支持国家提出的“教育信息化”、“教育精准扶贫”、“优质教育资源均衡发展”“打赢脱贫攻坚战”的总体规划，为了让优质教育资源欠发达地区的孩子们也能接受到优质教育，手提课在教育部学校规划建设发展中心及教育部其它相关部门的支持下推出“互联网+教育扶贫”扶贫项目。</p>
	    			<p style="height: auto;text-indent: 30px;">目的在于通过“互联网+教育扶贫”的方式为优质教育资源短缺的省、市、县提供优质教育资源服务，缩短城际之间教育质量的差距，协助地方政府打赢教育脱贫攻坚战役，让优质教育资源短缺地区的孩子同样享受到优质教育资源，实现“人人皆学，处处能学，时时可学”的理想教育。</p>
	    			<p style="height: auto;text-indent: 30px;">为切实有效落实“互联网+教育扶贫”扶贫项目，支援地方政府高效实施“教育信息化”“教育精准扶贫”“优质教育资源均衡发展”“打赢脱贫攻坚战”的总规划，项目组特成立“互联网+教育扶贫”领导小组（简称“IPEP”领导小组）。“IPEP”领导小组负责“互联网+教育扶贫”扶贫项目的所有工作，包括但不仅限于对外联络、审批、方案制定、开通权限等。</p>
	    			
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
						<a href="cooperation.jsp">商务合作</a>
						<!--<a href="javascript:;">加入我们</a>
						<a href="javascript:;">常见问题</a>-->
						<a href="propaganda.jsp">产品宣传片</a>
					</div>
					<!--<div class="footer_right">
						<a href="javascript:;">sub</a>
						<a href="javascript:;">sub</a>
						
					</div>-->
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
        $('#CuPlayerVideo_video').height('324px');

	$('.about-kc .about-kc-main li').attr('data-onoff','false');
	$('.about-kc .about-kc-main li').each(function(){
		var start = parseInt($(this).children('.kc').children('h4').css('top'));
		var end = start-20;
		$(this).hover(function(){
			if($(this).attr('data-onoff') == 'false'){
				$(this).css('border-radius','0px');
				$(this).css('-webkit-border-radius','0px');
				$(this).children('.aboutmask').css('display','block');
				$(this).children('.kc').children('h4').stop().animate({top:end+'px'});
				$(this).children('.kc').children('h5').stop().animate({opacity:1});
				$(this).attr('data-onoff','true');
			}
		},function(){
			if($(this).attr('data-onoff') == 'true'){
				$(this).css('border-radius','5px');
				$(this).css('-webkit-border-radius','5px');
				$(this).children('.aboutmask').css('display','none');
				$(this).children('.kc').children('h4').stop().animate({top:start+'px'});
				$(this).children('.kc').children('h5').stop().animate({opacity:0});
				$(this).attr('data-onoff','false');
			}
			
		});
	});
	
</script>