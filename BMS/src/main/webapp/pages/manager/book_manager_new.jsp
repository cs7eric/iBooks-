<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>book_manager</title>

    <%@ include file="/pages/common/head.jsp" %>

    <link rel="stylesheet" href="static/assets_book_manager/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/assets_book_manager/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.31.2/css/theme.bootstrap_4.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css">
    <link rel="stylesheet" href="static/assets_book_manager/css/Ludens---1-Dark-mode-Index-Table-with-Search-Filters.css">
    <link rel="stylesheet" href="static/assets_book_manager/css/Navbar-Right-Links-icons.css">

    <script type="text/javascript" src="static/script/jquery-1.7.2.js"></script>

    <script type="text/javascript">
        $(function(){

            $("#deleteClass").click(function(){
                return confirm("你确定删除  " + $(this).parent().parent().find("td:eq(1)").text() + "  吗?");
            });
        });
    </script>

</head>

<body style="background: #1f2022;">
    <div id="container" class="container_">
        <div id="header">

            <%@ include file="/pages/common/header_new.jsp"%>
        </div>
        <div id="body" style="background-color: #1f2022;">
            <div style="height: 250px;"></div>
            <div>
                <div class="container-fluid" style="margin-bottom: 50px;color: var(--bs-gray);background: #1f2022;width: 1100px;">
                    <div class="card" id="TableSorterCard" style="border-style: none;border-radius: 6.5px;">
                        <div class="card-header py-3" style="border-width: 0px;background: rgb(23,25,33);">
                            <div class="row table-topper align-items-center">
                                <div class="col-12 col-sm-5 col-md-6 text-start" style="margin: 0px;padding: 5px 15px;">
                                    <p class="m-0 fw-bold" style="color: rgb(255,255,255);">图书列表</p>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="table-responsive" style="border-top-style: none;background: #171921;">
                                    <table class="table table-striped table tablesorter" id="ipi-table">
                                        <thead class="thead-dark" style="background: rgb(33,37,48);border-width: 0px;border-color: rgb(0,0,0);border-bottom-color: #21252F;">
                                            <tr style="border-style: none;border-color: rgba(255,255,255,0);background: #21252f;">
                                                <th class="text-center">ISBN</th>
                                                <th class="text-center">名称</th>
                                                <th class="text-center">作者</th>
                                                <th class="text-center">价格</th>
                                                <th class="text-center">库存</th>
                                                <th class="text-center filter-false sorter-false">操作</th>
                                            </tr>
                                        </thead>
                                        <tbody class="text-center" style="border-top-width: 0px;">
                                            <c:forEach items="${requestScope.page.items}" var="book">
                                                <tr style="background: #262a38;">
                                                    <td style="color: rgb(255,255,255);">${book.ISBN}</td>
                                                    <td style="color: rgb(255,255,255);">${book.name}</td>
                                                    <td style="color: rgb(255,255,255);">${book.author}</td>
                                                    <td style="color: rgb(255,255,255);">${book.price}</td>
                                                    <td style="color: rgb(255,255,255);">${book.stock}</td>
                                                    <td class="text-center align-middle" style="max-height: 60px;height: 60px;">
                                                        <a  class="btn btnMaterial btn-flat primary semicircle" role="button" href="manager/bookServlet?action=info&ISBN=${book.ISBN}" style="color: #00bdff;"><i class="far fa-eye"></i></a>
                                                        <a class="btn btnMaterial btn-flat success semicircle" role="button" href="manager/bookServlet?action=getBook&id=${book.id}" style="color: rgb(0,197,179);"><i class="fas fa-pen"></i></a>
                                                        <a  id="deleteClass"  class="btn btnMaterial btn-flat accent btnNoBorders checkboxHover" role="button" style="margin-left: 5px;" data-bs-toggle="modal" data-bs-target="#delete-modal"  href="manager/bookServlet?action=delete&id=${book.id}"><i class="fas fa-trash btnNoBorders" style="color: #DC3545;"></i></a></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div style="width: 100%;height: 50px;">
                        <nav class="pagination" style="background: var(--bs-gray-dark);position: static;">
                            <ul class="pagination">
                                    <li class="page-item"><a class="page-link" aria-label="Previous" href="${ requestScope.page.url }&pageNo=1"><span aria-hidden="true">首页</span></a></li>
                                    <%--大于首页，才显示--%>
                                    <c:if test="${requestScope.page.pageNo > 1}">
                                        <li class="page-item"><a class="page-link" aria-label="Previous" href="${ requestScope.page.url }&pageNo=${requestScope.page.pageNo-1}"><span aria-hidden="true">上页</span></a></li>
                                    </c:if>
                                    <%--页码输出的开始--%>
                                    <c:choose>
                                        <%--情况1：如果总页码小于等于5的情况，页码的范围是：1-总页码--%>
                                        <c:when test="${ requestScope.page.pageTotal <= 5 }">
                                            <c:set var="begin" value="1"/>
                                            <c:set var="end" value="${requestScope.page.pageTotal}"/>
                                        </c:when>
                                        <%--情况2：总页码大于5的情况--%>
                                        <c:when test="${requestScope.page.pageTotal > 5}">
                                            <c:choose>
                                                <%--小情况1：当前页码为前面3个：1，2，3的情况，页码范围是：1-5.--%>
                                                <c:when test="${requestScope.page.pageNo <= 3}">
                                                    <c:set var="begin" value="1"/>
                                                    <c:set var="end" value="5"/>
                                                </c:when>
                                                <%--小情况2：当前页码为最后3个，8，9，10，页码范围是：总页码减4 - 总页码--%>
                                                <c:when test="${requestScope.page.pageNo > requestScope.page.pageTotal-3}">
                                                    <c:set var="begin" value="${requestScope.page.pageTotal-4}"/>
                                                    <c:set var="end" value="${requestScope.page.pageTotal}"/>
                                                </c:when>
                                                <%--小情况3：4，5，6，7，页码范围是：当前页码减2 - 当前页码加2--%>
                                                <c:otherwise>
                                                    <c:set var="begin" value="${requestScope.page.pageNo-2}"/>
                                                    <c:set var="end" value="${requestScope.page.pageNo+2}"/>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:when>
                                    </c:choose>

                                    <c:forEach begin="${begin}" end="${end}" var="i">
                                        <c:if test="${i != requestScope.page.pageNo}">
                                            <li class="page-item"><a class="page-link" href="${ requestScope.page.url }&pageNo=${i}">${i}</a></li>
                                        </c:if>
                                        <c:if test="${i == requestScope.page.pageNo}">
                                            <li class="page-item"><a class="page-link" href="${ requestScope.page.url }&pageNo=${i}">${i}</a></li>
                                        </c:if>
                                    </c:forEach>
                                    <%--页码输出的结束--%>


                                    <%-- 如果已经 是最后一页，则不显示下一页，末页 --%>
                                    <c:if test="${requestScope.page.pageNo < requestScope.page.pageTotal}">
                                        <li class="page-item"><a class="page-link" aria-label="Next" href="${ requestScope.page.url }&pageNo=${requestScope.page.pageNo+1}"><span aria-hidden="true">下页</span></a></li>
                                    </c:if>
                                    <li class="page-item"><a class="page-link" aria-label="Next" href="${ requestScope.page.url }&pageNo=${requestScope.page.pageTotal}"><span aria-hidden="true">末页</span></a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <div id="footer"></div>
    </div>
</body>

</html>