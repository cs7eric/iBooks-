<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册页面</title>

	<%--	静态包含 base 标签，css样式、jQuery 文件--%>
	<%@ include file="/pages/common/head.jsp" %>

<style type="text/css">
	h1 {
		text-align: center;
		margin-top: 300px;
		font-size:30px;
	}
	
	h1 a {
		color:red;
	}
</style>
</head>
<body>
	<div id="container">
		<div id="header">
			<%-- 静态包含 header页面--%>
			<%@ include file="/pages/common/header.jsp"%>
		</div>
		<div id="body">
			<div id="main">
				<h1>欢迎回来 <a href="index.jsp">转到主页</a></h1>
			</div>
		</div>
		<div id="footer">
			<%--	静态包含foot页面--%>
			<%@ include file="/pages/common/foot.jsp"%>
		</div>
	</div>
</body>
</html>