<%@ page language="java" import="java.util.*" isErrorPage="true" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<title>404</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Fashionpress Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="${APP_PATH }/fashion_page/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- Custom Theme files -->
<link href="${APP_PATH }/fashion_page/css/style.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<!--webfont-->
<link href='${APP_PATH }/fashion_page/css/font_google.css' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="${APP_PATH }/static/js/jquery2.0-min.js"></script>
</head>
<body>
<script src="${APP_PATH}/fashion_page/js/bootstrap.min.js" type="text/javascript"></script>
<div class="header">
	<div class="header_top" style="padding-bottom: 10px">
		<div class="container">
			<div class="logo">
				<a href="${APP_PATH }/fashion_page/index.jsp"><img src="${APP_PATH }/fashion_page/images/logo.png" alt=""/></a>
			</div>
			<ul class="shopping_grid">
				<c:choose>
					<c:when test="${sessionScope.custNick == null}">
						<a href="${APP_PATH }/fashion_page/login.jsp"><li>登录</li></a>
						<a href="${APP_PATH }/fashion_page/register.jsp"><li>注册</li></a>
					</c:when>
					<c:otherwise>
					<li>
					<div class="dropdown">
					  <button id="userInfo" class="btn btn-primary btn-lg btn-block" style="height: 45px;" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    ${sessionScope.custNick}
					    <span class="caret"></span>
					  </button>
					  <ul class="dropdown-menu" aria-labelledby="userInfo">
					    <a href="${APP_PATH }/fashion_page/wishlist.jsp"><li><span class="m_1">购物车</span>&nbsp;&nbsp;&nbsp;<img src="${APP_PATH }/fashion_page/images/bag.png" alt=""/></li></a>
				      	<a href="${APP_PATH }/fashion_page/orderlist.jsp"><li>我的订单</li></a>
				      	<a href="${APP_PATH }/customer/loginOut"><li>退出登录</li></a>
				      	<a href="${APP_PATH }/admin/loginPage"><li>管理员登录</li></a>
					  </ul>
					</div></li>
					</c:otherwise>
				</c:choose>
			      <div class="clearfix"> </div>
			</ul>
			
		    <div class="clearfix"> </div>
		</div>
	</div>
	<div class="h_menu4"><!-- start h_menu4 -->
		<div class="container">
				<a class="toggleMenu" href="#">菜单</a>
				<ul class="nav">
					<li><a href="${APP_PATH }/fashion_page/index.jsp" data-hover="Home">主页</a></li>
					<li><a href="${APP_PATH }/fashion_page/about.jsp" data-hover="About Us">关于我们</a></li>
					<li><a href="${APP_PATH }/fashion_page/careers.jsp" data-hover="Careers">网站声明</a></li>
					<li><a href="${APP_PATH }/fashion_page/contact.jsp" data-hover="Contact Us">联系我们</a></li>
					<!-- <li><a href="404.html" data-hover="Company Profile">Company Profile</a></li>
					<li><a href="register.html" data-hover="Company Registration">Company Registration</a></li>
					<li><a href="wishlist.html" data-hover="Wish List">购物车</a></li> -->
				 </ul>
				 <script type="text/javascript" src="${APP_PATH }/fashion_page/js/nav.js"></script>
	      </div><!-- end h_menu4 -->
     </div>
</div>

<div class="column_center">
  <div class="container">
	<div class="search">
	  <div class="clearfix"> </div>
	</div>
    <div class="clearfix"> </div>
  </div>
</div>
<div class="about">
 <div class="container">
  	<div class="page-not-found">
		<h1>404</h1>
		<a href="${APP_PATH }/fashion_page/index.jsp">返回主页</a>
	</div>
 </div>
</div>
<div class="footer_bg">
</div>
<%@ include file="/fashion_page/commonPage/footer.jsp" %>
</body>
</html>		