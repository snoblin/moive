<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.kd.entity.User" %>
<%@ page import="com.kd.util.ResPrefix" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%!	ResPrefix res = new ResPrefix(); %>
<!DOCTYPE html>
<html lang="zh-CN">
<!--指定为中文-中国-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>电影网</title>
    <!--导入bootstrap框架-->
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
    <link href="static/css/iconfont.css" rel="stylesheet"><!--图标-->
    <script src="static/js/jquery-1.12.4.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="static/css/stui_default.css" type="text/css" />
    <script src="static/js/date.js"></script>
    <link rel="stylesheet" href="static/css/layui.css"/>
    <script src="static/js/layui.js"></script>
    <style>
        #date {
            font-size: 20px;
            padding: 0;
        }
        p{
            text-align: center;
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
</head>

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
            <div class="stui-vodlist__head">
                <h3><a href=""><i class="iconfont icon-all"></i> 搜索结果</a></h3>
                <p>
                </p>
            </div>
            <ul class="stui-vodlist clearfix">
                <%
                    List<Map<String, Object>> maps = null;
                    if(request.getAttribute("maps")!=null){
                        maps = (List<Map<String, Object>>) request.getAttribute("maps");
                    }
                %>
                <c:forEach items="${maps}" var="item">
                    <li>
                        <div class="stui-vodlist__box">
                            <a class="stui-vodlist__thumb lazyload" href="<%=request.getContextPath()%>/player?videoId=${item.get("video_id")}" title="${item.get("video_name")}"
                               style="display: block; background-image: url(<%=res.getPrefix()%>${item.get("img_url")});">
                            </a>
                            <div class="stui-vodlist__detail">
                                <h4 class="title text-overflow">${item.get("video_name")}
                                </h4>
                                <!--<p class="text text-overflow text-muted hidden-xs">基努·里维斯 / 哈莉·贝瑞 / 劳伦斯·菲什伯恩 / 安杰丽卡·休斯顿 / 伊恩·麦柯肖恩</p>-->
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
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