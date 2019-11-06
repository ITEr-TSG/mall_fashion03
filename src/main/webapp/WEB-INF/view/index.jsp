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
<script src="${APP_PATH}/static/vue/vue.min.js"></script>
<script src="${APP_PATH}/static/vue/vue-resource.min.js"></script>
<script src="${APP_PATH}/static/layui/layui.js"></script>
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
					<div class="row" id="index_count">
						<div class="col-md-3">
							<div class="card p-4">
								<div
									class="card-body d-flex justify-content-between align-items-center">
									<div >
										<span class="h4 d-block font-weight-normal mb-2">{{indexCount.custCount}}</span> <span
											class="font-weight-light">客户数量</span>
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
										<span class="h4 d-block font-weight-normal mb-2">￥{{indexCount.priceTotal}}</span>
										<span class="font-weight-light">总收入</span>
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
										<span class="h4 d-block font-weight-normal mb-2">{{indexCount.waresCount}}</span> <span
											class="font-weight-light">商品数量</span>
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
										<span class="h4 d-block font-weight-normal mb-2" id="contactCount">32s</span> <span
											class="font-weight-light">待处理留言</span>
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
								<div class="card-header">
                                	处理留言
                            	</div>
                            	<div class="p-4">
                            		<table id="contactTable" lay-filter='contactFilter'></table>
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
<script>
	var waresCount = new Vue({
		el:"#index_count",
		data:{
			indexCount:[]
		},
		created: function () {
			this.$http.get("${APP_PATH}/statisticsCount/indexCount").then(function(response){
				//成功
				this.indexCount=response.body;
			},function(response) {
				//错误
				console.log("查询分类时，出现系统错误！")
			});
		}
		
	});


	layui.use(['table','layer'], function(){
	  var table = layui.table;
	  var layer = layui.layer;
	  //第一个实例
	  table.render({
	    elem: '#contactTable'
	    ,height: 600
	    ,url: '${APP_PATH}/contact/getAllContact' //数据接口
	    ,page: true //开启分页
	    ,cols: [[ //表头
	      {field: 'contactId', title: '序号'}
	      ,{field: 'contactName', title: '称呼'}
	      ,{field: 'contactEmail', title: 'Email'}
	      ,{field: 'contactText', title: '内容'}
	      ,{field: 'creatTime', title: '时间'}
	      ,{title: '操做',toolbar: '#operateContact'}
	    ]]
	    ,skin: 'line' //行边框风格
   	    ,size: 'lg' //小尺寸的表格
	    ,text: {
	        none: '暂留言可以处理' //默认：无数据
	      }
	    ,parseData: function(res){ //res 即为原始返回的数据
	    	$("#contactCount").html(res.count)
		    return {
		      "code": res.code, //解析接口状态
		      "msg": res.msg, //解析提示文本
		      "count": res.count, //解析数据长度
		      "data": res.data //解析数据列表
		    };
		  }
	  });
	//监听工具条 
	table.on('tool(contactFilter)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
	  var data = obj.data; //获得当前行数据
	  var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
	  var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
	 	if(layEvent === 'del'){ //删除
	    layer.confirm('确认已经查看？', function(index){
	      obj.del(); 
	      layer.close(index);
	      $.ajax({
	    	  url:"${APP_PATH}/contact/delContactById?id="+data.contactId,
	    	  method:"get",
	    	  success:function(res){
	    		  if(res.code==100){
	    			  layer.msg("处理成功！", {icon: 6});
	    		  }else{
	    			  layer.msg("系统错误！", {icon: 5});
	    		  }
	    	  }
	      })
	    });
	  } 
	});
	});
</script>
<script type="text/html" id="operateContact">
  <a class="btn btn-sm btn-rounded btn-outline-success" lay-event="del">处理</a>
</script>
</body>
</html>
