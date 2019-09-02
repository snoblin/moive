<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>忘记密码 - layuiAdmin</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" href="static/css/layui.css" media="all">
  <link rel="stylesheet" href="static/css/admin.css" media="all">
  <link rel="stylesheet" href="static/css/login.css" media="all">
</head>

  <div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">
    <div class="layadmin-user-login-main">
      <div class="layadmin-user-login-box layadmin-user-login-header">
        <h2>忘记密码</h2>
      </div>
      <div class="layadmin-user-login-box layadmin-user-login-body layui-form">
            <div class="layui-form-item">
              <label class="layadmin-user-login-icon layui-icon layui-icon-cellphone" for="LAY-user-login-cellphone"></label>
              <input type="text" name="cellphone" id="LAY-user-login-cellphone" lay-verify="phone" placeholder="请输入注册时的手机号" class="layui-input">
            </div>
            <div class="layui-form-item">
              <div class="layui-row">
                <div class="layui-col-xs7">
                  <label class="layadmin-user-login-icon layui-icon layui-icon-vercode" for="LAY-user-login-smscode"></label>
                  <input type="text" name="vercode" id="LAY-user-login-smscode" lay-verify="required" placeholder="短信验证码" class="layui-input">
                </div>
                <div class="layui-col-xs5">
                  <div style="margin-left: 10px;">
                    <input type="button" class="layui-btn layui-btn-primary layui-btn-fluid" id="LAY-user-getsmscode" value="获取验证码"/>
                  </div>
                </div>
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
              <input type="password" name="password" id="LAY-user-login-password" lay-verify="pass" placeholder="新密码" class="layui-input">
            </div>
            <div class="layui-form-item">
              <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-repass"></label>
              <input type="password" name="repass" id="LAY-user-login-repass" lay-verify="required" placeholder="确认密码" class="layui-input">
            </div>
            <div class="layui-form-item">
              <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="LAY-user-forget-submit" id="update-password-btn">修改密码</button>
            </div>
      </div>
    </div>
    
    <div class="layui-trans layadmin-user-login-footer">
      
      <p>© 2018 <a href="http://www.layui.com/" target="_blank">layui.com</a></p>
    </div>

  </div>

  <script src="static/js/layui.js"></script>
  <script src="static/js/jquery-1.12.4.js"></script>
  <script>
    var countdown = 60;
    function settime(obj) { //发送验证码倒计时
      if (countdown == 0) {
        obj.attr('disabled', false);
        countdown = 60;
        return;
      } else {
        obj.attr('disabled', true);
        obj.val('重新发送(' + countdown + ')');
        countdown--;
      }
      setTimeout(function() {
        settime(obj);
      }, 1000);
    };
    var btn = $('#LAY-user-getsmscode');
    btn.click(function () {
      var number = $('#LAY-user-login-cellphone').val().trim();
      if(number.length!==11){
        alert('请输入正确的手机号');
      }else{
        $.ajax({
          type: "POST",
          url: "<%=request.getContextPath()%>/getsmscode",
          dataType: "json",
          data:{phone:number},
          success: function (res) {
            if(res===0){
              settime(btn);
            }
          }
        });
      }
    });
    $('#update-password-btn').click(function() {
      var number = $('#LAY-user-login-cellphone').val().trim();
      var smscode = $('#LAY-user-login-smscode').val().trim();
      var password = $('#LAY-user-login-password').val().trim();
      var rep_password = $('#LAY-user-login-repass').val().trim();
      if (smscode === '' || password === '' || rep_password === '') {
        alert('信息不能为空');
      } else {
        if (password === rep_password) {
          $.ajax({
            type: "POST",
            url: "<%=request.getContextPath()%>/updateinfo",
            dataType: "json",
            data: {
              phone: number,
              smscode: smscode,
              password: password,
            },
            success: function (data) {
              if(data===0){
                $(location).attr('href','<%=request.getContextPath()%>/Login.jsp');
              }
              if(data===1){
                alert('验证码错误');
              }
              if(data===2){
                alert('该手机号未注册');
              }
              if(data===3){
                alert('服务器错误');
              }
            }
          });
        } else {
          alert('两次输入的密码不相同');
        }
      }
    });
  </script>
</body>
</html>