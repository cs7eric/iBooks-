<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: CSQ-PC
  Date: 2022/11/10
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 图书推荐 -->
<p>图书推荐</p>
<c:forEach items="${requestScope.bookList}" var="book">
    <div>
        <img src="${book.imgPath}" alt="">
        <p>
            <a href="manager/bookServlet?action=info&ISBN=${book.ISBN}">
                    ${book.name}
            </a>
        </p>
        <span>${book.author}</span>
    </div>
</c:forEach>
