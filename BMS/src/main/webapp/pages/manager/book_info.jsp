<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: CSQ-PC
  Date: 2022/11/7
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%--	静态包含 base 标签，css样式、jQuery 文件--%>
    <%@ include file="/pages/common/head.jsp" %>
    <style>
        .sticky-table-headers__sticky {
            /* Background color */
            background-color: #9ca3af;

            /* Stick to the left */
            left: 40%;
            position: sticky;

            /* Displayed on top of other rows when scrolling */
            z-index: 9999;
        }
    </style>
</head>
<body>
<div id="container">
    <div id="header">
        <div class="header_list" id="left_list">
            <a href=""> 90 Books</a>
            <a href=""> iBooks Home</a>
        </div>

        <div class="header_list" id="right_list" >
            <a href="pages/user/login.jsp">登录</a> |
            <a href="pages/user/regist.jsp">注册</a> &nbsp;&nbsp;
            <a href="pages/manager/manager.jsp">后台管理</a>
        </div>
    </div>
    <div id="body">

        <div>

        </div>
        <div class="book_info">
                <table>
                    <tr>
                        <td>ISBN</td>
                        <td>名称</td>
                        <td>作者</td>
                        <td>价格</td>
                        <td>库存</td>
                        <td>简介</td>
                    </tr>
                    <tr>
                        <td>${requestScope.bookInfo.ISBN}</td>
                        <td>${requestScope.bookInfo.name}</td>
                        <td>${requestScope.bookInfo.author}</td>
                        <td>${requestScope.bookInfo.price}</td>
                        <td>${requestScope.bookInfo.stock}</td>
                        <td>${requestScope.bookInfo.intro}</td>
                        <td><a href="manager/bookServlet?action=getBook&id=${requestScope.bookInfo.id}">修改</a></td>
                        <td><a class="deleteClass" href="manager/bookServlet?action=delete&id=${requestScope.bookInfo.id}">删除</a></td>
                    </tr>

                </table>

            <table class="sticky-table-column">
                <thead>
                <tr>
                    <th class="sticky-table-column__sticky">ISBN</th>
                    <th class="sticky-table-column__sticky">名称</th>
                    <th class="sticky-table-column__sticky">作者</th>
                    <th class="sticky-table-column__sticky">价格</th>
                    <th class="sticky-table-column__sticky">库存</th>
                    <th class="sticky-table-column__sticky">简介</th>


                    <!-- Other header column ... -->
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="sticky-table-column__sticky">${requestScope.bookInfo.ISBN}</td>
                    <td class="sticky-table-column__sticky">${requestScope.bookInfo.name}</td>
                    <td class="sticky-table-column__sticky">${requestScope.bookInfo.author}</td>
                    <td class="sticky-table-column__sticky">${requestScope.bookInfo.price}</td>
                    <td class="sticky-table-column__sticky">${requestScope.bookInfo.stock}</td>
                    <td class="sticky-table-column__sticky">${requestScope.bookInfo.intro}</td>


                    <!-- Other columns ... -->
                </tr>
                </tbody>
            </table>
        </div>


    </div>
    <div id="footer">
        <%--	静态包含foot页面--%>
        <%@ include file="/pages/common/foot.jsp"%>
    </div>
</div>
</body>
</html>
