$(function () {
    //用户验证:
    $("#user").blur(function(){
        var user=$(this).val();
        var msg=/^[a-zA-Z][a-zA-Z0-9]{3,15}$/;
        if(msg.test(user) == false){
            $("#user").next().html("用户名不正确");
            return false;
        }
        $("#user").next().html("");
        return true;
    });
    //密码验证：
    $("#password").blur(function(){
        var password=$(this).val();
        var msg=/^[a-zA-Z0-9]{4,10}$/;
        if(msg.test(password) == false){
            $("#password").next().html("密码不能含有非法字符长度在4-10之间");
            return false;
        }
        $("#password").next().html("");
        return true;
    });
    //手机验证：
    $("#phone").blur(function(){
        var password=$(this).val();
        var msg=/^1\d{10}$/;
        if(msg.test(password) == false){
            $("#phone").next().html("手机号码不正确请重新输入");
            return false;
        }
        $("#phone").next().html("");
        return true;
    });

    //点击图片获取验证码
    $("input[id=\"code\"]").next().click(function () {
        $(this).attr('src','/SchoolManagerSystem/IdentityServlet/IdentifyingCode?tm='+new Date());
    });


});



function registerAction() {
    var user=$("#user").val();
    var password=$("#password").val();
    var type=$("#flag").val();
    var code=$("#code").val();
    var phone=$("#phone").val();
    var status=$("#status").val();
    $.ajax({
        url:"/SchoolManagerSystem/admin/AdminServlet/register", //提交地址 servlet
        type:"post", //提交方式 post/get
        data:{user:user,password:password,phone:phone,type:type,status:status,code:code},//{参数名称1:‘值1’,参数名称2:‘值2’,....}
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