<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar page-header">
			<a href="#"
				class="btn btn-link sidebar-mobile-toggle d-md-none mr-auto"> <i
				class="fa fa-bars"></i>
			</a> <a class="navbar-brand" href="${APP_PATH}/admin/toIndex"> <img
				src="${APP_PATH}/static/admin/imgs/logo.png" alt="logo">
			</a> <a href="#" class="btn btn-link sidebar-toggle d-md-down-none">
				<i class="fa fa-bars"></i>
			</a>

			<ul class="navbar-nav ml-auto">
				<li class="nav-item d-md-down-none"><a href="#"> <i
						class="fa fa-bell"></i> <span
						class="badge badge-pill badge-danger">5</span>
				</a></li>

				<li class="nav-item d-md-down-none"><a href="#"> <i
						class="fa fa-envelope-open"></i> <span
						class="badge badge-pill badge-danger">5</span>
				</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<img src="${APP_PATH}/static/admin/imgs/avatar-1.png"
						class="avatar avatar-sm" alt="logo"> <span
						class="small ml-1 d-md-down-none">${sessionScope.adminName}</span>
				</a>

					<div class="dropdown-menu dropdown-menu-right">
						<div class="dropdown-header">统计</div>

						<a href="#" class="dropdown-item"> <i class="fa fa-user"></i>
							文件
						</a> <a href="#" class="dropdown-item"> <i class="fa fa-envelope"></i>
							消息
						</a>

						<div class="dropdown-header">设置</div>

						<a href="#" class="dropdown-item"> <i class="fa fa-bell"></i>
							通知日志
						</a> <a href="#" class="dropdown-item"> <i class="fa fa-wrench"></i>
							编辑资料
						</a> <a href="${APP_PATH}/admin/signOut" class="dropdown-item"> <i class="fa fa-lock"></i>
							退出登录
						</a>
					</div></li>
			</ul>
		</nav>