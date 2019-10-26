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
<title>Carbon - Admin Template</title>
<link rel="stylesheet"
	href="${APP_PATH}/static/admin/vendor/simple-line-icons/css/simple-line-icons.css">
<link rel="stylesheet"
	href="${APP_PATH}/static/admin/vendor/font-awesome/css/fontawesome-all.min.css">
<link rel="stylesheet" href="${APP_PATH}/static/admin/css/styles.css">
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
					<div class="row">
						<div class="col-md-3">
							<div class="card p-4">
								<div
									class="card-body d-flex justify-content-between align-items-center">
									<div>
										<span class="h4 d-block font-weight-normal mb-2">54</span> <span
											class="font-weight-light">Total Users</span>
									</div>

									<div class="h2 text-muted">
										<i class="icon icon-people"></i>
									</div>
								</div>
							</div>
						</div>

						<div class="col-md-3">
							<div class="card p-4">
								<div
									class="card-body d-flex justify-content-between align-items-center">
									<div>
										<span class="h4 d-block font-weight-normal mb-2">$32,400</span>
										<span class="font-weight-light">Income</span>
									</div>

									<div class="h2 text-muted">
										<i class="icon icon-wallet"></i>
									</div>
								</div>
							</div>
						</div>

						<div class="col-md-3">
							<div class="card p-4">
								<div
									class="card-body d-flex justify-content-between align-items-center">
									<div>
										<span class="h4 d-block font-weight-normal mb-2">900</span> <span
											class="font-weight-light">Downloads</span>
									</div>

									<div class="h2 text-muted">
										<i class="icon icon-cloud-download"></i>
									</div>
								</div>
							</div>
						</div>

						<div class="col-md-3">
							<div class="card p-4">
								<div
									class="card-body d-flex justify-content-between align-items-center">
									<div>
										<span class="h4 d-block font-weight-normal mb-2">32s</span> <span
											class="font-weight-light">Time</span>
									</div>

									<div class="h2 text-muted">
										<i class="icon icon-clock"></i>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="row ">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">Total Users</div>

								<div class="card-body p-0">
									<div class="p-4">
										<canvas id="line-chart" width="100%" height="20"></canvas>
									</div>

									<div
										class="justify-content-around mt-4 p-4 bg-light d-flex border-top d-md-down-none">
										<div class="text-center">
											<div class="text-muted small">Total Traffic</div>
											<div>12,457 Users (40%)</div>
										</div>

										<div class="text-center">
											<div class="text-muted small">Banned Users</div>
											<div>95,333 Users (5%)</div>
										</div>

										<div class="text-center">
											<div class="text-muted small">Page Views</div>
											<div>957,565 Pages (50%)</div>
										</div>

										<div class="text-center">
											<div class="text-muted small">Total Downloads</div>
											<div>957,565 Files (100 TB)</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="${APP_PATH}/static/admin/vendor/jquery/jquery.min.js"></script>
	<script src="${APP_PATH}/static/admin/vendor/popper.js/popper.min.js"></script>
	<script src="${APP_PATH}/static/admin/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH}/static/admin/vendor/chart.js/chart.min.js"></script>
	<script src="${APP_PATH}/static/admin/js/carbon.js"></script>
</body>
</html>
