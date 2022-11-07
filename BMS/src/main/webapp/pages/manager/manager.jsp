<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>后台管理</title>

	<%--	静态包含 base 标签，css样式、jQuery 文件--%>
	<%@ include file="/pages/common/head.jsp" %>

	<style type="text/css">
	h1 {
		text-align: center;
		margin-top: 300px;
		font-size:25px
	}

	.manager{
		position:absolute;
		left:130px;
		top:0;
	}

	.button_manager{
		border:none;
		border-radius:0;
		background-color:#90a5a8;
		color:#f6f6f6;
		position:absolute;
		top:0;
		left:70px;
		width:75px;
		height:17px;
		font-size:8px;
		font-family: Microsoft JhengHei,"楷体";
	}
</style>
</head>
<body>
<div id="container">
	<div id="header">

		<%-- 静态包含 header页面--%>
		<%@ include file="/pages/common/header.jsp"%>
<%--		<%@ include file="/pages/common/manager_menu.jsp"%>--%>
		<div class="manager">
			<a href="manager/bookServlet?action=page">
				<button class="button_manager">图书管理</button>
			</a>
		</div>
	</div>
	<div id="body">
		<div id="main">
			<h1>欢迎管理员进入后台管理系统</h1>
		</div>
	</div>
	<div id="footer">
		<%--	静态包含foot页面--%>
		<%@ include file="/pages/common/foot.jsp"%>
	</div>
</div>











</body>
</html>