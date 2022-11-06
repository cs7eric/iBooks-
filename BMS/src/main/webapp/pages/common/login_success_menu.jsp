<%--
  Created by IntelliJ IDEA.
  User: CSQ-PC
  Date: 2022/11/5
  Time: 11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div>
    <span>欢迎
        <span class="um_span">
            ${requestScope.username}
        </span>进入iBooks书城
    </span>
    <a href="../order/order.jsp">我的订单</a>
    <a href="../../index.jsp">注销</a>&nbsp;&nbsp;
    <a href="../../index.jsp">返回</a>
</div>
