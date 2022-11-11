<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书管理</title>

<%--	静态包含 base 标签，css样式、jQuery 文件--%>
	<%@ include file="/pages/common/head.jsp" %>

	<script type="text/javascript">
		$(function(){

			$("a.deleteClass").click(function(){
				return confirm("你确定删除  " + $(this).parent().parent().find("td:first").text() + "  吗?");
			});
		});
	</script>
	<style>
		.page_nav{
			position:absolute;
			top:80%;
			left:35%;
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
			<div id="main">
				<table class="book_manager_table">
					<tr>
						<td>ISBN</td>
						<td>名称</td>
						<td>作者</td>
						<td>价格</td>
						<td>库存</td>
						<td>简介</td>
						<td colspan="2">操作</td>
					</tr>
					<c:forEach items="${requestScope.page.items}" var="book">
						<tr>
							<td>${book.ISBN}</td>

<%--							--%>
							<td>${book.name}</td>
							<td>${book.author}</td>
							<td>${book.price}</td>
							<td>${book.stock}</td>
							<td><a href="manager/bookServlet?action=briefIntro&id=${book.id}">详情</a></td>
							<td><a href="manager/bookServlet?action=getBook&id=${book.id}">修改</a></td>
							<td><a class="deleteClass" href="manager/bookServlet?action=delete&id=${book.id}">删除</a></td>
						</tr>
					</c:forEach>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><a href="/iBooks/pages/manager/book_edit.jsp">添加图书</a></td>
					</tr>
				</table>
				<div class="page_nav">
					<%@ include file="/pages/common/page_nav.jsp"%>
				</div>
			</div>
			<div id="footer">
				<%--	静态包含foot页面--%>
<%--				<%@ include file="/pages/common/foot.jsp"%>--%>
			</div>
		</div>
	</div>
</body>
</html>