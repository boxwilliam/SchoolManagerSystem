<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/26
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<jsp:include page="/admin/base/header.jsp"></jsp:include>
<jsp:include page="/admin/base/nav.jsp"></jsp:include>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 此处编写内容  -->
<div id="page-wrapper">
    <div id="page-inner">
        <c:if test="${admins != null}">
            <table class="table table-bordered table-hover " id="table">
                <thead>
                <tr>
                    <th>编号</th>
                    <th>用户名</th>
                    <th>电话</th>
                    <th>类型</th>
                    <th>状态</th>
                    <th>上次登录时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach  items="${admins}" var="admin">
                    <tr>
                        <td>${admin.id }</td>
                        <td>${admin.name }</td>
                        <td>${admin.phone }</td>
                        <td>
                            <c:choose>
                                <c:when test="${admin.type == 1 }">超级管理员</c:when>
                                <c:otherwise>管理员</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${admin.status == 1 }">启用</c:when>
                                <c:otherwise>禁用</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <fmt:formatDate value="${admin.lastDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </td>
                        <td><button type="button" id="editBtn" class="btn btn-primary btn-sm">编辑</button>&nbsp;&nbsp;<button type="button" class="btn btn-danger btn-sm"  id="delBtn" >删除</button></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="col-md-5 col-md-offset-3">
                <jsp:include page="/admin/base/splitPage.jsp"/>
            </div>
        </c:if>
    </div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">编辑</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="txt_user">用户名</label>
                    <input type="text" class="form-control" id="txt_user" disabled placeholder="用户名">
                </div>
                <div class="form-group">
                    <label for="txt_pwd">密码</label>
                    <input type="text" class="form-control" id="txt_pwd" placeholder="密码">
                </div>
                <div class="form-group">
                    <label for="txt_phone">电话</label>
                    <input type="text" class="form-control" id="txt_phone">
                </div>
                <div class="form-group">
                    <label for="txt_type">类型</label>
                    <select class="form-control" id="txt_type">
                        <option value="1">超级管理员</option>
                        <option value="0">管理员</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="txt_status">状态</label>
                    <select class="form-control" id="txt_status">
                        <option value="1">启用</option>
                        <option value="0">禁用</option>
                    </select>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                <button type="button" id="btn_submit"  class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>
            </div>
        </div>
    </div>
</div>
<script>
    <!--更新-->
    $("#btn_submit").click(function () {
        var data={
            id:$(this).attr("rowid"),
            user:$("#txt_user").val(),
            password:$("#txt_pwd").val(),
            phone:$("#txt_phone").val(),
            type:$("#txt_type").val(),
            status:$("#txt_status").val()
        };
        var url="/SchoolManagerSystem/admin/AdminServlet/edit";
        $.ajaxAction(url,"post",data,[reloadData]);
    });


    <!--编辑-->
    $("tbody #editBtn").click(function () {
        var row=$(this).parent().parent().children();
        var editInput=$(".modal-body input,.modal-body select");
        console.log(editInput);
        for (var i=0;i<editInput.length;i++){
            if(i==0){
                var rowid=row.get(i).innerText;
                $(editInput[i]).val(row.get(i+1).innerText);
            }else {
                if(i==1)continue;
                if(i==2){
                    $(editInput[i]).val(row.get(i).innerText);
                }else {
                    for(var op of editInput[i]){
                        // console.log($(op).text())
                        if($(op).text()==row.get(i).innerText) $(op).attr("selected","selected")
                        // console.log(row.get(i).innerText);
                    }
                }
            }
        }
        console.log(rowid);
        $("#btn_submit").attr("rowid",rowid);
        $('#myModal').modal();
    });

    <!--删除-->
    $("tbody #delBtn").click(function () {
        // $(this).parent().parent().remove()
        var rowid=$(this).parent().parent().children().first().text();
        $.dialog().confirm({ message: "确认要删除选择的数据吗？" }).on(function (e) {
            if (!e) {
                return;
            }
            $.ajax({
                type: "post",
                url: "/SchoolManagerSystem/admin/AdminServlet/del",
                dataType:"json",
                data: { id: rowid },
                success: function (data, status) {
                    if (status == "success") {
                        $.dialog().alert({message:"删除成功"})
                        location.reload();
                    }
                },
                error: function (err) {
                    console.log(err);
                }
            });
        });
    });
    function reloadData(data,prm){
        if(data.status){
            $.dialog().alert({message:data.msg})
            location.reload();
        }
    }
</script>

<jsp:include page="/admin/base/footer.jsp"></jsp:include>
