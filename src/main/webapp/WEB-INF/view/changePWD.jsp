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
<title>后台管理主页</title>
<link rel="stylesheet"
	href="${APP_PATH}/static/admin/vendor/simple-line-icons/css/simple-line-icons.css">
<link rel="stylesheet"
	href="${APP_PATH}/static/admin/vendor/font-awesome/css/fontawesome-all.min.css">
<link rel="stylesheet" href="${APP_PATH}/static/admin/css/styles.css">
<link rel="stylesheet" href="${APP_PATH}/static/layui/css/layui.css"
	media="all">
<script src="${APP_PATH}/static/admin/vendor/jquery/jquery.min.js"></script>
<link rel="stylesheet" href="${APP_PATH}/static/verify/verify.css" >
<script type="text/javascript" src="${APP_PATH}/static/verify/verify.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/layer/layer.js"></script>
<script src="${APP_PATH}/static/vue/vue.min.js"></script>
<script src="${APP_PATH}/static/vue/vue-resource.min.js"></script>
</head>
<body class="sidebar-fixed header-fixed">
	<div class="page-wrapper">
		<!-- 头部 -->
		<%@ include file="/WEB-INF/view/common/header.jsp"%>
		<div class="main-container">
			<div class="sidebar">
				<!-- 左侧导航 -->
				<%@ include file="/WEB-INF/view/common/left.jsp"%>
			</div>

			<div class="content">
				<div class="container-fluid">
					<div class="layui-col-md6" style="margin: 0 300px;">
						<form class="layui-form layui-form-pane" id="changePWDForm">
							<div class="layui-form-item">
							    <label class="layui-form-label">用户名：</label>
							    <div class="layui-input-block">
							      <input type="text" value='<%=request.getSession().getAttribute("adminName") %>' name="adminName" readonly="readonly" class="layui-input">
							    </div>
							</div>
							<div class="layui-form-item">
							    <label class="layui-form-label">旧密码</label>
							    <div class="layui-input-block">
							      <input type="text" name="oldPassword" required="required"  placeholder="请输入旧密码" class="layui-input">
							    </div>
							</div>
							<div class="layui-form-item">
							    <label class="layui-form-label">新密码</label>
							    <div class="layui-input-block">
							      <input type="text" name="newPassword" required="required"  placeholder="请输入新密码" class="layui-input">
							    </div>
							</div>
							<div class="layui-form-item">
								<div id="mpanel"></div>
							</div>
							<button type="button" id="changePWDBtn" class="layui-btn layui-btn-radius layui-btn-normal layui-btn-fluid">修改</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<script src="${APP_PATH}/static/admin/vendor/popper.js/popper.min.js"></script>
<script src="${APP_PATH}/static/admin/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="${APP_PATH}/static/admin/vendor/chart.js/chart.min.js"></script>
<script src="${APP_PATH}/static/admin/js/carbon.js"></script>
<script>
$('#mpanel').slideVerify({
	type : 1,		//类型
	vOffset : 5,	//误差量，根据需求自行调整
	barSize : {
		width : '100%',
		height : '40px',
	},
	ready : function() {
		
	},
	success : function() {
		$("#changePWDBtn").click(function(){
			$.ajax({
				url:"${APP_PATH}/admin/changePWD",
				method:"POST",
				data:$("#changePWDForm").serialize(),
				success:function(res){
					console.log(res)
					if(res.code==100){
						layer.msg(res.extend.msg,{icon: 6},function(){
							window.location.href="${APP_PATH}/admin/signOut"
						})
					}else{
						layer.msg(res.extend.msg,{icon: 5})
					}
				}
				
			});
		});
	},
	error : function() {
		$("#changePWDBtn").click(function(){
			layer.msg('请先通过验证',{icon: 7})
		});
	}
});
</script>
</body>
</html>
