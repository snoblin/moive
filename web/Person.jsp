<%@ page import="com.kd.entity.User" %>
<%@ page import="com.kd.util.ResPrefix" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%!	ResPrefix res = new ResPrefix(); %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>个人信息</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="shortcut icon" href="static/images/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="static/css/iconfont.css" type="text/css" />
    <link rel="stylesheet" href="static/css/stui_default.css" type="text/css" />
    <script type="text/javascript" src="static/js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="static/js/jquery.lazyload.min.js"></script>
    <link rel="stylesheet" href="static/css/bootstrap.min.css" type="text/css"/>
    <script src="static/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="static/css/layui.css"/>
    <script src="static/js/date.js"></script>
    <script src="static/js/layui.js"></script>
    <link rel="stylesheet" type="text/css" href="static/css/amazeui.min.css">
    <link rel="stylesheet" type="text/css" href="static/css/main.css">
    <link rel="stylesheet" href="static/css/sui.min.css"/>
    <script src="static/js/sui.min.js"></script>
</head>
<style>
    #date {
        font-size: 20px;
        padding: 0;
    }
    .vip-box{
        position: relative;
    }
    .vip-img{
        position:absolute;
        width: 20px;
        height: 20px;
        right: 0px;
        top:0px;
    }
</style>
<body>
<header class="stui-header clearfix">
    <div class="container">
        <div class="row">
            <ul class="stui_header__user">
                <li>
                    <a data-toggle="dropdown" href="#"><i class="iconfont icon-search"></i></a>
                    <div class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                        <div class="item">
                            <form id="search" name="search" method="get" action="<%=request.getContextPath()%>/search">
                                <input type="text" id="wd" name="value" class="form-control" value=""
                                       placeholder="请输入关键词..." />
                                <button class="submit" id="searchbutton" type="submit"
                                        name="type" value="na"><i class="icon iconfont icon-search"></i></button>
                            </form>
                        </div>
                    </div>
                </li>
                <li id="date"></li>
                <%
                    HttpSession s = request.getSession();
                    User user = (User) s.getAttribute("user");
                %>
                <c:if test="${user==null}">
                    <li class="layui-nav-item" lay-unselect="">
                        <a href="Login.jsp"><img src="static/images/nouser.png" class="layui-nav-img"></a>
                    </li>
                </c:if>
                <c:if test="${user!=null}">
                    <c:if test="${user.vip==null}">
                        <li class="layui-nav-item" lay-unselect="">
                            <a data-toggle="dropdown"><img src="<%=res.getPrefix()%>${user.userimg_url}" class="layui-nav-img"></a>
                            <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                                <li><a href="Person.jsp">个人中心</a></li>
                                <li><a href="<%=request.getContextPath()%>/logout">注销</a></li>
                            </ul>
                        </li>
                    </c:if>
                </c:if>
                <c:if test="${user!=null}">
                    <c:if test="${user.vip!=null}">
                        <li class="layui-nav-item" lay-unselect="">
                            <a  data-toggle="dropdown">
                                <div class="vip-box">
                                    <img src="static/images/vip.png" class="vip-img">
                                    <img src="<%=res.getPrefix()%>${user.userimg_url}" class="layui-nav-img">
                                </div>
                            </a>
                            <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                                <li><a href="Person.jsp">个人中心</a></li>
                                <li><a href="<%=request.getContextPath()%>/logout">注销</a></li>
                            </ul>
                        </li>
                    </c:if>
                </c:if>

            </ul>
            <div class="stui-header__logo">
                <a class="logo" href="/"></a>
            </div>
            <ul class="stui-header__menu">
                <li class="active"><a href="<%=request.getContextPath()%>/HomePage.jsp">首页</a></li>
                <li><a href="<%=request.getContextPath()%>/search?type=area&value=欧美">欧美</a></li>
                <li><a href="<%=request.getContextPath()%>/search?type=area&value=中国">国产</a></li>
                <li><a href="<%=request.getContextPath()%>/search?type=area&value=韩国">韩国</a></li>
                <li><a href="<%=request.getContextPath()%>/search?type=area&value=日本">日本</a></li>
            </ul>
        </div>
    </div>
</header>
    <script type="text/javascript">
        $(".stui_header__user li a").click(function () {
            $(this).parent().find(".dropdown").toggle();
            $(this).parent().siblings().find(".dropdown").hide();
        });
    </script>
    <div class="container">
        <div class="row">
            <ul class="sui-nav nav-tabs">
                <li class="active"><a href="#index" data-toggle="tab">用户信息</a></li>
                <li><a href="#profile" data-toggle="tab">vip充值</a></li>
            </ul>
            <div class="tab-content">
                <div id="index" class="tab-pane active">

                    <div class="layui-fluid">
                        <div class="layui-row layui-col-space15">
                            <div class="layui-col-md12">
                                <div class="layui-card">
                                    <div class="layui-card-header">设置我的资料</div>
                                    <div class="layui-card-body" pad15>

                                        <div class="layui-form" lay-filter="">
                                            <div class="layui-form-item">
                                                <label class="layui-form-label">用户名</label>
                                                <div class="layui-input-inline">
                                                    <input type="text" id="nickname" value="${user.username}" lay-verify="nickname" autocomplete="off" placeholder="请输入昵称" class="layui-input">
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label">密码</label>
                                                <div class="layui-input-inline">
                                                    <input type="password" id="password"    autocomplete="off" placeholder="请输入密码" class="layui-input">
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label">确认密码</label>
                                                <div class="layui-input-inline">
                                                    <input type="password" id="checkpassword"   autocomplete="off" placeholder="请再次输入密码" class="layui-input">
                                                </div>
                                            </div>
                                            <div class="layui-form-item">
                                                <label class="layui-form-label">头像</label>
                                                    <div>
                                                        <img id="upload" src="<%=res.getPrefix()%>${user.userimg_url}" style="width:10%">
                                                    </div>
                                                <form action="#" class="img-form" enctype="multipart/form-data">
                                                    <input id="upload-input" name="img" type="file" style="display: none;"/>
                                                    <script>
                                                        $('#upload').click(function(){
                                                            $('#upload-input').click();
                                                        });
                                                        $('#upload-input').change(function () {
                                                            var formData = new FormData();
                                                            formData.append("img",$("#upload-input")[0].files[0]);
                                                            $.ajax({
                                                                url : "<%=res.getPrefix()%>/uploadUserImgs",
                                                                type : "POST",
                                                                data : formData,    //表单序列化 ,【注意】上传文件的文件流是无法被序列化并传递的
                                                                processData:false,   //  告诉jquery不要处理发送的数据
                                                                contentType:false,   // 告诉jquery不要设置content-Type请求头
                                                                success : function(data) {
                                                                    console.log(data);
                                                                    $('#upload').attr('src','<%=res.getPrefix()%>'+data);
                                                                }
                                                            });
                                                        });
                                                    </script>
                                                </form>
                                            </div>
                                            <div class="layui-form-item">
                                                <div class="layui-input-block">
                                                    <button id="btn-update-user-info" class="layui-btn" lay-submit lay-filter="setmyinfo">确认修改</button>
                                                    <button type="reset" class="layui-btn layui-btn-primary">重新填写</button>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div id="profile" class="tab-pane">
                    <div class="pay">
                        <div class="tr_recharge">
                            <div class="tr_rechtext">
                                <p class="te_retit"><img src="static/images/coin.png" alt="">充值中心</p>
                            </div>
                            <form action="" class="am-form" id="doc-vld-msg">
                                <div class="tr_rechbox">
                                    <div class="tr_rechhead">
                                        <p>充值帐号：
                                            <a>${user.username}</a>
                                        </p>
                                    </div>
                                    <div class="tr_rechli am-form-group">
                                        <ul class="ui-choose am-form-group" id="uc_01">
                                            <li>
                                                <label class="am-radio-inline">
                                                    <input type="radio" value="" name="docVlGender" required="" data-validation-message="请选择一项充值额度"> 一个月
                                                </label>
                                            </li>
                                            <li>
                                                <label class="am-radio-inline">
                                                    <input type="radio" name="docVlGender" data-validation-message="请选择一项充值额度"> 三个月
                                                </label>
                                            </li>

                                            <li>
                                                <label class="am-radio-inline">
                                                    <input type="radio" name="docVlGender" data-validation-message="请选择一项充值额度"> 一年
                                                </label>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="tr_rechoth am-form-group">
                                        <span>其他金额：</span>
                                        <input type="number" min="10" max="10000" value="10.00元" class="othbox" data-validation-message="充值金额范围：10-10000元">
                                    </div>
                                    <div class="tr_rechcho am-form-group">
                                        <span>充值方式：</span>
                                        <label class="am-radio">
                                            <input type="radio" name="radio1" value="" data-am-ucheck="" required="" data-validation-message="请选择一种充值方式"><img src="static/images/wechatpay.png">
                                        </label>
                                        <label class="am-radio" style="margin-right:30px;">
                                            <input type="radio" name="radio1" value="" data-am-ucheck="" data-validation-message="请选择一种充值方式"><img src="static/images/zfbpay.png">
                                        </label>
                                    </div>
                                    <div class="tr_rechnum">
                                        <span>应付金额：</span>
                                        <p class="rechnum">0.00元</p>
                                    </div>
                                </div>
                                <div class="tr_paybox">
                                    <input type="submit" value="确认支付" class="tr_pay am-btn" id="btn-vip-pay">
                                    <span>温馨提示：遇到问题请给我憋着。</span>
                                </div>
                            </form>
                        </div>
                    </div>

                    <script type="text/javascript" src="static/js/jquery-1.12.4.js"></script>
                    <script type="text/javascript" src="static/js/amazeui.min.js"></script>
                    <script type="text/javascript" src="static/js/ui-choose.js"></script>

                    <script type="text/javascript">
                        // 将所有.ui-choose实例化
                        $('.ui-choose').ui_choose();
                        // uc_01 ul 单选
                        var uc_01 = $('#uc_01').data('ui-choose'); // 取回已实例化的对象
                        uc_01.click = function(index, item) {
                            console.log('click', index, item.text())
                        }
                        uc_01.change = function(index, item) {
                            console.log('change', index, item.text())
                        }
                        $(function() {
                            $('#uc_01 li:eq(0)').click(function() {
                                $('.tr_rechoth').hide();
                                $('.rechnum').text('10.00元');
                                $('.othbox').val('');
                            })
                            $('#uc_01 li:eq(1)').click(function() {
                                $('.tr_rechoth').hide();
                                $('.rechnum').text('30.00元');
                                $('.othbox').val('');
                            })
                            $('#uc_01 li:eq(2)').click(function() {
                                $('.tr_rechoth').hide();
                                $('.rechnum').text('110.00元');
                                $('.othbox').val('');
                            })
                            $(document).ready(function() {
                                $('.othbox').on('input propertychange', function() {
                                    var num = $(this).val();
                                    $('.rechnum').html(num + ".00元");
                                });
                            });
                        })

                        $(function() {
                            $('#doc-vld-msg').validator({
                                onValid: function(validity) {
                                    $(validity.field).closest('.am-form-group').find('.am-alert').hide();
                                },
                                onInValid: function(validity) {
                                    var $field = $(validity.field);
                                    var $group = $field.closest('.am-form-group');
                                    var $alert = $group.find('.am-alert');
                                    // 使用自定义的提示信息 或 插件内置的提示信息
                                    var msg = $field.data('validationMessage') || this.getValidationMessage(validity);

                                    if(!$alert.length) {
                                        $alert = $('<div class="am-alert am-alert-danger"></div>').hide().
                                        appendTo($group);
                                    }
                                    $alert.html(msg).show();
                                }
                            });
                        });
                        $('#btn-update-user-info').click(function () {
                            var username = $('#nickname').val().trim();
                            var password = $('#password').val().trim();
                            var repassword = $('#checkpassword').val().trim();
                            var imgurl = $('#upload').attr('src').split('/').pop();
                            if(password!=repassword){
                                alert('两次输入的密码不一致');
                            }else{
                                $.ajax({
                                    type: 'POST',
                                    url:'<%=request.getContextPath()%>/updateinfo',
                                    dataType:'json',
                                    data:{
                                        userid: ${user.userid},
                                        username:username,
                                        password:password,
                                        imgurl:'/imgs/' + imgurl
                                    },
                                    success: function(res){
                                        if(res===1){
                                            alert('修改失败');
                                        }else if(res===0){
                                            alert('修改成功');
                                            $(location).attr('href','<%=request.getContextPath()%>/Login.jsp');
                                        }
                                    }
                                });
                            };
                        });
                        $('#btn-vip-pay').click(function(){
                            var money = $('.rechnum').text();
                            $.ajax({
                                tyle: 'POST',
                                url:'<%=request.getContextPath()%>/recharge',
                                dataType:'json',
                                data:{
                                    phone:${user.phone},
                                    money:money
                                },
                                success: function(res){
                                    if(res===1){
                                        alert('充值成功');
                                    }else if(res===0){
                                        alert('充值失败');
                                    }
                                }
                            });
                        });
                    </script>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="stui-foot clearfix">
                <p class="text-center hidden-xs">如有关视频侵犯了你的权益，给我心里憋着，如果开喷，请发邮件1114217951@qq.com</a>
                </p>
            </div>
        </div>
    </div>
</body>
</html>