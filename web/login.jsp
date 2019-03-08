<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/25
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="static/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="static/js/web/login.js"></script>
    <script type="text/javascript" src="static/js/web/bootstrap.min.js"></script>
    <link rel="stylesheet" href="static/css/admin/bootstrap.min.css" />
    <link rel="stylesheet" href="static/css/web/login.css" />
    <title>登录</title>
</head>
<body>
<div class="container login">
    <div class="login_l"></div>
    <div class="login_r">
        <div class="form row">
            <div class="form-horizontal col-md-offset-3" id="login_form">
                <div class="col-md-9">
                    <div class="form-group" id="form-user"> <i class="fa glyphicon glyphicon-user"></i> <input class="form-control" type="text" placeholder="用户名" id="username" autofocus="autofocus" maxlength="20" /></div>
                    <span class="ad-name"></span>
                    <div class="form-group" id="form-password"> <i class="fa glyphicon glyphicon-lock"></i> <input class="form-control" type="password" placeholder="密码" id="password"  maxlength="8"/></div>
                    <span class="ad-password"></span>
                    <div class="form-group"><i class="fa glyphicon glyphicon-pencil"></i> <input class="form-control" type="text" placeholder="验证码" id="code"  maxlength="8" /><img src="/SchoolManagerSystem/IdentityServlet/IdentifyingCode"> </div>
                    <div class="form-group col-md-offset-9">
                    <button type="button" class="btn btn-primary" onclick="loginAction()">登录</button>
                    <%--<button type="button" class="btn btn-primary" onclick="registerAction()">注册</button>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
