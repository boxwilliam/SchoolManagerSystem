<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/1
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<jsp:include page="/admin/base/header.jsp"></jsp:include>
<jsp:include page="/admin/base/nav.jsp"></jsp:include>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.all.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/ueditor/themes/default/css/ueditor.css">
<script type="text/javascript" charset="utf-8"  src="${pageContext.request.contextPath}/ueditor/lang/zh-cn/zh-cn.js"></script>



    <%--<form action="/admin">--%>
        <%--<textarea id="editor" name="details" type="text/plain" style="width:728px;height:500px;display: none"></textarea>--%>
        <%--<input type="submit" onclick="save()" id="save" style="display: none">保存</input>--%>
        <%--<button onclick="close()" id="close" style="display: none">关闭</button>--%>
    <%--</form>--%>
<div id="page-wrapper">
    <div id="page-inner">

        <%-- 编写数据增加表单 --%>
        <form class="form-horizontal" id="insertForm" >
            <%-- 管理员账号 --%>
            <div class="form-group">
                <label for="news" class="col-md-3 control-label">栏目选择</label>
                <div class="col-md-6">
                    <select  type="text" name="news" id="news" class="form-control input-sm">
                        <option value="1">宣传在线</option>
                        <option value="2">新闻网</option>
                        <option value="3">西政报</option>
                        <option value="4">广电台</option>
                        <option value="5">西政巷子</option>
                        <option value="6">二维码</option>
                        <option value="7">图说西政</option>
                        <option value="8">橱窗画册</option>
                        <option value="9">展览馆</option>
                        <option value="10">各类专题</option>
                        <option value="11">校园刊物</option>
                        <option value="12">讲座论坛</option>
                        <option value="13">通知公告</option>
                    </select>
                </div>
            </div>
                <div class="form-group">
                    <label for="news_title" class="col-md-3 control-label">新闻标题</label>
                    <div class="col-md-6">
                        <input type="text" name="news_title" id="news_title" class="form-control input-sm"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="news_desc" class="col-md-3 control-label">新闻摘要</label>
                    <div class="col-md-6">
                        <input type="text" name="news_desc" id="news_desc" class="form-control input-sm"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="news_image" class="col-md-3 control-label">是否有图片</label>
                    <div class="col-md-6">
                        <Input type="radio" value="1"  name="news_image" id="news_image" onclick="Yesimages()">是<Input type="radio" value="0"  name="news_image" onclick="Noimages()">否
                    </div>
                </div>
                <div class="form-group" style="display: none" id="imagess">
                    <label for="editor" class="col-md-3 control-label">新闻内容</label>
                    <div class="col-md-6">
                        <textarea id="editor" name="editor" type="text/plain"></textarea>
                     </div>
                </div>
                <div class="form-group">
                    <label for="news_author" class="col-md-3 control-label">发布作者</label>
                    <div class="col-md-6">
                        <input type="text" name="news_author" id="news_author" class="form-control input-sm">
                    </div>
                </div>
                <div class="form-group">
                    <label for="news_createtime" class="col-md-3 control-label">发布时间</label>
                    <div class="col-md-6">
                        <input type="text" name="news_createtime" id="news_createtime" class="form-control input-sm" placeholder="YYYY/MM/DD"/>
                    </div>
                </div>
                <div class="from-group">
                    <div class="col-md-5 col-md-offset-3">
                        <button type="button" class="btn btn-success c" onclick="save()">提交</button>
                        <button type="reset" class="btn btn-success">重置</button>
                    </div>
                </div>
        </form>
    </div>
</div>
    <%--<textarea id="editor" name="details" type="text/plain" style="width:728px;height:500px;display: none"></textarea>--%>
    <%--<button onclick="save()" id="save" style="display: none">保存</button>--%>
    <%--<button onclick="close()" id="close" style="display: none">关闭</button>--%>

<script type="text/javascript">
    var ue = UE.getEditor('editor');
    // function createEditor() {
    //     UE.getEditor('editor');
    //     $('#editor').show();
    //     $('#editor').css({position: "absolute",left:"530px",top:"100px"});
    //     $("#save").show();
    //     $('#save').css({position: "absolute",left:"1260px",top:"624px"});
    //     $("#close").show();
    //     $('#close').css({position: "absolute",left:"1315px",top:"624px"});
    //     UE.getEditor('editor').setHeight(500);
    // }

    function  save() {
        var news=$("#news").val();
        var title=$("#news_title").val();
        var conctent=ue.getAllHtml();
        var desc=$("#news_desc").val();
        var Flagimage=$("input:radio").val();
        var createtime=$("#news_createtime").val();
        $.ajax({
            url:"/SchoolManagerSystem/admin/UploadServlet/add", //提交地址 servlet
            type:"post", //提交方式 post/get
            data:{news:news,title:title,conctent:conctent,createtime:createtime,desc:desc,Flagimage:Flagimage},//{参数名称1:‘值1’,参数名称2:‘值2’,....}
            dataType:"json",//提交数据类型 如果跨域提交用jsonp
            async:true,
            success:function(data){ //提交成功后返回数据执行
                console.log(data.msg);
                if (data.flag) {
                    location.href=data.url;
                }else {
                    alert(data.msg);
                    location.reload();
                }
            },
            eerror:function(err){//提交失败返回的 err错误信息
                //错误信息
                console.log('错误');
            }
        })
    }

    function Yesimages(){
        $("#imagess").show();
    }
    function Noimages(){
        $("#imagess").hide();
    }
</script>



<jsp:include page="/admin/base/footer.jsp"></jsp:include>
