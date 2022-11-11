<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>注册页面</title>


    <!-- <%-- 静态包含 base 标签，css样式、jQuery 文件--%> -->
    <%@ include file="/pages/common/head.jsp" %>


    <script type="text/javascript">

        // 页面加载完成之后
        $(function () {


            //给验证码图片绑定单击事件
            $("#code_img").click(function () {
                this.src = "${basePath}kaptcha.jpg?d=" + new Date();
            });



            // 给注册绑定单击事件
            $("#sub_btn").click(function () {

                // 验证用户名：必须由字母，数字，下划线吃、组成，并且长度为 5-12
                //1.  获取输入框的内容
                let usernameText = $("#username").val();
                //2.  创建正则表达式
                let usernamePatt = /^\w{5,12}$/;
                //3. 使用 test 方法验证
                if (!usernamePatt.test(usernameText)) {
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
                if (!passwordPatt.test(passwordText)) {
                    //4. 提示用户结果
                    $("span.errorMsg").text("密码不合法");
                    return false;
                }

                // 验证确认密码
                //1. 获取确认密码内容
                let repwdText = $("#repwd").val();
                //2. 和密码比较
                if (repwdText !== passwordText) {
                    $("span.errorMsg").text("前后密码不一致");
                    return false;
                }

                //验证邮箱
                //1. 获取邮箱里的内容
                let emailText = $("#email").val();
                //2. 创建正则表达式
                let emailPatt = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
                //3. 使用 test 方法验证是否合法
                if (!emailPatt.test(emailText)) {

                    //4. 提示用户
                    $("span.errorMsg").text("邮箱格式错误");
                    return false;
                }

                //验证码：现在只验证用户是否已输入
                let codeText = $("#code").val();

                $.trim(codeText);
                if (codeText == null || codeText === ' ') {
                    $("span.errorMsg").text("验证码不能为空");
                    return false;
                }

            });
        });
    </script>
    <style type="text/css">




        #regist_body {
            z-index: 999;
            position: absolute;
            top: 50%;
            margin-top: -250px;
            left: 50%;
            margin-left: -250px;
            width: 500px;
            height: 500px;


        }

        .tit {
            width: 500px;
            height: 70px;

        }

        .tit h1 {
            font-size: 36px;
            font-family: '宋体';
            width: 500px;
            text-align: center;
            color: #fff;
        }

        .tit .msg {
            color: red;
            font-size: 16px;
            display: block;
            text-align: center;
            margin-top: 3px;
        }


        .form table input {
            background: url(0) no-repeat;
            outline: none;
            border: 1px solid rgb(122, 153, 226);
            width: 360px;
            margin-left: 70px;
            margin-top: 10px;
            height: 40px;
            padding-left: 20px;
            color: #fbfbfb;
            font-size: 16px;
        }

        .form table input::placeholder {
            font-size: 14px;
            color: #dfdcdc;
        }



        .form table img {
            float: right;
            margin-right: 80px;
            margin-top: 10px;
            width: 100px;
            height: 40px;
        }

        #sub_btn {
            width: 80px;
            height: 40px;
            padding-left: 0;
            border-radius:9px;
        }

        .login_banner {
            border-radius: 40px;
            color: #fff;
            height:430px;
        }

        .itxt {
            border-radius: 9px;
        }
        .password {
            border-radius:9px;
        }

    </style>
</head>

<body>
    <div id="container">
        <div id="header">

            <!-- <%-- 静态包含 header页面--%> -->
            <%@ include file="/pages/common/header_new.jsp" %>
        </div>
        <div id="regist_body">
            <div class="login_box">
                <div class="tit">
                    <h1>Welcome to Register</h1>
                    <span class="msg">
                        ${requestScope.msg }
                    </span>
                </div>
                <div class="form">
                    <form action="userServlet" method="post">
                        <input type="hidden" name="action" value="regist" />
                        <table>
                            <tr>
                                <td>
                                    <input class="itxt" type="text" placeholder="用户名" autocomplete="off" tabindex="1"
                                        name="username" id="username" value="${requestScope.username}" />
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <input class="itxt" type="password" placeholder="密码" autocomplete="off"
                                        tabindex="1" name="password" id="password" />
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <input class="password" type="password" placeholder="确认密码" autocomplete="off"
                                        tabindex="1" name="repwd" id="repwd" />
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <input class="password" type="text" placeholder="请输入邮箱地址" autocomplete="off"
                                        tabindex="1" name="email" id="email" value="${requestScope.email}"/>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <input class="itxt" placeholder="验证码" type="text" name="code"
                                        style="width: 150px;" id="code" />
                                    <img id="code_img" alt="" src="kaptcha.jpg">
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <input type="submit" value="注册" id="sub_btn" />
                                </td>
                            </tr>

                        </table>
                    </form>
                </div>
            </div>
        </div>
        <div id="footer">
            <!-- <%-- 静态包含foot页面--%> -->
<%--            <%@ include file="/pages/common/foot.jsp" %> --%>
        </div>
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

</body>

</html>