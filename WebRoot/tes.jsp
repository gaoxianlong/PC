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
	<link rel="stylesheet" type="text/css" href="styles.css">
	<script type="text/javascript" src="jscript/jquery-2.0.3.js"></script>
<script>

//当前项目绝对路径
var curWwwPath=window.document.location.href;
var pathName=window.document.location.pathname;
var pos=curWwwPath.indexOf(pathName);
var localhostPaht=curWwwPath.substring(0,pos);
var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);		
var path=localhostPaht+projectName;

   $(document).ready(function(){
            $.ajax({
            	type:"get",
                url: ''+path+'/getMulujson',
               
                success: function(data){
                   
                   alert(data[1].children[1].children[1].id);
                },
                error: function(){
                    alert('fail');
                }
            });
        });
</script>
  </head>
  
  <body>
  <center>
  <br /> <br />
  
  <!--  
		<a href="getmenuindex">menuJSP目录</a><br /> <br />
		 <br /> <br />
		<a href="getMulu?totall=0&so=0">二级菜单目录</a><br /> <br />
		<a href="back/houindex.jsp">后台</a><br /> <br />
		<a href="uptype">修改type</a><br /> <br />addseries
		<a href="addseries">修改series</a><br /> <br />
		-->
		</center>
  </body>
</html>
