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
<link rel="stylesheet" href="${APP_PATH}/static/verify/verify.css" >
<script type="text/javascript" src="${APP_PATH}/static/verify/verify.min.js"></script>
</head>
<style>
	.btn.disabled, .btn:disabled {
	    opacity: .65;
	}
	input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
        -webkit-appearance: none;
    }
    input[type="number"]{
        -moz-appearance: textfield;
    }

</style>
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
		  	  <form id="regiter_form"> 
				 <div class="register-top-grid">
					<h3>注册信息（ * 为必填 ）</h3>
					 <div>
						<span>用户名<label style="color: red">*</label></span>
						<input type="text" name="custName"> 
					 </div>
					 <div>
						<span>昵称<label style="color: red">*</label></span>
						<input type="text" name="custNick"> 
					 </div>
					 <div>
						 <span>邮箱<label style="color: red">*</label></span>
						 <input type="email" id="custEmailInput" name="custEmail"> 
					 </div>
					 <div>
						<span>密码<label style="color: red">*</label></span>
						<input type="password" id="password1">
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
						<input type="password" name="custPassword" id="password2">
					 </div>
					 
					 </div>
				</form>
				<div class="clearfix"> </div>
				<div id="mpanel"></div>
				<div class="register-but">
				   <form>
					   <input type="button" class="btn" disabled="disabled" id="regiter_btn" value="注册">
					   <div class="clearfix"> </div>
				   </form>
				</div>
		   </div>
	</div>
</div>
<div class="footer_bg">
</div>
<%@ include file="/fashion_page/commonPage/footer.jsp" %>

<script type="text/javascript">
	$('#mpanel').slideVerify({
		type : 1,		//类型
		vOffset : 5,	//误差量，根据需求自行调整
		barSize : {
			width : '30%',
			height : '40px',
		},
		ready : function() {
			
		},
		success : function() {
			$("#regiter_btn").removeAttr("disabled");
		},
		error : function() {
			$("#regiter_btn").attr("disabled","disabled");
		}
	});
	$("#regiter_btn").click(function () {
		var password1 = $("#password1").val();
		var password2 = $("#password2").val();
		if(password1 != password2){
			layui.use('layer', function(){
				var layer = layui.layer;
				layer.msg('两次输入的密码不一致！', {icon: 5}); 
			});
			return;
		}
		var custEmail = $("#custEmailInput").val();
		var verifyEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
		if(!verifyEmail.test(custEmail)){
			layui.use('layer', function(){
				var layer = layui.layer;
				layer.msg('邮箱格式错误！', {icon: 5}); 
			});
			return;
		}
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