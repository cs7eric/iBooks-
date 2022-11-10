<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>书首页</title>

    <%--	静态包含 base 标签，css样式、jQuery 文件--%>
    <%@ include file="/pages/common/head.jsp" %>

</head>
<body>

<div id="container">
    <div id="header">

        <%-- 静态包含 header页面--%>
        <%@ include file="/pages/common/header_new.jsp"%>
    </div>
    <div id="body">

        <form action="manager/bookServlet?action=info" method="post">

            <div class="search">
                <img src="static/img/logoS.png" alt="">
                <input type="text" placeholder="输入 ISBN码 进行搜索"
                       autocomplete="off" tabindex="1" name="ISBN"
                       value="">
            </div>
        </form>




            </form>



    </div>
    <div id="footer">
        <%--	静态包含foot页面--%>
<%--        <%@ include file="/pages/common/foot.jsp"%>--%>
    </div>
</div>

</body>


</html>