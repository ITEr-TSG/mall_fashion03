<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>添加客户</title>
<link rel="stylesheet"
	href="${APP_PATH}/static/admin/vendor/simple-line-icons/css/simple-line-icons.css">
<link rel="stylesheet"
	href="${APP_PATH}/static/admin/vendor/font-awesome/css/fontawesome-all.min.css">
<link rel="stylesheet" href="${APP_PATH}/static/admin/css/styles.css">
<link rel="stylesheet" href="${APP_PATH}/static/layui/css/layui.css"
	media="all">
	<script src="${APP_PATH}/static/vue/vue.min.js"></script>
<script src="${APP_PATH}/static/vue/vue-resource.min.js"></script>
	<style type="text/css">
		.layui-form-label{
			 width: 100px
		}
		.mustLabel{
			color:red;
		}
	input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
        -webkit-appearance: none;
    }
    input[type="number"]{
        -moz-appearance: textfield;
    }

	</style>
</head>
<body class="sidebar-fixed header-fixed">
	<div class="page-wrapper">
		<%@ include file="/WEB-INF/view/common/header.jsp"%>
		<div class="main-container">
			<div class="sidebar">
				<!-- 左侧导航 -->
				<%@ include file="/WEB-INF/view/common/left.jsp"%>
			</div>

			<div class="content">
				<div class="container-fluid">
					<div class="layui-card">
						<div class="layui-card-header">添加客户</div>
						<div class="layui-card-body">
							<form class="layui-form layui-col-md-offset3" id="addCustForm">
								<div class="layui-form-item layui-col-md6">
									<label class="layui-form-label mustLabel">用户名</label>
									<div class="layui-input-block">
										<input type="text" name="custName" required lay-verify="required"
											placeholder="请输入用户名" autocomplete="off" class="layui-input">
									</div>
									<!-- <div class="layui-form-mid layui-word-aux">辅助文字</div> -->
								</div>
								<div class="layui-form-item layui-col-md6">
									<label class="layui-form-label mustLabel">昵称</label>
									<div class="layui-input-block">
										<input type="text" name="custNick" required lay-verify="required"
											placeholder="请输入昵称" autocomplete="off" class="layui-input">
									</div>
									<!-- <div class="layui-form-mid layui-word-aux">辅助文字</div> -->
								</div>
								<div class="layui-form-item layui-col-md6">
									<label class="layui-form-label mustLabel">邮箱</label>
									<div class="layui-input-block">
										<input type="email" name="custEmail" id="custEmailInput" required lay-verify="required"
											placeholder="请输入邮箱" autocomplete="off" class="layui-input">
									</div>
									<!-- <div class="layui-form-mid layui-word-aux">辅助文字</div> -->
								</div>
								<div class="layui-form-item layui-col-md6">
									<label class="layui-form-label mustLabel">密码</label>
									<div class="layui-input-block">
										<input type="password" name="title" id="password1" required lay-verify="required"
											placeholder="请输入密码" autocomplete="off" class="layui-input">
									</div>
									<!-- <div class="layui-form-mid layui-word-aux">辅助文字</div> -->
								</div>
								<div class="layui-form-item layui-col-md6">
									<label class="layui-form-label mustLabel">确认密码</label>
									<div class="layui-input-block">
										<input type="password" name="custPassword" id="password2" required lay-verify="required"
											placeholder="请确认密码" autocomplete="off" class="layui-input">
									</div>
									<!-- <div class="layui-form-mid layui-word-aux">辅助文字</div> -->
								</div>
								<div class="layui-form-item layui-col-md6">
									<label class="layui-form-label">年龄</label>
									<div class="layui-input-block">
										<input type="number" name="custAge"
											placeholder="请输入年龄" autocomplete="off" class="layui-input" maxlength="2">
									</div>
									<!-- <div class="layui-form-mid layui-word-aux">辅助文字</div> -->
								</div>
								
								
								
								
								<div class="layui-form-item">
									<label class="layui-form-label">性别</label>
									<div class="layui-input-block">
										<input type="radio" name="custGender" value="1" title="男"> <input
											type="radio" name="custGender" value="0" title="女" checked>
									</div>
								</div>
								
								<div class="layui-form-item">
									<div class="layui-input-block">
										<button class="layui-btn" lay-submit lay-filter="addCust">立即提交</button>
										<button type="reset" class="layui-btn layui-btn-primary">重置</button>
									</div>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<script src="${APP_PATH}/static/admin/vendor/jquery/jquery.min.js"></script>
	<script src="${APP_PATH}/static/admin/vendor/popper.js/popper.min.js"></script>
	<script
		src="${APP_PATH}/static/admin/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH}/static/admin/vendor/chart.js/chart.min.js"></script>
	<script src="${APP_PATH}/static/admin/js/carbon.js"></script>
	<script src="${APP_PATH}/static/layui/layui.js"></script>
	<script>
	layui.use(['form','layer'], function(){
		  var form = layui.form;
		  var layer = layui.layer;
		  //监听提交
		  form.on('submit(addCust)', function(data){
			   	var password1 = $("#password1").val();
				var password2 = $("#password2").val();
				if(password1 != password2){
					layer.msg('两次输入的密码不一致！', {icon: 5}); 
					return;
				}
				var custEmail = $("#custEmailInput").val();
				var verifyEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
				if(!verifyEmail.test(custEmail)){
					layer.msg('邮箱格式错误！', {icon: 5}); 
					return;
				}
				
			  var datas = $("#addCustForm").serialize();
			  $.ajax({
				  url:"${APP_PATH}/customer/regiterCust",
				  method:"POST",
				  data:$("#addCustForm").serialize(),
				  success:function(data){
					  if(data.code == 100){
						  layer.msg('添加成功！', {
							  icon: 1,
							  time: 3000 //2秒关闭（如果不配置，默认是3秒）
							}, function(){
								$(location).attr('href', '${APP_PATH}/customer/getAllCust');
							});
							
					  }else{
						  layer.msg(data.extend.fail, {
							  icon: 2,
							  time: 3000 //2秒关闭（如果不配置，默认是3秒）
							})
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
			  
		    return false;
		  });
		});
	</script>

</body>
</html>
