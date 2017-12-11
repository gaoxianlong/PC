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
function thirdmenuy() {
            var id=document.getElementById("thirdmenuyi").value;
			
			
		$.ajax({
			url : "geter",
			type : "POST",
			
			data : {
				"id" : id,
				
				
			},
			success : function(msg) {
		
			
				$("#thirdmenuer").html(" ");
			
			for(var i=0;i<msg.length;i++){
		
			$("#thirdmenuer").append("<option value='"+msg[i].id+"'>"+msg[i].typeName+"</option>");
			
			}

				

			},
			error : function(res) {
				//alert(res.responseText);
				alert("DDDD");
			}
		});
	}
	

function thirdmenue() {
            var id=document.getElementById("thirdmenuer").value;		
		$.ajax({
			url : "geter",
			type : "POST",
			
			data : {
				"id" : id,
				
				
			},
			success : function(msg) {
				$("#thirdmenusan").html(" ");
			
			for(var i=0;i<msg.length;i++){
		
			$("#thirdmenusan").append("<option value='"+msg[i].id+"'>"+msg[i].typeName+"</option>");
			
			}		

			},
			error : function(res) {
				//alert(res.responseText);
				alert("DDDD");
			}
		});
	}
	


function thirdmenusa() {
            var id=document.getElementById("thirdmenusan").value;
				
		$.ajax({
			url : "getyi",
			type : "POST",
			
			data : {
				"id" : id
			},
			success : function(msg) {
		$("#thirdmenuernamediv").html("");
				$("#thirdmenuernamediv").html('<input type="text" name="fname" id="thirdmenusanname" placeholder="菜单名称" value="'+msg.typeName+'"/>');
			},
			error : function(res) {
				//alert(res.responseText);
				alert("DDDD");
			}
		});
	}

//55
function upthirdmenusanname() {
	        //id
            var id=document.getElementById("thirdmenusan").value;
            //name
			var TypeName=document.getElementById("thirdmenusanname").value;
			
		$.ajax({
			url : "upfirstmenu",
			type : "POST",
			
			data : {
				"ID" : id,
				"TypeName" : TypeName,
			},
			success : function(msg) {
				if(msg=="ok"){
				
				  alert("修改成功");
				}	else if(msg=="false"){
				 alert("修改失败");
				}
			},
			error : function(res) {
				//alert(res.responseText);
				alert("DDDD");
			}
		});
	}
	
	function gety() {
            var id=document.getElementById("firmenu").value;
		
			
		$.ajax({
			url : "getyi",
			type : "POST",
			
			data : {
				"id" : id
			},
			success : function(msg) {
		$("#upmenuyi").html("");
				$("#upmenuyi").html('<input type="text" name="firstmenu" id="firstmenu" value="'+msg.typeName+'"/><input type="text" name="firstmenulay" id="firstmenulay" value="'+msg.layered+'"/> ');
		
		
			
			
					

				

			},
			error : function(res) {
				//alert(res.responseText);
				alert("DDDD");
			}
		});
	}
	
	
	
	
	function upfirstmenu() {
	        //id
            var id=document.getElementById("firmenu").value;
            //name
			var TypeName=document.getElementById("firstmenu").value;
			//lay
			var layered=document.getElementById("firstmenulay").value;
		$.ajax({
			url : "upfirstmenu",
			type : "POST",
			
			data : {
				"ID" : id,
				"TypeName" : TypeName,
				"layered" : layered
				
			},
			success : function(msg) {
		
			
				if(msg=="ok"){
				
				  alert("修改成功");
				}	else if(msg=="false"){
				 alert("修改失败");
				}

				

			},
			error : function(res) {
				//alert(res.responseText);
				alert("DDDD");
			}
		});
	}
	
	
	
	function secondmenuy() {
            var id=document.getElementById("secondmenuyi").value;
			
			
		$.ajax({
			url : "geter",
			type : "POST",
			
			data : {
				"id" : id,
				
				
			},
			success : function(msg) {
		
			
				$("#secondtmenuer").html(" ");
			
			for(var i=0;i<msg.length;i++){
		
			$("#secondtmenuer").append("<option value='"+msg[i].id+"'>"+msg[i].typeName+"</option>");
			
			}

				

			},
			error : function(res) {
				//alert(res.responseText);
				alert("DDDD");
			}
		});
	}
	
	
	function secondtmenue() {
            var id=document.getElementById("secondtmenuer").value;
			
			
		$.ajax({
			url : "getyi",
			type : "POST",
			
			data : {
				"id" : id,
				
				
			},
			success : function(msg) {
		$("#secondmenuernamediv").html("");
			$("#secondmenuernamediv").html('<input type="text" name="fname" id="secondmenuername" placeholder="菜单名称" value="'+msg.typeName+'"/> ');

				

			},
			error : function(res) {
				//alert(res.responseText);
				alert("DDDD");
			}
		});
	}
	
	
	
	
	
	
	
	function upsecondmenuername() {
            var id=document.getElementById("secondtmenuer").value;
			var TypeName=document.getElementById("secondmenuername").value;
			
		$.ajax({
			url : "upfirstmenu",
			type : "POST",
			
			data : {
				"ID" : id,
				"TypeName" : TypeName
				
			},
			success : function(msg) {
		
			
				if(msg=="ok"){
				
				  alert("修改成功");
				}	else if(msg=="false"){
				 alert("修改失败");
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
	
	<!-- 修改一级菜单 -->
		<br /> <br /> 
		<select name="firmenu" id="firmenu" onChange="gety()">
			<c:forEach items="${type }" var="bs">
			<option value="${bs.ID }">${bs.typeName }</option>
			</c:forEach>
		</select>
		
		<div id="upmenuyi">
		<input type="text" name="firstmenu" id="firstmenu" placeholder="菜单名称"/>
		<input type="text" name="firstmenulay" id="firstmenulay" placeholder="菜单排序"/> 
		
		</div>
		
		<a onclick="upfirstmenu()">修改一级菜单</a>
		
		<br /> <br /> <br /> <br />
	<!-- 修改二级菜单 -->
	
	
		<select name="firstmenuer" id="secondmenuyi" onChange="secondmenuy()">
			<c:forEach items="${type }" var="bs">
			<option value="${bs.ID }">${bs.typeName }</option>
			</c:forEach>
		</select> 
		
		<select name="secondtmenusan" id="secondtmenuer" onChange="secondtmenue()">	
		</select>
		
		<div id="secondmenuernamediv">
		<input type="text" name="fname" id="secondmenuername" placeholder="菜单名称"/>
		
		</div>
		 <a onclick="upsecondmenuername()">添加二级菜单</a>
		<br /> <br /> 
	<!-- 修改三级菜单 -->
		<select
			name="firstmenusan" onChange="thirdmenuy()" id="thirdmenuyi">
			<c:forEach items="${type }" var="bs">
			<option value="${bs.ID }">${bs.typeName }</option>
			</c:forEach>
		</select> 
		
		<select name="secondtmenusan" id="thirdmenuer" onChange="thirdmenue()">	
		</select>
		
		<select name="secondtmenusan" id="thirdmenusan" onChange="thirdmenusa()">	
		</select>
		<div id="thirdmenuernamediv">
		<input type="text" name="fname" id="thirdmenusanname" placeholder="菜单名称"/>
		</div>
		 <a onclick="upthirdmenusanname()">添加三级菜单</a>
		<br /> <br />


<br/>

<br/>
<div></div>
<!-- 
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

 -->
	</center>
</body>
</html>
