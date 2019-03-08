<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/2
  Time: 15:10
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
        <c:if test="${news != null}">
            <table class="table table-bordered table-hover " id="table">
                <thead>
                <tr>
                    <th>编号</th>
                    <th>栏目名称</th>
                    <th>新闻标题</th>
                    <th>新闻内容</th>
                    <th>状态</th>
                    <th>发布时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach  items="${news}" var="news">
                    <tr>
                        <td>${news.newsId }</td>
                        <td>${news.newsType }</td>
                        <td>${news.newsTitle }</td>
                        <td>${news.content }</td>
                        <td>
                            <c:choose>
                                <c:when test="${news.isBackground == 1 }">有照片</c:when>
                                <c:otherwise>无照片</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <fmt:formatDate value="${news.publishdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </td>
                        <button type="button" class="btn btn-danger btn-sm"  id="delBtn" >删除</button></td>
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


<script>




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
                url: "/SchoolManagerSystem/admin/UploadServlet/del",
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
