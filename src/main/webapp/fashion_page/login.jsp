<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<title>客户登录</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Fashionpress Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- Custom Theme files -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<!--webfont-->
<link href='https://fonts.googleapis.com/css?family=Lato:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="${APP_PATH }/static/js/jquery2.0-min.js"></script>
</head>
<body>

<!-- 静态引入头部 -->
<%@ include file="/fashion_page/commonPage/header.jsp"%>


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
         <div class="register">
			   <div class="col-md-6 login-left">
			  	 <h3>新客户</h3>
				 <p>通过在我们的商店中创建一个帐户，您将能够更快地完成结帐过程，存储多个发货地址，查看和跟踪您在您的帐户中的订单等等。</p>
				 <a class="acount-btn" href="${APP_PATH }/fashion_page/register.jsp">创建帐户</a>
			   </div>
			   <div class="col-md-6 login-right">
			  	<h3>客户登录</h3>
				<span style="color: orange;">${sessionScope.error}</span>
				<form action="${APP_PATH}/customer/login" method="post">
				  <div>
					<span>用户名<label>*</label></span>
					<input type="text" name="custName" required="required"> 
				  </div>
				  <div>
					<span>密码<label>*</label></span>
					<input type="password" name="custPassword" required="required"> 
				  </div>
				  <a class="forgot" href="#">忘记密码？</a>
				  <input type="submit" value="登录">
			    </form>
			   </div>	
			   <div class="clearfix"> </div>
		</div>
	</div>
</div>
<div class="footer_bg">
</div>
<%@ include file="/fashion_page/commonPage/footer.jsp" %>
</body>
</html>		