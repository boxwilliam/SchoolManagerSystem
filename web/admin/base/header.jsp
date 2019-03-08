<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/25
  Time: 17:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>后台头部</title>
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/web/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/static/css/admin/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/static/css/admin/main.css" rel="stylesheet" />
  </head>
  <body>
  <div id="wrapper">
    <nav class="navbar navbar-default navbar-cls-top "  style="margin-bottom: 0">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
          <span class="sr-only">校园管网管理系统</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="pages/back/index.jsp">校园管网管理系统</a>
      </div>
      <!--顶部-->
      <div class="header-center">

        管理员:${user}

        <small>上次登录日期:<fmt:formatDate value="${lastdate}" pattern="yyyy-MM-dd HH:mm:ss"/><fmt:formatDate value="${lastdate}" pattern="E"/> </small>

      </div>
      <div class="header-right">
        <a href="/SchoolManagerSystem/admin/UserServlet/logout" class="btn btn-danger" title="Logout"> 退出系统</a>
      </div>
    </nav>
  </div>
  </body>
</html>
