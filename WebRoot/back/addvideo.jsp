<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page import="java.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'upload.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="<%=path%>/js/jquery-3.1.0.min.js"></script>
<script src="<%=basePath%>js/plupload.full.min.js"></script>


</head>

<body>
	<center>
<a onclick="addvi()">添加</a>
		<script>
	function addvi() {
	
            var urr=document.getElementsByClassName("urrl");
			
			
			var _list = [];  
  
for (var i = 0; i < urr.length; i++) {  
    _list[i] = urr[i].value;  
    	console.log("5555"+_list[i]);
}  
			
		$.ajax({
			url : "<%=path%>/addvide",
			type : "POST",
			
			data : {
				"urrl" : _list
			},
			success : function(msg) {
		alert(msg)
				

			},
			error : function(res) {
				//alert(res.responseText);
				alert("DDDD");
			}
		});
	}
</script>
	
		<br />
		
		<form action="<%=path%>/addvide" method="post">
		<div id="container">
			<input type="text" name="SID" placeholder="seriesid" value="${id }"/>
			<input type="text" name="Title" placeholder="标题" />
			<input type="text" name="FileName" placeholder="文件名" />
			<input type="text" name="ClickRate" placeholder="点击数" value="0"/>
			<input type="text" name="ZanCts" placeholder="赞" value="0"/>
			<input type="text" name="IsValid" placeholder="是否有效" value="0"/>
			
			<input type="text" name="IsPrice" placeholder="是否收费" value="0"/>
			<input type="text" name="Sort" placeholder="排序" value="0"/>
			<input type="text" name="TeacherID" placeholder="教师" value="0"/>
			<input type="text" name="des" placeholder="视频的描述" />
			<input type="text" name="fupin" placeholder="1:扶贫 0：未扶贫" value="0"/>
			
			

			<p>
				<button id="pickfiles">选择文件</button>
				<button id="uploadfiles">开始上传</button>
			</p>
		
			<div id="filelist"
				stytle="border:1px red solid;">
				
			</div>

		</div>
		<input type="submit" value="修改" />
</form>
		<script type="text/JavaScript">
			var uploader = new plupload.Uploader({						runtimes : 'HTML5,flash,silverlight,html4',
						browse_button : 'pickfiles',
						Container : document.getElementById('container'), //展现上传文件列表的容器

						url : '<%=basePath%>testFile', //服务器端接收和处理上传文件的脚本地址
						flash_swf_url : '<%=basePath%>js/Moxie.swf', //flash上传组件的url地址,当使用flash上传方式会用到该参数.
						silverlight_xap_url : '<%=basePath%>js/Moxie.xap', //silverlight上传组件的url地址，当使用silverlight上传方式会用到该参数。

						filters : {
							max_file_size : '1000mb', //最大上传文件大小

						},

						init : { //当Plupload初始化完成后触发
							PostInit : function() { //当Init事件发生后触发
								document.getElementById('filelist').innerHTML = '';
								document.getElementById('uploadfiles').onclick = function() {
									uploader.start();
									return false;
								};
							},

							FilesAdded : function(up, files) { //当文件添加到上传队列后触发,当上选择好文件后就将选择好的文件显示在自己规定的div中显示
								plupload
										.each(
												files,
												function(file) {
													document
															.getElementById('filelist').innerHTML += '<div id="' + file.id + '">'
															+ file.name
															+ ' ('
															+ plupload
																	.formatSize(file.size)
															+ ') <b></b><em></em></div>';
													

													uploader.setOption(
															"multipart_params",
															{
																
															});
												});

							},

							FileUploaded : function(uploader, file, data) {

								document.getElementById(file.id)
										.getElementsByTagName('em')[0].innerHTML = '<input id="" name="urrl" class="urrl" type="text" value="'+ data.response + '"></input>';

							},
							Error : function(up, err) { //发生错误时触发
								document.getElementById('console').appendChild(
										document
												.createTextNode("\nError #"
														+ err.code + ": "
														+ err.message));
							},

						}
					});

			uploader.init();
		</script>



	</center>

</body>
</html>
