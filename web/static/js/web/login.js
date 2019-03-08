$(function () {
    //用户验证:
    $("#username").blur(function(){
        var user=$(this).val();
        var msg=/^[a-zA-Z][a-zA-Z0-9]{3,15}$/;
        if(msg.test(user) == false){
            $("#form-user").next().html("用户名不正确");
            return false;
        }
        $("#form-user").next().html("");
        return true;
    });
    //密码验证：
    $("#password").blur(function(){
        var password=$(this).val();
        var msg=/^[a-zA-Z0-9]{4,10}$/;
        if(msg.test(password) == false){
            $("#form-password").next().html("密码不能含有非法字符长度在4-10之间");
            return false;
        }
        $("#form-password").next().html("");
        return true;
    });

    //点击图片获取验证码
    $("input[id=\"code\"]").next().click(function () {
        $(this).attr('src','/SchoolManagerSystem/IdentityServlet/IdentifyingCode?tm='+new Date());
    });

    // //点击按钮登录
    // $("button[type=\"button\"]").click(function () {
    //     var name=$("#username").val();
    //     var pwd=$("#password").val();
    //     var url='http://localhost:8080/SchoolManagerSystem/admin/UserServlet/login';
    //     $.ajaxAction(url,"post",{user:name,password:pwd},[cheackLogin]);
    //
    // })
});

// function cheackLogin(data,parm) {
//     if(data.status){
//         location.href=data.url
//     }else {
//         alert(data.msg)
//     }
//     console.log(data)
// }

function loginAction() {
    var  user=$("#username").val();
    var  password=$("#password").val();
    var code=$("#code").val();
    $.ajax({
        url:"/SchoolManagerSystem/admin/AdminServlet/login", //提交地址 servlet
        type:"post", //提交方式 post/get
        data:{user:user,password:password,code:code},//{参数名称1:‘值1’,参数名称2:‘值2’,....}
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

