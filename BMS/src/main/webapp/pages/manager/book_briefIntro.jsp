<%--
  Created by IntelliJ IDEA.
  User: CSQ-PC
  Date: 2022/11/10
  Time: 21:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@ include file="/pages/common/head.jsp"%>
    <style>
        .briefIntro{
            position: absolute;
            top:40%;
            left:33%;
        }
    </style>
</head>
<body>
    <div class="briefIntro">
        ${requestScope.book.intro}
    </div>
</body>
</html>
