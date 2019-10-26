<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<head>
<title>用户注册</title>

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
<link href='https://fonts.googleapis.com/css?family=Lato:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="${APP_PATH }/static/js/jquery2.0-min.js"></script>
<script src="${APP_PATH}/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
</head>
<style>
	input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
        -webkit-appearance: none;
    }
    input[type="number"]{
        -moz-appearance: textfield;
    }

</style>
<body>
<div class="header">
	<div class="header_top">
		<div class="container">
			<div class="logo">
				<a href="index.html"><img src="${APP_PATH }/fashion_page/images/logo.png" alt=""/></a>
			</div>
			<ul class="shopping_grid">
			      <a href="${APP_PATH }/fashion_page/register.jsp"><li>注册</li></a>
			      <a href="${APP_PATH }/fashion_page/login.jsp"><li>登录</li></a>
			      <a href="wishlist.html"><li><span class="m_1">购物车</span>&nbsp;&nbsp;(0) &nbsp;<img src="${APP_PATH }/fashion_page/images/bag.png" alt=""/></li></a>
			      <a href="${APP_PATH }/admin/loginPage"><li>管理员登录</li></a>
			      <div class="clearfix"> </div>
			</ul>
		    <div class="clearfix"> </div>
		</div>
	</div>
	<div class="h_menu4"><!-- start h_menu4 -->
		<div class="container">
				<a class="toggleMenu" href="#">Menu</a>
				<ul class="nav">
					<li><a href="index.html" data-hover="Home">Home</a></li>
					<li><a href="about.html" data-hover="About Us">About Us</a></li>
					<li><a href="careers.html" data-hover="Careers">Careers</a></li>
					<li><a href="contact.html" data-hover="Contact Us">Contact Us</a></li>
					<li><a href="404.html" data-hover="Company Profile">Company Profile</a></li>
					<li class="active"><a href="register.html" data-hover="Company Registration">Company Registration</a></li>
					<li><a href="wishlist.html" data-hover="Wish List">Wish List</a></li>
				 </ul>
				 <script type="text/javascript" src="${APP_PATH }/fashion_page/js/nav.js"></script>
	      </div><!-- end h_menu4 -->
     </div>
</div>
<div class="column_center">
  <div class="container">
	<!-- <div class="search">
	  <div class="stay">Search Product</div>
	  <div class="stay_right">
		  <input type="text" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}">
		  <input type="submit" value="">
	  </div>
	  <div class="clearfix"> </div>
	</div> -->
    <div class="clearfix"> </div>
  </div>
</div>
<div class="about">
  <div class="container">
      <div class="register">
		  	  <form id="regiter_form"> 
				 <div class="register-top-grid">
					<h3>注册信息（ * 为必填 ）</h3>
					 <div>
						<span>用户名<label style="color: red">*</label></span>
						<input type="text" name="custName" autofocus="autofocus"> 
					 </div>
					 <div>
						<span>昵称<label style="color: red">*</label></span>
						<input type="text" name="custNick"> 
					 </div>
					 <div>
						 <span>邮箱<label style="color: red">*</label></span>
						 <input type="email" name="custEmail"> 
					 </div>
					 <div>
						<span>密码<label style="color: red">*</label></span>
						<input type="password">
					 </div>
					 <div><br/>
						<span>性别：
							<input type="radio" name="custGender" value="1" checked="checked">男&nbsp;&nbsp;
							<input type="radio" name="custGender" value="0">女&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							年龄：
							<input type="number" name="custAge" style="width: 200px">
						</span>
					 </div>
					 <div>
						<span>确认密码<label style="color: red">*</label></span>
						<input type="password" name="custPassword">
					 </div>
					 
					 </div>
				</form>
				<div class="clearfix"> </div>
				<div class="register-but">
				   <form>
					   <input type="button" id="regiter_btn" value="注册">
					   <div class="clearfix"> </div>
				   </form>
				</div>
		   </div>
	</div>
</div>
<div class="footer_bg">
</div>
<div class="footer">
	<div class="container">
		<div class="col-md-3 f_grid1">
			<h3>About</h3>
			<a href="#"><img src="${APP_PATH }/fashion_page/images/logo.png" alt=""/></a>
			<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,</p>
		</div>
		<div class="col-md-3 f_grid1 f_grid2">
			<h3>Follow Us</h3>
			<ul class="social">
				<li><a href=""> <i class="fb"> </i><p class="m_3">Facebook</p><div class="clearfix"> </div></a></li>
			    <li><a href=""><i class="tw"> </i><p class="m_3">Twittter</p><div class="clearfix"> </div></a></li>
				<li><a href=""><i class="google"> </i><p class="m_3">Google</p><div class="clearfix"> </div></a></li>
				<li><a href=""><i class="instagram"> </i><p class="m_3">Instagram</p><div class="clearfix"> </div></a></li>
			</ul>
		</div>
		<div class="col-md-6 f_grid3">
			<h3>Contact Info</h3>
			<ul class="list">
				<li><p>Phone : 1.800.254.5487</p></li>
				<li><p>Fax : 1.800.254.2548</p></li>
				<li><p>Email : <a href="mailto:info(at)fashionpress.com"> info(at)fashionpress.com</a></p></li>
			</ul>
			<ul class="list1">
				<li><p>Aliquam augue a bibendum ipsum diam, semper porttitor libero elit egestas gravida, ut quam, nunc taciti</p></li>
			</ul>
			<div class="clearfix"> </div>
		</div>
	</div>
</div>
<div class="footer_bottom">
       	<div class="container">
       		<div class="cssmenu">
				<ul>
					<li class="active"><a href="login.html">Privacy Policy</a></li> .
					<li><a href="checkout.html">Terms of Service</a></li> .
					<li><a href="checkout.html">Creative Rights Policy</a></li> .
					<li><a href="login.html">Contact Us</a></li> .
					<li><a href="register.html">Support & FAQ</a></li>
				</ul>
			</div>
			<div class="copy">
			    <p>Copyright &copy; 2015.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
		    </div>
		    <div class="clearfix"> </div>
       	</div>
</div>
<script type="text/javascript">
	$("#regiter_btn").click(function () {
		$.ajax({
			url : "${APP_PATH}/customer/regiterCust",
			type : "POST",
			data : $("#regiter_form").serialize(),
			success : function(result){
				console.log(result);
				if(result.code == 100){
					layui.use('layer', function(){
						  var layer = layui.layer;
						  layer.msg('注册成功！即将跳转到登录界面！', {
							  icon: 1,
							  time: 3000 //2秒关闭（如果不配置，默认是3秒）
							}, function(){
								$(location).attr('href', '${APP_PATH}/fashion_page/login.jsp');
							}); 
						});  
				}else{
					layui.use('layer', function(){
						  var layer = layui.layer;
						  layer.msg(result.extend.fail, {
							  icon: 2,
							  time: 3000 //2秒关闭（如果不配置，默认是3秒）
							})
						});  
				}
			},error: function(XMLHttpRequest, textStatus, errorThrown) {
                if(textStatus == "error"){
              	  layer.msg("添加失败！数据有误！", {
						  icon: 2,
						  time: 3000 //2秒关闭（如果不配置，默认是3秒）
						})
                }
            }
		});
	});


</script>
</body>
</html>		