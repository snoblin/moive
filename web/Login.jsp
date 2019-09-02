<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>登入 - layuiAdmin</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="static/css/layui.css" media="all">
    <link rel="stylesheet" href="static/css/admin.css" media="all">
    <link rel="stylesheet" href="static/css/login.css" media="all">
    <script type="text/javascript">
        //切换验证码
        function refreshCode() {
            //获取验证码图片对象
            var vcode = document.getElementById("LAY-user-get-vercode");
            //设置src属性 +时间戳
            vcode.src="checkCodeServlet?time="+new Date().getTime();
        }
    </script>
</head>
<body>
<div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">

    <div class="layadmin-user-login-main">
        <div class="layadmin-user-login-box layadmin-user-login-header">
            <h2>小电影用户登录</h2>
            <!--<p>layui 官方出品的单页面后台管理模板系统</p>-->
        </div>
        <div class="layadmin-user-login-box layadmin-user-login-body layui-form">
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-username" for="LAY-user-login-username"></label>
                <input type="text" name="username" id="LAY-user-login-username" lay-verify="required" placeholder="手机号" class="layui-input">
            </div>
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
                <input type="password" name="password" id="LAY-user-login-password" lay-verify="required" placeholder="密码" class="layui-input">
            </div>
            <div class="layui-form-item">
                <div class="layui-row">
                    <div class="layui-col-xs7">
                        <label class="layadmin-user-login-icon layui-icon layui-icon-vercode" for="LAY-user-login-vercode"></label>
                        <input type="text" name="vercode" id="LAY-user-login-vercode" lay-verify="required" placeholder="验证码" class="layui-input">
                    </div>
                    <div class="layui-col-xs5">
                        <div style="margin-left: 10px;">
                            <a href="javascript:refreshCode()"><img src="" class="layadmin-user-login-codeimg" id="LAY-user-get-vercode"></a>
                        </div>
                    </div><!--获取验证码-->
                </div>
            </div>
            <div class="layui-form-item" style="margin-bottom: 20px;">
                <input type="checkbox" name="remember" lay-skin="primary" title="记住密码">
                <a href="Forget.jsp" class="layadmin-user-jump-change layadmin-link" style="margin-top: 7px;">忘记密码？</a>
            </div>
            <div class="layui-form-item">
                <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="LAY-user-login-submit" id="btn-login">登 入</button>
            </div>
            <div class="layui-trans layui-form-item layadmin-user-login-other">

                <a href="Register.jsp" class="layadmin-user-jump-change layadmin-link">注册帐号</a>
            </div>
        </div>
    </div>

    <div class="layui-trans layadmin-user-login-footer">
        <p>© 2019 <a href="#" target="_blank">小电影之家</a></p>
    </div>
</div>

<script src="static/js/jquery-1.12.4.js"></script>
<script>
    refreshCode();
    $('#btn-login').click(function(){
        var username = $('#LAY-user-login-username').val().trim();
        var password = $('#LAY-user-login-password').val().trim();
        var code = $('#LAY-user-login-vercode').val().trim();
        if(username==='' || password === '' || code === '' ){
            alert('不能为空');
        }else{
            $.ajax({
                type: "POST",
                url: "<%=request.getContextPath()%>/login",
                dataType: "json",
                data:{
                    username: username,
                    password: password,
                    code: code
                },
                success: function (data) {
                    console.log(data);
                    if(data===0){
                        $(location).attr('href','<%=request.getContextPath()%>/HomePage.jsp');
                    }else{
                        alert('用户名或密码或验证码错误');
                    }
                },
                error:function (e) {
                    alert('用户名或密码或验证码错误');
                }
            });
        }
    })
</script>
</body>
</html>