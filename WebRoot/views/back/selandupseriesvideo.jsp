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
			var editor1 = K.create('textarea[id="tx"]', {
	
			items:["image","source"],
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

<script type="text/javascript" src="<%=path%>/js/jquery-3.1.0.min.js"></script>


</head>

<body>
	<center>
	
			查看和修改视频


<table border="1">
<tr>
<td>题目</td>
<td>描述</td>
<td>讲师</td>
<td>视频总数</td>
<td>收藏数</td>
<td>1:扶贫 0：未扶贫</td>
</tr>
<tr>



<c:forEach items="${series }" var="serie" >


<form action="<%=path%>/hsaddvideo?id=${serie.ID }" method="post">

<!--  
<input  type="hidden" name="ID"  readOnly="true" value="${serie.ID }"/>
-->

<td><input type="text" name="Title" placeholder="题目" value="${serie.title }"/></td>


<td><input type="text" name="Remark" placeholder="描述" value="${serie.remark }"/></td>
  
<td><input type="text" name="TeacherID" placeholder="讲师" value="${serie.teacherID }"/></td>

<td><input type="text" name="VideoCount" placeholder="视频总数"  value="${serie.videoCount }"/></td>
<td><input type="text" name="Collection" placeholder="收藏数"  value="${serie.collection }"/></td>



<td><input type="text" name="fupin" placeholder="1:扶贫 0：未扶贫" value="${serie.fupin }"/></td>

<td><input type="submit" value="上传视频" /></td>
</form>
</tr>

</c:forEach>

	

</table>

	</center>
</body>
</html>
