<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理页面</title>

<link rel="stylesheet" href="<%=basePath%>css/houcss/index.css" type="text/css"
	media="screen" />
	
<script type="text/javascript" src="<%=basePath%>js/jquery-3.1.0.min.js"></script>
	<script type="text/javascript">
	$(function(){

	
	  $('.regs').click(function(){
	   var user=$('.user').val();
	   var pass=$('.pass').val();
	   var flag=confirm("确定添加"+user+"吗？");
	   if(flag){
	 
	   var url="login-regs";
	   var arg={"time":new Date()};
	  
	
	   $.post(
	   url,
	  $("#for").serialize(),
	  
	   
	   function(data){
	   
	    
	    if(data=="1"){
	    
	    alert("添加成功");
	    window.location.href="product-get";
	    }else{
	    
	    alert("添加失败");
	    }
	  
	   
	    });
	   }
	   
	   return false;
	
	});
	
	
	});
	
	
	</script>
	 
<script type="text/javascript" src="<%=basePath%>js/houjs/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/houjs/tendina.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/houjs/common.js"></script>
<link rel="stylesheet"
	href="<%=basePath%>kindeditor-4.1.10/themes/default/default.css" />
<link rel="stylesheet"
	href="<%=basePath%>kindeditor-4.1.10/plugins/code/prettify.css" />
<script charset="utf-8"
	src="<%=basePath%>kindeditor-4.1.10/kindeditor.js"></script>
<script charset="utf-8"
	src="<%=basePath%>kindeditor-4.1.10/lang/zh_CN.js"></script>
<script charset="utf-8"
	src="<%=basePath%>kindeditor-4.1.10/plugins/code/prettify.js"></script>
<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[id="tx,i"]', {
				cssPath : '<%=basePath%>kindeditor-4.1.10/plugins/code/prettify.css',
				uploadJson : '<%=basePath%>kindeditor-4.1.10/jsp/upload_json.jsp',
				fileManagerJson : '<%=basePath%>kindeditor-4.1.10/jsp/file_manager_json.jsp',
									allowFileManager : true,
									afterCreate : function() {
										var self = this;
										K.ctrl(document, 13, function() {
											self.sync();
											document.forms['f'].submit();
										});
										K.ctrl(self.edit.doc, 13, function() {
											self.sync();
											document.forms['f'].submit();
										});
									}
								});
				prettyPrint();
			});
</script>
</head>
<body>
	<!--顶部-->
	<div class="layout_top_header">
		<div style="float: left">
			<span
				style="font-size: 16px;line-height: 45px;padding-left: 20px;color: #8d8d8d">XXXX管理后台
				</h1>
			</span>
		</div>
		<div id="ad_setting" class="ad_setting">
			<a class="ad_setting_a" href="javascript:; "> <i
				class="icon-user glyph-icon" style="font-size: 20px"></i> <span>${session.user.user }</span>
				<i class="icon-chevron-down glyph-icon"></i>
			</a>
			<ul class="dropdown-menu-uu" style="display: none" id="ad_setting_ul">
				<li class="ad_setting_ul_li"><a href="javascript:;"><i
						class="icon-user glyph-icon"></i> 个人中心 </a></li>
				<li class="ad_setting_ul_li"><a href="javascript:;"><i
						class="icon-cog glyph-icon"></i> 设置 </a></li>
				<li class="ad_setting_ul_li"><a href="login-loginout"><i
						class="icon-signout glyph-icon"></i> <span class="font-bold">退出</span>
				</a></li>
			</ul>
		</div>
	</div>
	<!--顶部结束-->
	<!--菜单-->
<div class="layout_left_menu">
	<ul id="menu">
			<li class="childUlLi">
		    <a href="main.html" target="menuFrame">
			<i class="glyph-icon icon-home">
			</i>
			首页
			</a>
		<ul>
					<li>
					
					<a href="login-reg?reg=1">
					<i class="glyph-icon icon-chevron-right"></i>
					用户添加
					</a>
					</li>
					
		</ul>
		</li>
		
		
		
		
	<li class="childUlLi">
			
		<a href=#">
			<i class="glyph-icon icon-reorder">		
			</i>
			菜单管理
		</a>
			<ul>
						<li>
						<a href="<%=basePath%>hs" target="menuFrame">	
						<i class="glyph-icon icon-chevron-right">
						</i>添加菜单
						</a>
						</li>
				<li>
						<a href="<%=basePath%>uptype" target="menuFrame">	
						<i class="glyph-icon icon-chevron-right">
						</i>修改菜单
						</a>
						</li>
			
		</ul>
	</li>
			<!-- 课程封面 -->
           <li class="childUlLi">
			
		<a href=#">
			<i class="glyph-icon icon-reorder">		
			</i>
			封面管理
		</a>
			<ul>
						<li>
						<a href="<%=basePath%>series" target="menuFrame">	
						<i class="glyph-icon icon-chevron-right">
						</i>添加课程封面
						</a>
						</li>
				<li>
						<a href="<%=basePath%>selseries" target="menuFrame">	
						<i class="glyph-icon icon-chevron-right">
						</i>查看课程封面
						</a>
						</li>
						
				<li>
						<a href="<%=basePath%>selseriesvideo" target="menuFrame">	
						<i class="glyph-icon icon-chevron-right">
						</i>上传视频
						</a>
						</li>
			
		</ul>
	</li>
            
		</ul>
	</div>
	
	
	
	
 
	<!--菜单-->
	<div id="layout_right_content" class="layout_right_content">
 
		<div class="route_bg" style="height:1px"></div>
		<div class="mian_content">
			<div id="page_content">
				<iframe id="menuFrame" name="menuFrame" src="" style="overflow:visible;"
                        scrolling="yes" frameborder="no" width="100%" height="100%"></iframe>
			</div>
		</div>
	</div>
	
					
	
	<div class="layout_footer">
		<p>Copyright © 2014 - XXXX科技</p>
	</div>
</body>
</html>