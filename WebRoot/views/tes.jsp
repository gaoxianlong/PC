<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	
<script language="JavaScript">
 window.location.href = "getmenuindex";
</script>
-->
  </head>
  
  <body>
  <center>
  <br /> <br />
		<a href="getmenuindex">menuJSP目录</a><br /> <br />
		 <br /> <br />
		<a href="getMulu?totall=0&so=0">二级菜单目录</a><br /> <br />
		
		
		<a href="back/houindex.jsp">后台</a><br /> <br />
		<a href="uptype">修改type</a><br /> <br />addseries
		<a href="addseries">修改series</a><br /> <br />
		</center>
  </body>
</html>
