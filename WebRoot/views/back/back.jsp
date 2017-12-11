<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<base href="<%=basePath%>">

<title>My JSP 'back.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="<%=path%>/js/jquery-3.1.0.min.js"></script>
<script>
	function geter() {
            var first=document.getElementById("firstmenusan").value;
			var second=document.getElementById("secondtmenusan").value;
			console.log("5555"+first);
		$.ajax({
			url : "geter",
			type : "POST",
			
			data : {
				"id" : first
			},
			success : function(msg) {
		
				$("#secondtmenusan").html(" ");
			
			for(var i=0;i<msg.length;i++){
		
			$("#secondtmenusan").append("<option value='"+msg[i].id+"'>"+msg[i].typeName+"</option>");
			
			}
					

				

			},
			error : function(res) {
				//alert(res.responseText);
				alert("DDDD");
			}
		});
	}
	
	
	
	
	function addfirstmenu() {
            var first=document.getElementById("firstmenu").value;
			var second=document.getElementById("firstmenulay").value;
			
		$.ajax({
			url : "addfirstmenu",
			type : "POST",
			
			data : {
				"TypeName" : first,
				"layered" : second
				
			},
			success : function(msg) {
		
			
				if(msg=="ok"){
				
				  alert("添加成功");
				}	else if(msg=="false"){
				 alert("添加失败");
				}

				

			},
			error : function(res) {
				//alert(res.responseText);
				alert("DDDD");
			}
		});
	}
	
	
	
	function addsecondmenu() {
            var first=document.getElementById("secondmenuer").value;
			var second=document.getElementById("secondmenuername").value;
			
		$.ajax({
			url : "addsecondmenu",
			type : "POST",
			
			data : {
				"TypeName" : second,
				"ParentID" : first
				
			},
			success : function(msg) {
		
			
				if(msg=="ok"){
				
				  alert("添加成功");
				}	else if(msg=="false"){
				 alert("添加失败");
				}

				

			},
			error : function(res) {
				//alert(res.responseText);
				alert("DDDD");
			}
		});
	}
	
	
	
	
	
	function addthirdmenu() {
            var first=document.getElementById("secondtmenusan").value;
			var second=document.getElementById("secondtmenusanname").value;
			
		$.ajax({
			url : "addthirdmenu",
			type : "POST",
			
			data : {
				"TypeName" : second,
				"ParentID" : first
				
			},
			success : function(msg) {
		
			
				if(msg=="ok"){
				
				  alert("添加成功");
				}	else if(msg=="false"){
				 alert("添加失败");
				}

				

			},
			error : function(res) {
				//alert(res.responseText);
				alert("DDDD");
			}
		});
	}
	
	
</script>

</head>

<body>
	<center>
	
	<!-- 添加一级菜单 -->
		<br /> <br /> 
		
		<input type="text" name="firstmenu" id="firstmenu" placeholder="菜单名称"/>
		<input type="text" name="firstmenulay" id="firstmenulay" placeholder="菜单排序"/> 
		<a onclick="addfirstmenu()">添加一级菜单</a>
		
		<br /> <br /> <br /> <br />
	<!-- 添加二级菜单 -->
		<select name="firstmenuer" id="secondmenuer">
			<c:forEach items="${type }" var="bs">
			<option value="${bs.ID }">${bs.typeName }</option>
			</c:forEach>
		</select> 
		
		<input type="text" name="fname" id="secondmenuername" placeholder="菜单名称"/> <a onclick="addsecondmenu()">添加二级菜单</a>
		<br /> <br /> 
	<!-- 添加三级菜单 -->
		<select
			name="firstmenusan" onChange="geter()" id="firstmenusan">
			<c:forEach items="${type }" var="bs">
			<option value="${bs.ID }">${bs.typeName }</option>
			</c:forEach>
		</select> 
		
		<select name="secondtmenusan" id="secondtmenusan">	
		</select>
		
		<input type="text" name="fname" id="secondtmenusanname" placeholder="菜单名称"/> <a onclick="addthirdmenu()">添加三级菜单</a>
		<br /> <br />


<br/>

<br/>


<div class="allmenu">
								<ul>
									<c:forEach items="${type }" var="bs">
										<li class="menunav">
											<h5>
												<a style="background:#CFE566">${bs.typeName }</a>
											</h5>
											<div class="listmenu">
												<c:forEach items="${as }" var="bsd">
													<c:if test="${bsd.parentID == bs.ID }">
														<dl>
															<dt>
																<a style="background:#DF62E3">${bsd.typeName }</a>
															</dt>
															<dd>
																<c:forEach items="${asd }" var="asd">
																	<c:if test="${asd.parentID == bsd.ID }">
																		<em><a style="background:#1B9C4C">>${asd.typeName }</a></em>
																	</c:if>
																</c:forEach>
															</dd>
														</dl>
													</c:if>
												</c:forEach>
											</div>
										</li>
									</c:forEach>

								</ul>
							</div>


	</center>
</body>
</html>
