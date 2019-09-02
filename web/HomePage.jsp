<%@ page import="com.kd.entity.User" %>
<%@ page import="com.kd.util.ResPrefix" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%!	ResPrefix res = new ResPrefix(); %>
<!DOCTYPE html>
<html>
<head>
	<title>小电影</title>
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
	<script src="static/js/layui.js"></script>
	<script src="static/js/date.js"></script>
</head>
<style>
	.img-lunbo {
		height: 100px;
	}
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
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- 轮播（Carousel）指标 -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
		</ol>
		<!-- 轮播（Carousel）项目 -->
		<div class="carousel-inner">
			<div class="item active">
				<img class="img-lunbo" src="<%=res.getPrefix()%>/lblin/1" alt="First slide">
			</div>
			<div class="item">
				<img class="img-lunbo" src="<%=res.getPrefix()%>/lblin/2" alt="Second slide">
			</div>
		</div>
		<!-- 轮播（Carousel）导航 -->
		<a class="carousel-control left" href="#myCarousel"
		   data-slide="prev"></a>
		<a class="carousel-control right" href="#myCarousel"
		   data-slide="next"></a>
	</div>
	<div class="container">
		<div class="row">
			<div class="stui-pannel">
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
				<div class="stui-pannel__bd">

					<!-- 热门推荐 -->
					<ul class="stui-vodlist clearfix" id="hot-movie">

					</ul>
					<!-- end 热门推荐 -->

					<!-- 分类列表 -->

					<div class="stui-vodlist__head">
						<a class="pull-right" href="<%=request.getContextPath()%>/search?type=area&value=欧美">更多 <i class="iconfont icon-more"></i></a>
						<h3><a href=""><i class="iconfont icon-all"></i> 欧美</a></h3>
						<p>
						</p>
					</div>
					<ul class="stui-vodlist clearfix" id="ea-movie">

					</ul>

					<div class="stui-vodlist__head">
						<a class="pull-right" href="<%=request.getContextPath()%>/search?type=area&value=中国">更多 <i class="iconfont icon-more"></i></a>
						<h3><a href=""><i class="iconfont icon-all"></i> 国产</a></h3>
						<p>
						</p>
					</div>
					<ul class="stui-vodlist clearfix" id="cn-movie">

					</ul>

					<div class="stui-vodlist__head">
						<a class="pull-right" href="<%=request.getContextPath()%>/search?type=area&value=韩国">更多 <i class="iconfont icon-more"></i></a>
						<h3><a href=""><i class="iconfont icon-all"></i> 韩国</a></h3>
						<p>
						</p>
					</div>
					<ul class="stui-vodlist clearfix" id="kr-movie">

					</ul>
					
					<div class="stui-vodlist__head">
						<a class="pull-right" href="<%=request.getContextPath()%>/search?type=area&value=日本">更多 <i class="iconfont icon-more"></i></a>
						<h3><a href=""><i class="iconfont icon-all"></i> 日本</a></h3>
						<p>
						</p>
					</div>
					<ul class="stui-vodlist clearfix" id="ja-movie">

					</ul>
					<!-- end 分类列表 -->
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
<script>
	$('.carousel').carousel({
		interval: 2000
	});
	$.ajax({
		type:'GET',
		url: '<%=request.getContextPath()%>/homepageinfo',
		dataType:'json',
		success:function (data) {
			setContent($('#hot-movie'),data.hot);
			setContent($('#ea-movie'),data.ea);
			setContent($('#cn-movie'),data.cn);
			setContent($('#kr-movie'),data.kr);
			setContent($('#ja-movie'),data.ja);
		},
		error: function (e) {
			console.log(e);
			alert('获取资源出错');
		}
	});
	function setContent(ul,data) {
		$.each(data,function (index,item) {
			ul.append('<li class="hidden-xs">' +
					'<div class="stui-vodlist__box">' +
					'<a class="stui-vodlist__thumb lazyload" href="<%=request.getContextPath()%>/player?videoId='+item.video_id+'" title="'+ item.video_name +'"' +
					'style="display: block; background-image: url(&quot;<%=res.getPrefix()%>'+item.img_url+'&quot;);">' +
					'</a>' +
					'<div class="stui-vodlist__detail">' +
					'<h4 class="title text-overflow">'+ item.video_name +'</h4>' +
					'</div>' +
					'</div>' +
					'</li>')
		})
	}
</script>
</html>