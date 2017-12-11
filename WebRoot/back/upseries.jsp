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
			var editor1 = K.create('textarea[id="as"]', {
	
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











<form action="<%=path%>/upserieser?ID=${se.ID }" method="post">

<input type="text" name="Title" placeholder="题目" value="${se.title }"/></td>
<br/>
<textarea id="as" name="PicURL">${se.picURL }</textarea></td><br/>
<!-- 
<td><textarea id="txb" name="PicURL2">${se.picURL2 }</textarea></td>
 
<td><textarea id="txc" name="thuPicURL">${se.thuPicURL }</textarea></td>
  -->
<input type="text" name="Remark" placeholder="描述" value="${se.remark }"/>
  
<input type="text" name="TeacherID" placeholder="讲师" value="${se.teacherID }"/>

<input type="text" name="VideoCount" placeholder="视频总数"  value="${se.videoCount }"/>
<input type="text" name="Collection" placeholder="收藏数"  value="${se.collection }"/>


<input type="text" name="ClickRate" placeholder="播放数"  value="${se.clickRate }"/>
<input type="text" name="PmtsTot" placeholder="购买总数"  value="${se.pmtsTot }"/> 
<input type="text" name="IsValid" placeholder="是否有效" value="${se.isValid }"/>
<input type="text" name="IsPrice" placeholder="是否收费" value="${se.isPrice }"/>
<input type="text" name="Price" placeholder="原始价格" value="${se.price }"/>

<input type="text" name="IsDiscount" placeholder="是否打折" value="${se.isDiscount }"/>
<input type="text" name="RealPrice" placeholder="实际价格" value="${se.realPrice }"/>
<input type="text" name="CreateUser" placeholder="创建人" value="${se.createUser }" readOnly="true"/>
<input type="text" name="TimeLimit" placeholder="购买有效天数" value="${se.timeLimit }"/>
<input type="text" name="fupin" placeholder="1:扶贫 0：未扶贫" value="${se.fupin }"/>
<br/>
<input type="submit" value="修改" />
</form>




	


	</center>
</body>
</html>
