<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//String aa = request.getParameter("vipso");
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
	-->

<script type="text/javascript" src="jscript/jquery-2.0.3.js"></script>
 <script>
 
 
 
        $(document).ready(function(){
            $.ajax({
                type: "get",
                async: false,
                url: "http://127.0.0.1:8080/STK/selorderandk",
                dataType: "jsonp",
                jsonp: "callback",//一般默认为:callback
                jsonpCallback:"success_jsonpCallback",//自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名，也可以写"?"，jQuery会自动为你处理数据
                success: function(data){
                    /**
                     * 获得服务器返回的信息。
                     * 可以做具体的业务处理。
                     */
                    //alert('标题：ID： ' + json.title + ' ，背景： ' + json.bg + '。');
                   alert(data.pageInfo.list[2].id+"  "+data.pageInfo.list[2].createTime.toLocaleString( )+" "+data.pageInfo.list[2].overtime.toLocaleString( )+" "+data.pageInfo.list[2].outtradeno);
                },
                error: function(){
                    alert('fail');
                }
            });
        });
		  function jso() {
		 // alert("55");
		 
		 $.ajax({
						url : "http://127.0.0.1:8080/STK/mpjss",
						type : "POST",
						
						data : {
							"seriesID" : 22,	
						},
						success : function(data) {
							var arry = data.lsvideo;
							var arrydq = data.itemvo;
						$('#bgh2').html('title：'+data.title);
						$('#bgh3').html('封面：'+data.bg);
						
						var arry = data.lsvideo;
						var arrydq = data.itemvo;
						$('#list').empty();
						$.each(arry,function(){
							$('<li><span>id:'+this.id+'</span><br/><span>title:'+this.title+'</span><br/><span>url:'+this.videoURL+'</span><li>').appendTo($('#list'));
						});
						
						$('#dqbf').empty();
						$('<em>id:'+arrydq.id+'</em><br/><em>title:'+arrydq.title+'</em><br/><em>url:'+arrydq.videoURL+'</em><br/>').appendTo($('#dqbf'));
												},
						error : function(res) {
							//alert(res.responseText);
							alert("0000000");
						}
					});
		 }
		 </script>
  </head>
  
  <body>
  <center>
  
<!-- 
  <img  style="height:120px;width:120px" src="pcorder?vipso=${vipso }&seriesID=${seriesID }&pric=${pric }&ordernum=${ordernum }" />
		<input type="text" value="${ordernum }">
		<input type="text" value="${vipso }">
		<input type="text" value="${seriesID }">
		<input type="text" value="${pric }">
-->
		 
		 <div id="bgh2"></div>
		 <div id="bgh3"></div>
		 <div id="list"></div>
		 <div id="dqbf"></div>
		
		</center>
  </body>
</html>
