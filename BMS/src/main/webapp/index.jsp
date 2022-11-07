<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
      <%@ include file="/pages/common/header.jsp"%>
      </div>
    <div id="body">

      <div>

      </div>
      <div class="form">
        <form action="manager/bookServlet?action=info" method="post">
          <label>
            <input type="text" class="search" placeholder="输入 ISBN码 进行搜索"
                   autocomplete="off" tabindex="1" name="ISBN"
                   value="${requestScope.SN}">
          </label>
          <input type="submit" class="search_" value="搜索" >
        </form>
      </div>


    </div>
    <div id="footer">
      <%--	静态包含foot页面--%>
      <%@ include file="/pages/common/foot.jsp"%>
    </div>
  </div>

</body>


</html>