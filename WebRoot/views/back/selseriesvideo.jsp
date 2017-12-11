<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>多级菜单</title>
<meta charset="utf-8">
<link rel="stylesheet" href="<%=basePath%>css/iframe.css" />
</head>

<body>


	<div class="layout_left_menu">
		<ul id="nav">

			
		<!--  1-->
<c:forEach items="${type }" var="bs">
		<li>
			<h2>
				<span>+</span> ${bs.typeName }
				
			</h2>
			<ul><!--  2-->
				<c:forEach items="${as }" var="bsd">
				<c:if test="${bsd.parentID == bs.ID }">
				<li>
					<h2>
						<span>+</span><a href="<%=basePath%>backselserieservideo?id=${bsd.ID }" target="menuFramedd"> ${bsd.typeName }</a>
					</h2>
					<ul>
						<!--  3-->
						<c:forEach items="${asd }" var="asd">
						<c:if test="${asd.parentID == bsd.ID }">
						<li>
							<h2><a href="<%=basePath%>backselseriessanvideo?id=${asd.ID }" target="menuFramedd">${asd.typeName }</a></h2>
						</li>
						</c:if>
						</c:forEach>
						<!--  3-->
					</ul>
				</li>
				</c:if>
				</c:forEach>
				<!--  2-->
			</ul>
		</li>
</c:forEach>

		<!--1  -->
		</ul>
	</div>

	<div class="layout_right_content">

		<div id="page_content">
			<iframe id="menuFramedd" name="menuFramedd" src=""
				style="overflow:visible;" scrolling="yes" frameborder="no"
				width="100%" height="100%"></iframe>
		</div>

	</div>


	<script type="text/javascript">
		var h2s = document.getElementsByTagName('h2');

		for (var i = 0; i < h2s.length; i++) {
			//点击h2的时候根据h2的开关状态，打开或者关闭列表
			//开关默认是true，列表默认关闭。
			h2s[i].onOff = true;
			h2s[i].onclick = function() {
				//关闭其他列表
				var uls = this.parentNode.parentNode.getElementsByTagName('ul');

				for (var i = 0; i < uls.length; i++) {
					//如果uls[i]是当前点击的那个列表就跳过，不清除。
					if (uls[i] == this.nextElementSibling) {
						continue; //跳过
					}
					uls[i].className = '';
					uls[i].previousElementSibling.onOff = true;
				}
				//根据开关的状态打开或者关闭当前的列表。
				if (this.onOff) {
					this.nextElementSibling.className = 'active';
				} else {
					this.nextElementSibling.className = '';
				}
				this.onOff = !this.onOff;
			};
		}
	</script>
</body>
</html>
