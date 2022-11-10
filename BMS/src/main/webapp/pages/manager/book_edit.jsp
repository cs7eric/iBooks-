<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>编辑图书</title>

<%--	静态包含 base 标签，css样式、jQuery 文件--%>
	<%@ include file="/pages/common/head.jsp" %>
	<style type="text/css">
	h1 {
		text-align: center;
		margin-top: 200px;
	}
	
	h1 a {
		color:red;
	}
	
	input {
		text-align: center;
	}

	#main table{
		margin: auto;
		margin-top: 80px;
		border-collapse: collapse;
		color:#f6f6f6;
	}

	#main table td{
		width: 120px;
		text-align:center;
		padding: 10px;
	}

	#main_edit {

		position: absolute;
		top:40%;
		left:20%;
	}
</style>
</head>
<body>
<div id="container">
	<div id="header">

		<%-- 静态包含 header页面--%>
		<%@ include file="/pages/common/header_new.jsp"%>
	</div>
	<div id="body">

		<div id="main_edit">
			<form action="manager/bookServlet" method="get">
				<input type="hidden" name="action"  value="${empty requestScope.book.id ? "add" : "update"}"/>
				<input type="hidden" name="id" value="${requestScope.book.id}"/>
				<table>
					<tr>
						<td>ISBN</td>
						<td>名称</td>
						<td>作者</td>
						<td>价格</td>
						<td>库存</td>
						<td>简介</td>
						<td colspan="2">操作</td>
					</tr>
					<tr>
						<td><input name="ISBN" type="text" value="${requestScope.book.ISBN}"/></td>
						<td><input name="name" type="text" value="${requestScope.book.name}"/></td>
						<td><input name="author" type="text" value="${requestScope.book.author}"/></td>
						<td><input name="price" type="text" value="${requestScope.book.price}"/></td>
						<td><input name="stock" type="text" value="${requestScope.book.stock}"/></td>
						<td><input name="intro" type="text" value="${requestScope.book.intro}"></td>
						<td><input type="submit" value="提交"/></td>
					</tr>
				</table>
			</form>


		</div>


	</div>
	<div id="footer">
		<%--	静态包含foot页面--%>
<%--		<%@ include file="/pages/common/foot.jsp"%>--%>
	</div>
</div>
		



</body>
</html>