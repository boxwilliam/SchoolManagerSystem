<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/14
  Time: 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <script type="text/javascript" src="static/js/jquery3.js"></script>
    <title>forward</title>
</head>
<body>
<script>
    alert("<%=request.getAttribute("msg")%>");
    window.location = "<%=basePath%>${requestScope.url}";
    <%--location.href="<%=request.getAttribute("url")%>";--%>
</script>
</body>
</html>
