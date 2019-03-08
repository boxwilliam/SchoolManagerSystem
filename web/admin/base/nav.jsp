<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/26
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar-default navbar-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav" id="main-menu">
            <li>
                <a class="active-menu" href="pages/back/index.jsp"><i class="fa fa-dashboard "></i>导航</a>
            </li>
            <!-- 管理员flag为1 -->
            <!--超级管理员操作-->
            <li>
                <a href="#" data-toggle="collapse" data-target="#nav1"><i class="fa glyphicon glyphicon-align-justify "></i>超级管理员操作 <span class="fa arrow glyphicon glyphicon-menu-left"></span></a>
                <ul class="nav nav-second-level collapse" id="nav1">
                    <li>
                        <a href="/SchoolManagerSystem/admin/AdminServlet/index"><i class="fa glyphicon glyphicon-record"></i>管理员列表</a>
                    </li>
                    <li>
                        <a href="/SchoolManagerSystem/admin/adminUser/add.jsp"><i class="fa glyphicon glyphicon-record"></i>增加管理员</a>
                    </li>
                </ul>
            </li>

            <!--用户管理-->
            <li>
                <a href="#" data-toggle="collapse" data-target="#nav2"><i class="fa glyphicon glyphicon-align-justify "></i>用户管理 <span class="fa arrow glyphicon glyphicon-menu-left"></span></a>
                <ul class="nav nav-second-level collapse" id="nav2">
                    <li>
                        <a href="/SchoolManagerSystem/admin/UserServlet/index"><i class="fa glyphicon glyphicon-record"></i>教职工列表</a>
                    </li>
                    <li>
                        <a href="/SchoolManagerSystem/admin/UserServlet/index"><i class="fa glyphicon glyphicon-record"></i>学生列表</a>
                    </li>
                    <%--<li>--%>
                        <%--<a href="/SchoolManagerSystem/admin/reader/add.jsp"><i class="fa glyphicon glyphicon-record"></i>用户录入</a>--%>
                    <%--</li>--%>
                </ul>
            </li>
            <!--首页-->
            <li>
                <a href="#" data-toggle="collapse" data-target="#nav3"><i class="fa glyphicon glyphicon-align-justify "></i>首页<span class="fa arrow glyphicon glyphicon-menu-left"></span></a>
                <ul class="nav nav-second-level collapse" id="nav3">
                    <li>
                        <a href="/SchoolManagerSystem/admin/BookServlet/index"><i class="fa glyphicon glyphicon-record"></i>首页</a>
                    </li>
                </ul>
            </li>
            <!--新闻资讯-->
            <li>
                <a href="#" data-toggle="collapse" data-target="#nav4"><i class="fa glyphicon glyphicon-align-justify "></i>新闻资讯<span class="fa arrow glyphicon glyphicon-menu-left"></span></a>
                <ul class="nav nav-second-level collapse" id="nav4">
                    <li>
                        <a href="/SchoolManagerSystem/admin/news/add.jsp"><i class="fa glyphicon glyphicon-record"></i>新闻资讯</a>
                    </li>
                    <li>
                        <a href="/SchoolManagerSystem/admin/UploadServlet/index"><i class="fa glyphicon glyphicon-record"></i>新闻资讯列表</a>
                    </li>
                </ul>
            </li>
            <!--学生机构-->
            <li>
                <a href="#" data-toggle="collapse" data-target="#nav5"><i class="fa glyphicon glyphicon-align-justify "></i>学院机构<span class="fa arrow glyphicon glyphicon-menu-left"></span></a>
                <ul class="nav nav-second-level collapse" id="nav5">
                    <li>
                        <a href="/SchoolManagerSystem/admin/AdminServlet/index"><i class="fa glyphicon glyphicon-record"></i>党政办公室</a>
                    </li>
                </ul>
            </li>
            <!--招生就业-->
            <li>
                <a href="#" data-toggle="collapse" data-target="#nav6"><i class="fa glyphicon glyphicon-align-justify "></i>招生就业 <span class="fa arrow glyphicon glyphicon-menu-left"></span></a>
                <ul class="nav nav-second-level collapse" id="nav6">
                    <li>
                        <a href="/SchoolManagerSystem/admin/LendServlet/index"><i class="fa glyphicon glyphicon-record"></i>招生</a>
                    </li>
                </ul>
            </li>
            <!--学术研究-->
            <li>
                <a href="#" data-toggle="collapse" data-target="#nav7"><i class="fa glyphicon glyphicon-align-justify "></i>学术研究<span class="fa arrow glyphicon glyphicon-menu-left"></span></a>
                <ul class="nav nav-second-level collapse" id="nav7">
                    <li>
                        <a href="/SchoolManagerSystem/admin/LendServlet/index"><i class="fa glyphicon glyphicon-record"></i>研究基地</a>
                    </li>
                </ul>
            </li>

        </ul>
    </div>
</nav>
<script src="${pageContext.request.contextPath}/static/js/main.js"></script>