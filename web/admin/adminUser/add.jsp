<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/26
  Time: 19:12
  To change this template use File | Settings | File Templates.
--%>
<jsp:include page="/admin/base/header.jsp"></jsp:include>
<jsp:include page="/admin/base/nav.jsp"></jsp:include>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/web/register.js"></script>

<div id="page-wrapper">
    <div id="page-inner">

        <%-- 编写数据增加表单 --%>
        <form class="form-horizontal" id="insertForm" >
            <%-- 管理员账号 --%>
            <div class="form-group">
                <label for="user" class="col-md-3 control-label">管理员账号</label>
                <div class="col-md-6">
                    <input type="text" name="user" id="user" class="form-control input-sm"/><span></span>
                </div>
            </div>

            <%-- 密码 --%>
            <div class="form-group">
                <label for="password" class="col-md-3 control-label">管理员密码</label>
                <div class="col-md-6">
                    <input type="password" name="password" id="password" class="form-control input-sm"/><span></span>
                </div>
            </div>
            <div class="form-group">
                <label for="phone" class="col-md-3 control-label">联系电话</label>
                <div class="col-md-6">
                    <input type="text" name="phone" id="phone" class="form-control input-sm"/><span></span>
                </div>
            </div>
            <div class="form-group">
                <label for="flag" class="col-md-3 control-label">管理员类型</label>
                <div class="col-md-6">
                    <select class="form-control" id="flag" name="flag">
                        <option value="1">超级管理员</option>
                        <option value="0">后台管理员</option>
                    </select>
                </div>
            </div>
                <div class="form-group">
                    <label for="flag" class="col-md-3 control-label">管理员状态</label>
                    <div class="col-md-6">
                        <select class="form-control" id="status" name="status">
                            <option value="1">启用</option>
                            <option value="0">禁用</option>
                        </select>
                    </div>
                </div>
            <div class="form-group">
                <label for="flag" class="col-md-3 control-label">验证码</label>
                <div class="col-md-6">
                <input class="form-control" type="text" placeholder="验证码" id="code"  maxlength="8" />
                <img src="/SchoolManagerSystem/IdentityServlet/IdentifyingCode">
                </div>
            </div>
            <div class="from-group">
                <div class="col-md-5 col-md-offset-3">
                    <button type="button" class="btn btn-success c" onclick="registerAction()">提交</button>
                    <button type="reset" class="btn btn-success">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>
<jsp:include page="/admin/base/footer.jsp"></jsp:include>
