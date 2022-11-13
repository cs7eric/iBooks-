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
		border-radius:10px;
		width:350px;
		height:35px;
		text-align: center;
	}

	.book_edit{

		width:700px;
		height:500px;
		background-color:rgba(255,255,255,0.8);
		border-radius:16px;
		left:30%;
		position:relative;
	}

	.edit_table{
		border-spacing:20px;
	}

	.form table input {
		outline: none;
		width: 360px;
		margin-left: 70px;
		margin-top: 10px;
		height: 40px;
		padding-left: 20px;
		color: #444547;
		font-size: 16px;
	}

	.form table input::placeholder {
		font-size: 14px;
		color: #dfdcdc;
	}

	.edit {
		width: 500px;
		height: 35px;
		border-radius:7px;

	}
	.edit_td{
		width:70px;
	}

	.submit_btn{

		position:absolute;
		left:25%;
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
		<div style="width:100%;height:200px;"></div>
			<form action="manager/bookServlet" method="get">
				<input type="hidden" name="action"  value="${empty requestScope.book.id ? "add" : "update"}"/>
				<input type="hidden" name="id" value="${requestScope.book.id}"/>

				<div class="book_edit">
					<table class="edit_table">

							<tr>
								<td class="edit_td">
									ISBN码：
								</td>

								<td>
									<input name="ISBN" class="edit" type="text" value="${requestScope.book.ISBN}"/>
								</td>
							</tr>

							<tr>

								<td class="edit_td">
									名    称：
								</td>
								<td>
									<input name="name" class="edit" type="text" value="${requestScope.book.name}"/>
								</td>
							</tr>

							<tr>
								<td class="edit_td">
									作    者：
								</td>
								<td>
									<input name="author" class="edit" type="text" value="${requestScope.book.author}"/>
								</td>
							</tr>

							<tr>
								<td class="edit_td">
									价    格：
								</td>
								<td>
									<input name="price" class="edit" type="text" value="${requestScope.book.price}"/>
								</td>
							</tr>

							<tr>
								<td class="edit_td">
									数    量：
								</td>
								<td>
									<input name="stock" class="edit" type="text" value="${requestScope.book.stock}"/>
								</td>
							</tr>

							<tr>
								<td class="edit_td">
									简    介：
								</td>
								<td>
									<input name="intro" class="edit" type="text" value="${requestScope.book.intro}">
								</td>
							</tr>

							<tr>
								<td class="edit_td">
									路    径：
								</td>
								<td>
									<input name="imgPath" class="edit" type="text" value="${requestScope.book.imgPath}">
								</td>
							</tr>
						</table>
					<input type="submit" class="submit_btn" value="提交"/>
				</div>
			</form>
		</div>
	</div>
</div>

</body>
</html>