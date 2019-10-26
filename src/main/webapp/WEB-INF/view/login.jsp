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
    <title>Carbon - Admin Template</title>
    <link rel="stylesheet" href="${APP_PATH}/static/admin/vendor/simple-line-icons/css/simple-line-icons.css">
    <link rel="stylesheet" href="${APP_PATH}/static/admin/vendor/font-awesome/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="${APP_PATH}/static/admin/css/styles.css">
</head>
<body>
<div class="page-wrapper flex-row align-items-center">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-5">
            	<form action="${APP_PATH}/admin/login" method="POST" >
                <div class="card p-4">
                    <div class="card-header text-center text-uppercase h4 font-weight-light">
                      	  管理员登录
                    </div>

                    <div class="card-body">
                        <div class="form-group">
                            <label class="form-control-label">用户名</label>
                            <input type="text" class="form-control" name="adminName" autofocus="autofocus">
                        </div>

                        <div class="form-group">
                            <label class="form-control-label">密码</label>
                            <input type="password" name="adminPassword" class="form-control">
                        </div>

                        <div class="custom-control custom-checkbox mt-4">
                            <i style="color: red">${sessionScope.error}</i>
                        </div>
                    </div>

                    
                            <div class="col-6">
                                <button type="submit" class="btn btn-primary px-5">登录</button>
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
<script src="${APP_PATH}/static/admin/vendor/jquery/jquery.min.js"></script>
<script src="${APP_PATH}/static/admin/vendor/popper.js/popper.min.js"></script>
<script src="${APP_PATH}/static/admin/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="${APP_PATH}/static/admin/vendor/chart.js/chart.min.js"></script>
<script src="${APP_PATH}/static/admin/js/carbon.js"></script>
<script src="${APP_PATH}/static/admin/js/demo.js"></script>
</body>
</html>
