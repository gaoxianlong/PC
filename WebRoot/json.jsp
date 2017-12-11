<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'json.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <script type="text/javascript" src="<%=path%>/js/jquery-3.1.0.min.js"></script>
  <script>
        
        function menu() {
          
		$.ajax({
			url : "getMulujson",
			type : "POST",
			
			data : {
			
			},
			success : function(msg) {
				for(var i=0;i++;i<msg.length){
				
				
				
					$("#id").html("<div>msg[i].id</div>");
				}
			
			alert(msg[1].children[0].children[0].id);
			

			},
			error : function(res) {
				//alert(res.responseText);
				alert("DDDD");
			}
		});
	}
	
        
        
        
        
        
        
        </script>
        
        
        <a onclick="menu()">json</a>
        <div id="di"></div>
  </body>
</html>
