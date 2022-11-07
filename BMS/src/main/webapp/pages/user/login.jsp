<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>

	<%--	静态包含 base 标签，css样式、jQuery 文件--%>
	<%@ include file="/pages/common/head.jsp" %>
	<style>
		span{
			color: red;
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
			<div class="login_banner">
				<div id="content">
					<div class="login_form">
						<div class="login_box">
							<div class="tit">
								<h1>管理员登录</h1>
								<a href="pages/user/regist.jsp">立即注册</a>
							</div>
							<div class="msg_cont">
								<b></b>
								<span class="errorMsg" color>
									${empty requestScope.msg? "请输入用户名与密码" : requestScope.msg}
								</span>
							</div>
							<div class="form">
								<form action="userServlet" method="post">
									<input type="hidden" name="action" value="login" />
									<label>用户名称：</label>
									<input class="itxt" type="text" placeholder="请输入用户名"
										   autocomplete="off" tabindex="1" name="username"
										   value="${requestScope.username}"/>
									<br />
									<br />
									<label>用户密码：</label>
									<input class="itxt" type="password" placeholder="请输入密码" autocomplete="off" tabindex="1" name="password" />
									<br />
									<br />
									<div class="sub_btn">
										<input type="submit" value="登录" id="sub_btn" />
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="footer">
			<%--	静态包含foot页面--%>
			<%@ include file="/pages/common/foot.jsp"%>
		</div>
	</div>
</body>
</html>