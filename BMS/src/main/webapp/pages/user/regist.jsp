<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会员注册页面</title>
	<!-- 写 base 标签 永远固定相对路径-->


	<%--	静态包含 base 标签，css样式、jQuery 文件--%>
	<%@ include file="/pages/common/head.jsp" %>


	<script type="text/javascript">

		// 页面加载完成之后
		$(function() {

			// 给注册绑定单击事件
			$("#sub_btn").click(function() {

				// 验证用户名：必须由字母，数字，下划线吃、组成，并且长度为 5-12
				//1.  获取输入框的内容
				let usernameText = $("#username").val();
				//2.  创建正则表达式
				let usernamePatt = /^\w{5,12}$/;
				//3. 使用 test 方法验证
				if(!usernamePatt.test(usernameText)){
					//4. 提示用户结果
					$("span.errorMsg").text("用户名不合法");
					return false;
				}

				// 验证用户名：必须由字母，数字，下划线吃、组成，并且长度为 5-12
				//1.  获取输入框的内容
				let passwordText = $("#password").val();
				//2.  创建正则表达式
				let passwordPatt = /^\w{5,12}$/;
				//3. 使用 test 方法验证
				if(!passwordPatt.test(passwordText)){
					//4. 提示用户结果
					$("span.errorMsg").text("密码不合法");
					return false;
				}

				// 验证确认密码
				//1. 获取确认密码内容
				let repwdText = $("#repwd").val();
				//2. 和密码比较
				if(repwdText !== passwordText){
					$("span.errorMsg").text("前后密码不一致");
					return false;
				}

				//验证邮箱
				//1. 获取邮箱里的内容
				let emailText = $("#email").val();
				//2. 创建正则表达式
				let emailPatt = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
				//3. 使用 test 方法验证是否合法
				if(!emailPatt.test(emailText)){

					//4. 提示用户
					$("span.errorMsg").text("邮箱格式错误");
					return false;
				}

				//验证码：现在只验证用户是否已输入
				let codeText = $("#code").val();

				$.trim(codeText);
				if(codeText == null || codeText === ' '){
					$("span.errorMsg").text("验证码不能为空");
					return false;
				}

			});
		});
	</script>
<style type="text/css">
	.login_form{
		height:420px;
		margin-top: 25px;
	}

	span{
		color:red;
	}
	
</style>
</head>
<body>
		<div id="login_header">
			<img class="logo_img" alt="" src="static/img/logo.gif" >
		</div>
		
			<div class="login_banner">
			
				<div id="l_content">
					<span class="login_word">欢迎注册</span>
				</div>
				
				<div id="content">
					<div class="login_form">
						<div class="login_box">
							<div class="tit">
								<h1>注册会员</h1>
								<span class="msg">
									${requestScope.msg }
								</span>
							</div>
							<div class="form">
								<form action="userServlet" method="post">
									<input type="hidden" name="action" value="regist"/>
									<label>用户名称：</label>
									<input class="itxt" type="text" placeholder="请输入用户名"
										       autocomplete="off" tabindex="1" name="username" id="username"
										       value="${requestScope.username }"/>
									<br />
									<br />
									<label>用户密码：</label>
									<input class="itxt" type="password" placeholder="请输入密码"
										       autocomplete="off" tabindex="1" name="password" id="password" />
									<br />
									<br />
									<label>确认密码：</label>
									<input class="itxt" type="password" placeholder="确认密码"
										       autocomplete="off" tabindex="1" name="repwd" id="repwd" />
									<br />
									<br />
									<label>电子邮件：</label>
									<input class="itxt" type="text" placeholder="请输入邮箱地址"
										       autocomplete="off" tabindex="1" name="email" id="email"
									           value="${requestScope.email}"/>
									<br />
									<br />
									<label>验证码：</label>
									<input class="itxt" type="text" name="code" style="width: 150px;" id="code"/>
									<img alt="" src="static/img/code.bmp" style="float: right; margin-right: 40px">
									<br />
									<br />
									<input type="submit" value="注册" id="sub_btn" />
									
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>


		<%--	静态包含foot页面--%>
		<%@ include file="/pages/common/foot.jsp"%>

</body>
</html>