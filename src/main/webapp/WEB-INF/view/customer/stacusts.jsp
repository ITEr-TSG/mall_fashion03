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
<title>统计客户</title>
<link rel="stylesheet"
	href="${APP_PATH}/static/admin/vendor/simple-line-icons/css/simple-line-icons.css">
<link rel="stylesheet"
	href="${APP_PATH}/static/admin/vendor/font-awesome/css/fontawesome-all.min.css">
<link rel="stylesheet" href="${APP_PATH}/static/admin/css/styles.css">
<link rel="stylesheet" href="${APP_PATH}/static/layui/css/layui.css"
	media="all">
	<script src="${APP_PATH}/static/vue/vue.min.js"></script>
<script src="${APP_PATH}/static/vue/vue-resource.min.js"></script>
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
					<div class="row">
					<div class="col-md-6">
                    <div class="card">
                        <div class="card-header bg-light">
                            	性别统计
                        </div>

                        <div class="card-body"><div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>
                            <canvas id="gender-chart" width="698" height="348" class="chartjs-render-monitor" style="display: block; height: 279px; width: 559px;"></canvas>
                        </div>
                </div>
                </div>
                <div class="col-md-6">
	                    <div class="card">
	                        <div class="card-header bg-light">
	                            	年龄统计
	                        </div>
	
	                        <div class="card-body"><div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>
	                            <canvas id="age-chart" width="698" height="348" class="chartjs-render-monitor" style="display: block; height: 279px; width: 559px;"></canvas>
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
	<script
		src="${APP_PATH}/static/admin/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH}/static/admin/vendor/chart.js/chart.min.js"></script>
	<script src="${APP_PATH}/static/admin/js/carbon.js"></script>
	<%-- <script src="${APP_PATH}/static/admin/js/demo.js"></script> --%>
	<script src="${APP_PATH}/static/layui/layui.js"></script>
	<script>
	
	$(document).ready(function () {
		$.ajax({
			url:"${APP_PATH}/customer/staCusts",
			method:"GET",
			success:function(data){
				//console.log(data)
				//性别统计
				var gender = new Array();
				var age = new Array();
				if(data.code==100){
					gender[0] = data.extend.countMan;
					gender[1] = data.extend.countWoman;
					age[0] = data.extend.age19;
					age[1] = data.extend.age29;
					age[2] = data.extend.age59;
					age[3] = data.extend.age100;
					
					
					//渲染图表
					var genderChart = $('#gender-chart');
					 if (genderChart.length > 0) {
					        new Chart(genderChart, {
					            type: 'pie',
					            data: {
					                labels: ["女", "男"],
					                datasets: [{
					                    label: '性别统计',//鼠标指向某个柱时，柱上面显示的标签 比如：'出库'（指着电脑列时会显示这列表示 出库）
					                    data: gender,//柱子表示的数据 
					                    backgroundColor: [
					                        'rgba(244, 88, 70, 0.5)',
					                        'rgba(33, 150, 243, 0.5)',
					                    ],
					                    borderColor: [
					                        'rgba(244, 88, 70, 0.5)',
					                        'rgba(33, 150, 243, 0.5)',
					                    ],
					                    borderWidth: 1
					                }]
					            }
					        });
					    }
					//年龄统计
					var ageChart = $('#age-chart');
				    if (ageChart.length > 0) {
				        new Chart(ageChart, {
				            type: 'bar',
				            data: {
				                labels: ["0~19", "20~29", "30~59", "60~100"],
				                datasets: [{
				                    label: '年龄统计',
				                    data: age,
				                    backgroundColor: [
				                        'rgba(244, 88, 70, 0.5)',
				                        'rgba(33, 150, 243, 0.5)',
				                        'rgba(0, 188, 212, 0.5)',
				                        'rgba(42, 185, 127, 0.5)',
				                        
				                    ],
				                    borderColor: [
				                        '#F45846',
				                        '#2196F3',
				                        '#00BCD4',
				                        '#2ab97f',
				                    ],
				                    borderWidth: 1
				                }]
				            },
				            options: {
				                legend: {
				                    display: false
				                },
				                scales: {
				                    yAxes: [{
				                        ticks: {
				                            beginAtZero: true
				                        }
				                    }]
				                }
				            }
				        });
				    }
					 
					 
				}else{
					alert("系统繁忙！");
				}
			}
			
		});
	   
		
		
		
	})
	</script>

</body>
</html>
