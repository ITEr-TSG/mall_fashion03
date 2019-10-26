<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="sidebar-nav">
					<ul class="nav">
						<li class="nav-title">导航栏</li>

						<li class="nav-item"><a href="${APP_PATH}/admin/toIndex"
							class="nav-link active"> <i class="icon icon-speedometer"></i>
								后台管理
						</a></li>

						<li class="nav-item nav-dropdown"><a href="#"
							class="nav-link nav-dropdown-toggle"> <i
								class="icon icon-people"></i> 客户管理 <i
								class="fa fa-caret-left"></i>
						</a>

							<ul class="nav-dropdown-items">
								<li class="nav-item"><a href="${APP_PATH}/customer/getAllCust"
									class="nav-link"> <i class="icon icon-target"></i> 所有用户
								</a></li>

								<li class="nav-item"><a href="${APP_PATH}/customer/addCust"
									class="nav-link"> <i class="icon icon-target"></i> 增加用户
								</a></li>

								<li class="nav-item"><a href="${APP_PATH}/customer/statisticsCusts"
									class="nav-link"> <i class="icon icon-target"></i> 
									用户统计
								</a></li>

								<!-- <li class="nav-item"><a href="layouts-hidden-sidebar.html"
									class="nav-link"> <i class="icon icon-target"></i> Hidden
										Sidebar
								</a></li> -->
							</ul></li>
							
						<li class="nav-item nav-dropdown"><a href="#"
							class="nav-link nav-dropdown-toggle"> <i
								class="fa fa-align-center"></i> 商品管理<i
								class="fa fa-caret-left"></i>
						</a>

							<ul class="nav-dropdown-items">
								<li class="nav-item"><a href="${APP_PATH}/wares/addWares"
									class="nav-link"> <i class="fa fa-align-center"></i> 添加商品
								</a></li>

								<li class="nav-item"><a href="${APP_PATH}/wares/allWares"
									class="nav-link"> <i class="fa fa-align-center"></i> 查看商品
								</a></li>

								<li class="nav-item"><a href="${APP_PATH}/wares/statisticsWares"
									class="nav-link"> <i class="fa fa-align-center"></i> 
									商品统计
								</a></li>

								<!-- <li class="nav-item"><a href="layouts-hidden-sidebar.html"
									class="nav-link"> <i class="icon icon-target"></i> Hidden
										Sidebar
								</a></li> -->
							</ul></li>

						<li class="nav-item nav-dropdown"><a href="#"
							class="nav-link nav-dropdown-toggle"> <i
								class="icon icon-energy"></i> 订单管理 <i
								class="fa fa-caret-left"></i>
						</a>

							<ul class="nav-dropdown-items">
								<li class="nav-item"><a href="alerts.html" class="nav-link">
										<i class="icon icon-energy"></i> 所有订单
								</a></li>

								<li class="nav-item"><a href="buttons.html"
									class="nav-link"> <i class="icon icon-energy"></i> Buttons
								</a></li>

								<li class="nav-item"><a href="cards.html" class="nav-link">
										<i class="icon icon-energy"></i> Cards
								</a></li>

								<li class="nav-item"><a href="modals.html" class="nav-link">
										<i class="icon icon-energy"></i> Modals
								</a></li>

								<li class="nav-item"><a href="tabs.html" class="nav-link">
										<i class="icon icon-energy"></i> Tabs
								</a></li>

								<li class="nav-item"><a href="progress-bars.html"
									class="nav-link"> <i class="icon icon-energy"></i> Progress
										Bars
								</a></li>

								<li class="nav-item"><a href="widgets.html"
									class="nav-link"> <i class="icon icon-energy"></i> Widgets
								</a></li>
							</ul></li>

						<li class="nav-item nav-dropdown"><a href="#"
							class="nav-link nav-dropdown-toggle"> <i
								class="icon icon-graph"></i> Charts <i class="fa fa-caret-left"></i>
						</a>

							<ul class="nav-dropdown-items">
								<li class="nav-item"><a href="chartjs.html"
									class="nav-link"> <i class="icon icon-graph"></i> Chart.js
								</a></li>
							</ul></li>

						<li class="nav-item"><a href="forms.html" class="nav-link">
								<i class="icon icon-puzzle"></i> Forms
						</a></li>

						<li class="nav-item"><a href="tables.html" class="nav-link">
								<i class="icon icon-grid"></i> Tables
						</a></li>

						<li class="nav-title">More</li>

						<li class="nav-item nav-dropdown"><a href="#"
							class="nav-link nav-dropdown-toggle"> <i
								class="icon icon-umbrella"></i> Pages <i
								class="fa fa-caret-left"></i>
						</a>

							<ul class="nav-dropdown-items">
								<li class="nav-item"><a href="blank.html" class="nav-link">
										<i class="icon icon-umbrella"></i> Blank Page
								</a></li>

								<li class="nav-item"><a href="login.html" class="nav-link">
										<i class="icon icon-umbrella"></i> Login
								</a></li>

								<li class="nav-item"><a href="register.html"
									class="nav-link"> <i class="icon icon-umbrella"></i>
										Register
								</a></li>

								<li class="nav-item"><a href="invoice.html"
									class="nav-link"> <i class="icon icon-umbrella"></i>
										Invoice
								</a></li>

								<li class="nav-item"><a href="404.html" class="nav-link">
										<i class="icon icon-umbrella"></i> 404
								</a></li>

								<li class="nav-item"><a href="500.html" class="nav-link">
										<i class="icon icon-umbrella"></i> 500
								</a></li>

								<li class="nav-item"><a href="settings.html"
									class="nav-link"> <i class="icon icon-umbrella"></i>
										Settings
								</a></li>
							</ul></li>
					</ul>
				</nav>