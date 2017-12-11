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
<td>图一</td>
<td>图二</td>
<td>图三</td>
<td>描述</td>
<td>讲师</td>
<td>视频总数</td>
<td>收藏数</td>
<td>播放数</td>
<td>购买总数</td>
<td>是否有效</td>
<td>是否收费</td>
<td>原始价格</td>
<td>是否打折</td>
<td>实际价格</td>
<td>创建人</td>
<td>购买有效天数</td>
<td>1:扶贫 0：未扶贫</td>


</tr>
<tr>



<c:forEach items="${series }" var="serie" >


<form action="<%=path%>/hsselseries?ID=${serie.ID }" method="post">

<!--  
<input  type="hidden" name="ID"  readOnly="true" value="${serie.ID }"/>
-->
<input  name="TypeValue"  type="hidden" readOnly="true" value="${serie.typeValue }"/>
<input name="Type2Value"  type="hidden" readOnly="true" value="${serie.type2Value }"/>
<input  name="Type3Value"  type="hidden" readOnly="true" value="${serie.type3Value }"/>
<td><input type="text" name="Title" placeholder="题目" value="${serie.title }"/></td>

<td>${serie.picURL }</td>

<td>${serie.picURL2 }</td>
 
<td>${serie.thuPicURL }</td>
 
<td><input type="text" name="Remark" placeholder="描述" value="${serie.remark }"/></td>
  
<td><input type="text" name="TeacherID" placeholder="讲师" value="${serie.teacherID }"/></td>

<td><input type="text" name="VideoCount" placeholder="视频总数"  value="${serie.videoCount }"/></td>
<td><input type="text" name="Collection" placeholder="收藏数"  value="${serie.collection }"/></td>


<td><input type="text" name="ClickRate" placeholder="播放数"  value="${serie.clickRate }"/> </td>
<td><input type="text" name="PmtsTot" placeholder="购买总数"  value="${serie.pmtsTot }"/> </td>
<td><input type="text" name="IsValid" placeholder="是否有效" value="${serie.isValid }"/></td>
<td><input type="text" name="IsPrice" placeholder="是否收费" value="${serie.isPrice }"/></td>
<td><input type="text" name="Price" placeholder="原始价格" value="${serie.price }"/></td>

<td><input type="text" name="IsDiscount" placeholder="是否打折" value="${serie.isDiscount }"/></td>
<td><input type="text" name="RealPrice" placeholder="实际价格" value="${serie.realPrice }"/></td>
<td><input type="text" name="CreateUser" placeholder="创建人" value="${serie.createUser }" readOnly="true"/></td>
<td><input type="text" name="TimeLimit" placeholder="购买有效天数" value="${serie.timeLimit }"/></td>
<td><input type="text" name="fupin" placeholder="1:扶贫 0：未扶贫" value="${serie.fupin }"/></td>
<!--  
<td><input type="text" name="PublishTime" placeholder="发布时间" value="${serie.publishTime }"/></td>

<td><input type="text" name="CreateTime" placeholder="创建时间" value="${serie.createTime }"/></td>
-->
<td><input type="submit" value="修改" /></td>
</form>
</tr>

</c:forEach>

	

</table>

	</center>
</body>
</html>
