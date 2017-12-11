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
			var editor1 = K.create('textarea[id="tx,i"]', {
		
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
<script>
	function thirdmenuy() {
		var id = document.getElementById("thirdmenuyi").value;

		$.ajax({
			url : "geter",
			type : "POST",

			data : {
				"id" : id,

			},
			success : function(msg) {

				$("#thirdmenuer").html(" ");

				for (var i = 0; i < msg.length; i++) {

					$("#thirdmenuer").append(
							"<option value='"+msg[i].id+"'>" + msg[i].typeName
									+ "</option>");

				}

			},
			error : function(res) {
				//alert(res.responseText);
				alert("DDDD");
			}
		});
	}

	function thirdmenue() {
		var id = document.getElementById("thirdmenuer").value;

		$.ajax({
			url : "geter",
			type : "POST",

			data : {
				"id" : id,

			},
			success : function(msg) {

				$("#thirdmenusan").html(" ");

				for (var i = 0; i < msg.length; i++) {
console.log(msg[i].typeName);
					$("#thirdmenusan").append(
							"<option value='"+msg[i].id+"'>" + msg[i].typeName
									+ "</option>");

				}

			},
			error : function(res) {
				//alert(res.responseText);
				alert("DDDD");
			}
		});
	}

	function thirdmenusa() {
		var id = document.getElementById("thirdmenusan").value;

		$
				.ajax({
					url : "getyi",
					type : "POST",

					data : {
						"id" : id
					},
					success : function(msg) {
						$("#thirdmenuernamediv").html("");
						$("#thirdmenuernamediv")
								.html(
										'<input type="text" name="fname" id="thirdmenusanname" placeholder="菜单名称" value="'+msg.typeName+'"/>');

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
	
			

		<form action="<%=path%>/addseries" method="post">


 三级菜单 


			<select name="TypeValue" onChange="thirdmenuy()" id="thirdmenuyi">
				<c:forEach items="${type }" var="bs">
					<option value="${bs.ID }">${bs.typeName }</option>
				</c:forEach>
			</select> <select name="Type2Value" id="thirdmenuer" onChange="thirdmenue()">
			</select> <select name="Type3Value" id="thirdmenusan"
				onChange="thirdmenusa()">
			</select>






			<br /><input type="text" name="Title" placeholder="题目" /> <br />
			<br /><textarea type="text" name="PicURL" placeholder="图片" id="tx" style="width: 40px; height: 10px";></textarea> <br />
			<br /><input type="text" name="PicURL2" placeholder="图片" /> <br />
			<br /><input type="text" name="ThuPicURL" placeholder="图片" /> <br />
		
			<br /><input type="text" name="Remark" placeholder="描述" /> <br />
			<br /><input type="text" name="TeacherID" placeholder="讲师" value="0"/> <br />
			<br /><input type="text" name="VideoCount" placeholder="视频总数" value="0"/> <br />
			
			
			<br /><input type="text" name="Collection" placeholder="收藏数" value="0"/> <br />
			<br /><input type="text" name="ClickRate" placeholder="播放数" value="0"/> <br />
			<br /><input type="text" name="PmtsTot" placeholder="购买总数" value="0"/> <br />
			<br /><input type="text" name="IsValid" placeholder="是否有效" value="0"/> <br />
			
			<br /><input type="text" name="IsPrice" placeholder="是否收费" value="0"/> <br />
			<br /><input type="text" name="Price" placeholder="原始价格" value="0"/> <br />
			
			<br /><input type="text" name="IsDiscount" placeholder="是否打折" value="0"/> <br />
			<br /><input type="text" name="RealPrice" placeholder="实际价格" value="0"/> <br />
			
			
			<br /><input type="text" name="CreateUser" placeholder="创建人" value="0"/> <br />
			<br /><input type="text" name="TimeLimit" placeholder="购买有效天数" value="0"/> <br />
			<br /><input type="text" name="fupin" placeholder="1:扶贫 0：未扶贫" value="0"/> <br />
			
			<input type="submit" value="Submit" />

		</form>

		<br /> <br />
		<div></div>

	</center>
</body>
</html>
