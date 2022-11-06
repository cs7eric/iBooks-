<%--
  Created by IntelliJ IDEA.
  User: CSQ-PC
  Date: 2022/11/5
  Time: 23:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--分页条的开始--%>
<div id="page_nav">
    <%-- 大于首页，才显示--%>
    <c:if test="${requestScope.page.pageNo > 1}">
        <a href="manager/bookServlet?action=page&pageNo=1">首页</a>
        <a href="manager/bookServlet?action=page&pageNo=${requestScope.page.pageNo-1}">上一页</a>
    </c:if>

    <a href="#">3</a>
    【${requestScope.page.pageNo}】
    <a href="#">5</a>
    <%-- 如果已经是最后一页，则不显示下一页、末页--%>
        <c:if test="${requestScope.page.pageNo < requestScope.page.pageTotal}">
            <a href="manager/bookServlet?action=page&pageNo=${requestScope.page.pageNo+1}">下一页</a>
            <a href="manager/bookServlet?action=page&pageNo=${requestScope.page.pageTotal}">末页</a>
        </c:if>
    共 ${requestScope.page.pageTotal}页，${requestScope.page.pageTotalCount} 条记录 到第<input value="4" name="pn" id="pn_input"/>页
    <input type="button" value="确定">
</div>
<%--分页条的结束--%>
