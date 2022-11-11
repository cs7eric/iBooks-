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
			<%@ include file="/pages/common/header_new.jsp"%>
		</div>
		<div id="login_body">
			<div class="login_banner">

					<div class="login_form">
						<div class="login_box">
							<div class="tit">
								<h1>管理员登录</h1>
							</div>
								<span class="msg">
									${requestScope.msg}
								</span>
							<div class="form">
								<form action="userServlet" method="post">
									<input type="hidden" name="action" value="login" />
									<table>
										<tr>
											<td>
												<input class="itxt" type="text" placeholder="请输入用户名"
													   autocomplete="off" tabindex="1" name="username"
													   value="${requestScope.username}"/>
											</td>
										</tr>

										<tr>
											<td>
												<input class="itxt" type="password" placeholder="请输入密码"
													   autocomplete="off" tabindex="1" name="password" />
											</td>
										</tr>

										<tr>
											<td>
												<input type="submit" value="登录" id="sub_btn" />
											</td>
										</tr>
									</table>


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
		<canvas id="canvas"></canvas>
		<script>
			//宇宙特效
			"use strict";
			var canvas = document.getElementById('canvas'),
					ctx = canvas.getContext('2d'),
					w = canvas.width = window.innerWidth,
					h = canvas.height = window.innerHeight,

					hue = 217,
					stars = [],
					count = 0,
					maxStars = 2500;//星星数量

			var canvas2 = document.createElement('canvas'),
					ctx2 = canvas2.getContext('2d');
			canvas2.width = 100;
			canvas2.height = 100;
			var half = canvas2.width / 2,
					gradient2 = ctx2.createRadialGradient(half, half, 0, half, half, half);
			gradient2.addColorStop(0.025, '#CCC');
			gradient2.addColorStop(0.1, 'hsl(' + hue + ', 61%, 33%)');
			gradient2.addColorStop(0.25, 'hsl(' + hue + ', 64%, 6%)');
			gradient2.addColorStop(1, 'transparent');

			ctx2.fillStyle = gradient2;
			ctx2.beginPath();
			ctx2.arc(half, half, half, 0, Math.PI * 2);
			ctx2.fill();

			// End cache

			function random(min, max) {
				if (arguments.length < 2) {
					max = min;
					min = 0;
				}

				if (min > max) {
					var hold = max;
					max = min;
					min = hold;
				}

				return Math.floor(Math.random() * (max - min + 1)) + min;
			}

			function maxOrbit(x, y) {
				var max = Math.max(x, y),
						diameter = Math.round(Math.sqrt(max * max + max * max));
				return diameter / 2;
				//星星移动范围，值越大范围越小，
			}

			var Star = function () {

				this.orbitRadius = random(maxOrbit(w, h));
				this.radius = random(60, this.orbitRadius) / 18;
				//星星大小
				this.orbitX = w / 2;
				this.orbitY = h / 2;
				this.timePassed = random(0, maxStars);
				this.speed = random(this.orbitRadius) / 500000;
				//星星移动速度
				this.alpha = random(2, 10) / 10;

				count++;
				stars[count] = this;
			}

			Star.prototype.draw = function () {
				var x = Math.sin(this.timePassed) * this.orbitRadius + this.orbitX,
						y = Math.cos(this.timePassed) * this.orbitRadius + this.orbitY,
						twinkle = random(10);

				if (twinkle === 1 && this.alpha > 0) {
					this.alpha -= 0.05;
				} else if (twinkle === 2 && this.alpha < 1) {
					this.alpha += 0.05;
				}

				ctx.globalAlpha = this.alpha;
				ctx.drawImage(canvas2, x - this.radius / 2, y - this.radius / 2, this.radius, this.radius);
				this.timePassed += this.speed;
			}

			for (var i = 0; i < maxStars; i++) {
				new Star();
			}

			function animation() {
				ctx.globalCompositeOperation = 'source-over';
				ctx.globalAlpha = 0.5; //尾巴
				ctx.fillStyle = 'hsla(' + hue + ', 64%, 6%, 2)';
				ctx.fillRect(0, 0, w, h)

				ctx.globalCompositeOperation = 'lighter';
				for (var i = 1, l = stars.length; i < l; i++) {
					stars[i].draw();
				}

				window.requestAnimationFrame(animation);
			}

			animation();
		</script>
	</div>
</body>
</html>