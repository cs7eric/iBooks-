<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Created by IntelliJ IDEA. User: CSQ-PC Date: 2022/11/7 Time: 11:13 To change this template use File | Settings | File Templates. --%>
<html>

<head>
    <title>图书详情页</title>
    <%-- 静态包含 base 标签，css样式、jQuery 文件--%>
    <%@ include file="/pages/common/head.jsp" %>
    <style>
        * {
            padding: 0;
            margin: 0;
        }

        a {
            text-decoration: none;
        }

        body {
            background-color: #17181a;
        }

        .header {
            width: 100%;
            height: 70px;
            z-index: 999;
            position: fixed;
            background-color: #1e1f22;
            border-bottom: 1px solid #333;
        }

        .top {
            margin: 0 auto;
            width: 1000px;
            height: 70px;
        }

        .header_left {
            float: left;
        }

        .header_left img {
            width: 150px;
            height: 50px;
            margin-top: 10px;
            margin-left: 30px;
        }

        .header_right {
            float: right;
        }

        .header_right ul {
            width: 400px;
            height: 30px;
            margin-top: 20px;
            margin-right: 10px;
        }

        .header_right ul li {
            float: left;
            list-style: none;
            color: #bbbcbc;
        }

        .header_right ul li a {
            color: #bbbcbc;
            padding-left: 20px;
            padding-right: 20px;
            font-size: 16px;
        }

        .header_right ul li a:hover {
            color: #ffffff;
        }

        .content {
            position: relative;
            width: 1000px;
            height: 480px;
            background-color: #1f2022;
            margin: 0 auto;
            z-index: 1;
        }

        .content img {
            float: left;
            width: 160px;
            height: 235px;
            background-color: #fff;
            margin-left: 100px;
            margin-top: 130px;
        }

        .content .content-middle {
            float: left;
            width: 500px;
            height: 200px;
            margin-left: 50px;
            margin-top: 130px;
        }

        .content-middle p:nth-child(1) {
            font-size: 26px;
            color: #eef0f4;
            /* margin-top: 15px; */
            font-family: '宋体';
            font-weight: 700;
        }

        .content-middle p:nth-child(2) {
            color: #0097ff;
            font-size: 20px;
            font-family: '宋体';
        }

        .content-middle p:nth-child(3) {
            color: #eef0f4;
            font-size: 16px;
            margin-top: 15px;
            font-family: '宋体';
        }

        .content-middle p:nth-child(4) {
            color: #eef0f4;
            font-size: 16px;
            margin-top: 10px;
            font-family: '宋体';
        }

        .content-middle div {
            width: 600px;
            height: 200px;
            margin-top: 20px;
        }

        .content-middle div span {
            line-height: 24px;
            font-size: 14px;
            color: #8c8c8e;
        }

        .content-middle div span:hover {
            display: inline-block;
            color: #b2b4b8;
            cursor: pointer;
        }

        .content_left {
            position: absolute;
            top: 150px;
            right: 100px;
            width: 120px;
            height: 40px;
            border-radius: 20px;
            background-color: #0097ff;
        }

        .content_left a {
            color: #fff;
            display: block;
            margin-top: 8px;
            margin-left: 29px;
            font-size: 16px;
        }

        .main {
            width: 1000px;
            height: 500px;
            background-color: #1f2022;
            margin: 0 auto;
            border-top: 1px solid #333333;
        }

        .main p {
            font-size: 30px;
            text-align: center;
            color: #bbbcbc;
            font-family: "宋体";
        }

        .main div {
            float: left;
            margin-top: 40px;
            width: 240px;
            height: 90px;
            margin-left: 10px;
            border-top: 1px solid #333333;
            border-bottom: 1px solid #333333;


        }

        .main div img {
            width: 65px;
            height: 90px;
            float: left;
        }

        .main div img:hover {
            transform: scale(1.1);
            transition: all .5s;
        }

        .main div>p {
            font-size: 16px;
            color: #bbbcbc;
            text-align: left;
            width: 170px;
            margin-left: 75px;
            margin-top: 10px;
        }

        .main div>p:hover {
            color: #fff;
            cursor: pointer;
        }

        .main div>span {
            font-size: 14px;
            color: #bbbcbc;
            display: block;
            margin-left: 75px;
            margin-top: 5px;
        }

        .main div>span:hover {
            color: #0097ff;
            cursor: pointer;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="header">
            <div class="top">
                <div class="header_left">
                    <a href="javascript:;"><img src="static/img/logo.gif" alt=""></a>
                </div>
                <div class="header_right">
                    <ul>
                        <li><a href="javascript:;">返回主页</a>|</li>
                        <li><a href="javascript:;">登录</a>|</li>
                        <li><a href="javascript:;">注册</a>|</li>
                        <li><a href="javascript:;">Donate</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="content">
            <!-- 图片 -->
            <img src="${requestScope.bookInfo.imgPath}" alt="">
            <div class="content-middle">
                <!-- 书名 -->
                <p>${requestScope.bookInfo.name}</p>
                <!-- 作者 -->
                <p>${requestScope.bookInfo.author}</p>
                <!-- 编号 -->
                <p>编号：<span>${requestScope.bookInfo.ISBN}</span></p>
                <!-- 价格数量 -->
                <p>价格：<span>${requestScope.bookInfo.price}</span>&nbsp;&nbsp;数量：<span>${requestScope.bookInfo.stock}</span></p>
                <!-- 简介 -->
                <div>
                    <span>
                        ${requestScope.bookInfo.intro}
                    </span>
                </div>
            </div>
            <div class="content_left">
                <!-- 修改图书 -->
                <a href="manager/bookServlet?action=getBook&id=${requestScope.bookInfo.id}">修改图书</a>
            </div>
        </div>
        <div class="main">
            <!-- 图书推荐 -->
            <p>Books Recommendation</p>
            <c:forEach items="${requestScope.bookList}" var="book">
                <div>
                    <img src="${book.imgPath}" alt="">
                    <p>${book.name}</p>
                    <span>${book.author}</span>
                </div>
            </c:forEach>

<%--            <div>--%>
<%--                <img src="1.jpg" alt="">--%>
<%--                <p>Java核心技术卷一</p>--%>
<%--                <span>cs7eric</span>--%>
<%--            </div>--%>
<%--            <div>--%>
<%--                <img src="1.jpg" alt="">--%>
<%--                <p>Java核心技术卷一</p>--%>
<%--                <span>cs7eric</span>--%>
<%--            </div>--%>
<%--            <div>--%>
<%--                <img src="1.jpg" alt="">--%>
<%--                <p>Java核心技术卷一</p>--%>
<%--                <span>cs7eric</span>--%>
<%--            </div>--%>

        </div>
        <div id="footer">
            <!-- <%-- 静态包含foot页面--%> -->
            <!-- <%@ include file="/pages/common/foot.jsp" %> -->
        </div>
    </div>
</body>

</html>