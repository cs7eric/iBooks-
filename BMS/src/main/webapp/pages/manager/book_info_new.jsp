<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Created by IntelliJ IDEA. User: CSQ-PC Date: 2022/11/7 Time: 11:13 To change this template use File | Settings | File Templates. --%>
<html>

<head>
    <title>图书详情页</title>

    <%-- 静态包含 base 标签，css样式、jQuery 文件--%>
    <%@ include file="/pages/common/head.jsp" %>

</head>

<body>
    <div class="container">
        <div class="header">

            <%--静态包含 header页面--%>
            <%@ include file="/pages/common/header_new.jsp"%>

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
            <%-- 静态包含 book_recommend 页面--%>
            <%@ include file="/pages/manager/book_recommend.jsp"%>


        </div>
        <div id="footer">
            <!-- <%-- 静态包含foot页面--%> -->
            <!-- <%@ include file="/pages/common/foot.jsp" %> -->
        </div>
    </div>
</body>

</html>