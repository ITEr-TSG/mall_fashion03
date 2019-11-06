<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>后台登录</title>
    <link rel="stylesheet" href="${APP_PATH}/static/admin/vendor/simple-line-icons/css/simple-line-icons.css">
    <link rel="stylesheet" href="${APP_PATH}/static/admin/vendor/font-awesome/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="${APP_PATH}/static/admin/css/styles.css">
    <link rel="stylesheet" href="${APP_PATH}/static/verify/verify.css" >
    <script src="${APP_PATH}/static/admin/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/verify/verify.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/layer/layer.js"></script>
</head>
<body>
<div class="page-wrapper flex-row align-items-center">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-5">
            	<form action="${APP_PATH}/admin/login" method="POST">
                <div class="card p-4">
                    <div class="card-header text-center text-uppercase h4 font-weight-light">
                      	  管理员登录
                    </div>

                    <div class="card-body">
                        <div class="form-group">
                            <label class="form-control-label">用户名</label>
                            <input type="text" class="form-control" required="required" name="adminName" autofocus="autofocus">
                        </div>

                        <div class="form-group">
                            <label class="form-control-label">密码</label>
                            <input type="password" required="required" name="adminPassword" class="form-control">
                        </div>
                        
                        <div class="form-group">
                            <div id="mpanel"></div>
                        </div>
                    </div>
                    <div class="col-6">
                        <button type="submit" disabled="disabled" id="adminLoginBtn" class="btn btn-primary px-5">登录</button>
                    </div>

                    <!-- <div class="col-6">
                        <a href="#" class="btn btn-link">Forgot password?</a>
                    </div> -->
                    
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="${APP_PATH}/static/admin/vendor/popper.js/popper.min.js"></script>
<script src="${APP_PATH}/static/admin/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="${APP_PATH}/static/admin/vendor/chart.js/chart.min.js"></script>
<script src="${APP_PATH}/static/admin/js/carbon.js"></script>
<script type="text/javascript">
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
		$("#adminLoginBtn").removeAttr("disabled");
	},
	error : function() {
		$("#adminLoginBtn").attr("disabled","disabled");
	}
});
var msg = '<%=request.getSession().getAttribute("error")%>'
if(msg!='null'){
	layer.msg(msg,{icon: 5})
}
</script>

</body>
</html>
