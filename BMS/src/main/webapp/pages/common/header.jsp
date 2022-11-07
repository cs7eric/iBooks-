<%--
  Created by IntelliJ IDEA.
  User: CSQ-PC
  Date: 2022/11/6
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .index{
            position: absolute;
            top:0;
        }
        .button_home{
            border:none;
            border-radius:0;
            background-color:#49afd0;
            color:#f6f6f6;
            position:absolute;
            top:0;
            width:100px;
        }

        .button_total{
            border:none;
            border-radius:0;
            background-color:#8ecd51;
            color:#f6f6f6;
            position:absolute;
            top:0;
            left:107px;
            width:75px;
            front-family:"宋体";
        }


    </style>
</head>
<body>
<div class="header_list" id="left_list">
    <div class="index">
        <a href="manager/bookServlet?action=index">
            <button class="button_home">iBooks Home</button>
            <button class="button_total">${requestScope.totalCount} Books</button>
        </a>

    </div>
</div>

<div class="header_list" id="right_list" >
    <a href="pages/user/login.jsp">登录</a> |
    <a href="pages/user/regist.jsp">注册</a> &nbsp;&nbsp;
    <a href="pages/manager/manager.jsp">后台管理</a>
</div>
</body>
</html>
