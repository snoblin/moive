<%@ page import="com.kd.entity.User" %>
<%@ page import="com.kd.util.ResPrefix" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%!	ResPrefix res = new ResPrefix(); %>
<!DOCTYPE html>
<html lang="zh">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="static/css/iconfont.css" type="text/css" />
    <link rel="stylesheet" href="static/css/stui_default.css" type="text/css" />
    <script type="text/javascript" src="static/js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="static/js/jquery.lazyload.min.js"></script>
    <link rel="stylesheet" href="static/css/bootstrap.min.css" type="text/css"/>
    <link rel="stylesheet" href="static/css/layui.css"/>
    <script src="static/js/layui.js"></script>
    <script src="static/js/date.js"></script>
    <style>
        #date {
            font-size: 20px;
            padding: 0;
        }
        .video {
            background-color: #1C1B1E;
            margin-top: 40px;
        }

        .video-player {
            padding: 0;
        }

        .video-info {
            padding: 20px;
        }

        .video-info>h3 {
            color: white;
            padding: 5px;
        }

        .video-info>p,
        .video-info>p>a {
            color: dimgray;
            padding: 5px;
        }

        #collapsePanel {
            color: dimgray;
            font-size: 15px;
            padding: 10px;
        }

        .video-comment {
            margin-top: 50px;
            font-size: 25px;
            position: relative;
        }

        .comment {
            margin-top: 30px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .comment-user {
            padding: 5px;
            font-size: 17px;
            background-color: rgba(71,84,147,0.41);
        }

        .comment-content {
            padding: 5px 10px;
            font-size: 15px;
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
    <div class="stui-pannel__hd">
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
    </div>
    <div class="video container">
        <div class="row">
            <div class="video-player col-md-12">
                <%
                    Map<String, Object> minfo = (Map<String, Object>) request.getAttribute("minfo");
                    System.out.println(minfo);
                    String vipcansee = (String) minfo.get("vipcansee");
                    User u = (User)request.getSession().getAttribute("user");
                    String vip = "";
                    if(u!=null){
                       vip = u.getVip();
                    }
                    if(vipcansee!=null && vipcansee.equals("vip")){
                        if(vip.equals("vip")){
                            out.write("<video src=\"" + res.getPrefix() + minfo.get("video_url") + "\" controls=\"true\" width=\"100%\" height=\"100%\">您的浏览器不支持video 标签。</video>");
                        }else{
                            out.write("<script>alert('需要vip才能观看');</script>");
                            out.write("<video src=\"\" controls=\"true\" width=\"100%\" height=\"100%\">您的浏览器不支持video 标签。</video>");
                        }
                    }else{
                        out.write("<video src=\"" + res.getPrefix() + minfo.get("video_url") + "\" controls=\"true\" width=\"100%\" height=\"100%\">您的浏览器不支持video 标签。</video>");
                    }
                %>
            </div>
            <div class="video-info col-md-12">
                <h3><%=minfo.get("video_name")%></h3>
                <p>
                    <span>评分：<%=minfo.get("video_score")%></span>
                    <%
                        Date data = (Date) minfo.get("video_time");
                        Calendar ca = Calendar.getInstance();
                        ca.setTime(data);
                        String year = String.valueOf(ca.get(Calendar.YEAR));
                        %>
                    <span>年份：<%=year%></span>
                    <span>地区：<%=minfo.get("area_name")%></span>
                    <span>类型：<%=minfo.get("type_type")%></span>
                    <span>播放次数：<%=minfo.get("video_count")%>次</span>
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapsePanel">详情<span
                            class="glyphicon glyphicon-menu-down" aria-hidden="true"></span></a>
                    <div id="collapsePanel" class="panel-collapse collapse">
                        <p><label>主演：</label><%=minfo.get("actor_name")%></p>
                        <p><label>导演：</label><%=minfo.get("directors")%></p>
                        <p><label>类型：</label><%=minfo.get("type_type")%></p>
                        <p><label>简介：</label><%=minfo.get("video_details")%></p>
                    </div>
                </p>
            </div>
        </div>
    </div>
    <div class="video-comment container">
        <legend>评论</legend>
        <div class="form-group">
            <label style="font-size: 15px;">评论内容</label>
            <textarea  id="comment-input" placeholder="在这吐槽" class="form-control" rows="3"
                required="required"></textarea>
        </div>
        <button  id="btn-comment" class="btn btn-primary">提交</button>
        <%
            List<Map<String, Object>> comment = (List<Map<String, Object>>) request.getAttribute("comment");
        %>
        <div id="commentlist">
            <c:forEach items="${comment}" var="map">
                <div class="comment">
                    <div class="comment-user">
                        <span class="comment-username">${map.get("username")}</span>
                    </div>
                    <p class="comment-content">${map.get("comment")}</p>
                </div>
            </c:forEach>
        </div>
    </div>
    <footer style="margin-top: 50px;">
        <div class="container">
            <div class="row">
                <div class="stui-foot clearfix">
                    <p class="text-center hidden-xs">如有关视频侵犯了你的权益，给我心里憋着，如果开喷，请发邮件1114217951@qq.com</a>
                    </p>
                </div>
            </div>
        </div>
    </footer>
</body>
<script src="static/js/jquery-1.12.4.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<script>
    $('#btn-comment').click(function () {
        var comment = $('#comment-input').val().trim();
        var id = '${user.userid}';
        if(id===''){
            alert('请先登录');
        }else{
            $.ajax({
                type: "POST",
                url: "<%=request.getContextPath()%>/comment",
                dataType: "json",
                data:{
                    userid: id,
                    videoid: '<%=minfo.get("video_id")%>',
                    comment:comment
                },
                success: function (data) {
                    console.log(data);
                    if(data===0){
                        alert('评论成功');
                        $('#commentlist').prepend(
                            '<div class="comment">\n' +
                            '<div class="comment-user">\n' +
                            '<span class="comment-username">${user.username}</span>\n' +
                            '</div>\n' +
                            '<p class="comment-content">'+ comment +'</p>\n' +
                            '</div>');
                        $('#comment-input').val('');
                    }else{
                        alert('评论失败');
                    }
                },
                error: function (e) {
                    alert('服务器错误');
                }
            });
        }
    });
</script>
</html>