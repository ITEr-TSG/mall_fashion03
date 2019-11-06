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
					<div class="card">
						<div class="card-header bg-light">
							客户列表&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" id="delCusts"
								class="btn btn-sm btn-rounded btn-outline-danger">
								<i class="fa fa-trash"></i> 选中删除
							</button>
						</div>
						<br>
						<form class="layui-form" id="screenForm">
							<div class="layui-row">
								<div class="layui-form-item layui-col-md4">
									<label class="layui-form-label">用户名</label>
									<div class="layui-input-block">
										<input type="text" name="custName" placeholder="请输入" autocomplete="off"
											class="layui-input">
									</div>
								</div>
								<div class="layui-form-item layui-col-md4">
									<label class="layui-form-label">邮箱</label>
									<div class="layui-input-block">
										<input type="text" name="custEmail" placeholder="请输入" autocomplete="off"
											class="layui-input">
									</div>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">性别</label>
								<div class="layui-input-block">
									<input type="radio" name="custGender" value="1" title="男"> 
									<input type="radio" name="custGender" value="0" title="女">
								</div>
							</div>
							<div class="layui-form-item">
								<div class="layui-inline">
									<label class="layui-form-label" style="margin-right: 30px">年龄</label>
									<div class="layui-input-inline" style="width: 100px;">
										<input type="text" name="age_min"
											autocomplete="off" class="layui-input">
									</div>
									<div class="layui-form-mid">-</div>
									<div class="layui-input-inline" style="width: 100px;">
										<input type="text" name="age_max"
											autocomplete="off" class="layui-input">
									</div>
								</div>
							</div>
							<div class="layui-form-item">
								<div class="layui-input-block">
									<button class="layui-btn" lay-submit lay-filter="screenCusts">筛选</button>
									<button type="reset" class="layui-btn layui-btn-primary">重置</button>
								</div>
							</div>
						</form>
						
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-hover" lay-filter="grid-custs"
									id="listCust">

								</table>
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
	<script src="${APP_PATH}/static/layui/layui.js"></script>
	<script>
		
		$(function() {
			renderTable();
		});

		function renderTable() {
			layui.use([ 'table', 'form' ], function() {
				var form = layui.form;
				var table = layui.table;//第一个实例
				var datas = $("#screenForm").serializeArray();
				/* var keydatas = new Array();
				//遍历获取到的数据
				$(datas).each(function(index, datas) {
					keydatas.push(datas); //只获取id，存入list
				}); */

				table.render({
					elem : '#listCust',//选中行
					id : 'idCusts',
					height : 400,
					page : true,
					limit : 5,
					limits : [ 5, 10, 15 ],
					size : 'lg',
					url : '${APP_PATH}/customer/getCusts', //数据接口
					method : "POST",
					dataType : 'json',
					contentType : "application/json",//必须指定，否则会报415错误
					dataType : 'json',
					processData : false,
					//序列化复杂对象
					where : {
						keydatas : datas
					},
					cols : [ [ //表头
					{
						field : 'check',
						title : '',
						type : 'checkbox',
						width : 50,
						sort : true
					}, {
						field : 'custId',
						title : 'ID',
						width : 80,
						sort : true
					}, {
						field : 'custName',
						title : '用户名',
						width : 200
					}, {
						field : 'custNick',
						title : '昵称',
						width : 150
					}, {
						field : 'custEmail',
						title : '邮箱',
						width : 300
					}, {
						field : 'custGender',
						title : '性别',
						width : 150,
						templet : function(d) {
							return d.custGender == 1 ? "男" : "女"
						}
					},
					/* {
						field : 'custState',
						title : '状态',
						width : 150,
						templet : function(d) {
							return d.custState == 1 ? "有效"
									: "无效"
						}
					}, */{
						title : '操做',
						width : 210,
						toolbar : '#operate'
					} ] ],
					parseData : function(res) { //res 即为原始返回的数据
						console.log(res);
						return {
							"code" : res.code, //解析接口状态
							"msg" : res.message, //解析提示文本
							"count" : res.count, //解析数据长度
							"data" : res.data
						//解析数据列表
						};
					},
				});

				table.on('tool(grid-custs)', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
					var data = obj.data; //获得当前行数据
					var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
					var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）

					if (layEvent === 'detailCust') { //查看
						console.log(data)
						var detailHtml = '<div class="layui-card"><div class="layui-card-header">查看<div class="layui-card-body">';

						detailHtml += '<div class="layui-form-item">'
						detailHtml += '<label class="layui-form-label">客户名</label>'
						detailHtml += '<div class="layui-input-block">'
						detailHtml += '<input type="text" readonly value="'+data.custName+'" class="layui-input">'
						detailHtml += '</div>'
						detailHtml += '</div>'
						detailHtml += '<div class="layui-form-item">'
						detailHtml += '<label class="layui-form-label">昵称</label>'
						detailHtml += '<div class="layui-input-block">'
						detailHtml += '<input type="text" readonly value="'+data.custNick+'" class="layui-input">'
						detailHtml += '</div>'
						detailHtml += '</div>'
						detailHtml += '<div class="layui-form-item">'
						detailHtml += '<label class="layui-form-label">邮箱</label>'
						detailHtml += '<div class="layui-input-block">'
						detailHtml += '<input type="text" readonly value="'+data.custEmail+'" class="layui-input">'
						detailHtml += '</div>'
						detailHtml += '</div>'

						detailHtml += '<div class="layui-form-item">'
						detailHtml += '<label class="layui-form-label">年龄</label>'
						detailHtml += '<div class="layui-input-block">'
						detailHtml += '<input type="text" readonly value="'+data.custAge+'" class="layui-input">'
						detailHtml += '</div></div>'
						detailHtml += '<div class="layui-form-item">'
						detailHtml += '<label class="layui-form-label">性别</label>'
						detailHtml += '<div class="layui-input-block">'
						detailHtml += '<input type="text" readonly value="'
						detailHtml += data.custGender == 1 ? '男' : '女'
						detailHtml += '" class="layui-input">'
						detailHtml += '</div>'
						detailHtml += '</div>'

						detailHtml += '</div></div></div>';
						layui.use('layer', function() {
							var layer = layui.layer;
							layer.open({
								type : 0,
								title : "",
								area : "600px",
								content : detailHtml
							});

						});
					} else if (layEvent === 'delCust') { //删除
						layer.confirm('真的删除行么', function(index) {
							obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
							//向服务端发送删除指令
							var custIds = new Array();
							custIds.push(obj.data.custId); //只获取id，存入list
							delCust(custIds);
						});
					} else if (layEvent === 'editCust') { //编辑
						console.log(data)
						var detailHtml = '<div class="layui-card"><div class="layui-card-header">修改客户信息<div class="layui-card-body">';
						/* <form class="layui-form" id="screenForm">
						<div class="layui-row"> */
						detailHtml += '<form id="editCust">'
						detailHtml += '<div class="layui-form-item"><input type="hidden" name="custId" value="'+data.custId+'">'
						detailHtml += '<label class="layui-form-label">客户名</label>'
						detailHtml += '<div class="layui-input-block">'
						detailHtml += '<input type="text" name="custName" value="'+data.custName+'" class="layui-input">'
						detailHtml += '</div>'
						detailHtml += '</div>'
						detailHtml += '<div class="layui-form-item">'
						detailHtml += '<label class="layui-form-label">昵称</label>'
						detailHtml += '<div class="layui-input-block">'
						detailHtml += '<input type="text" name="custNick" value="'+data.custNick+'" class="layui-input">'
						detailHtml += '</div>'
						detailHtml += '</div>'
						detailHtml += '<div class="layui-form-item">'
						detailHtml += '<label class="layui-form-label">邮箱</label>'
						detailHtml += '<div class="layui-input-block">'
						detailHtml += '<input type="text" name="custEmail" value="'+data.custEmail+'" class="layui-input">'
						detailHtml += '</div>'
						detailHtml += '</div>'

						detailHtml += '<div class="layui-form-item">'
						detailHtml += '<label class="layui-form-label">年龄</label>'
						detailHtml += '<div class="layui-input-block">'
						detailHtml += '<input type="text" name="custAge" value="'+data.custAge+'" class="layui-input">'
						detailHtml += '</div></div>'

						detailHtml += '<div class="layui-form-item"><label class="layui-form-label">性别</label><div class="layui-input-block">'
						detailHtml += '<input type="radio" name="custGender" value="1"'
						detailHtml += data.custGender == 1 ? "checked" : ""
						detailHtml += '>男</input>&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="custGender" value="0" '
						detailHtml += data.custGender == 0 ? "checked" : ""
						detailHtml += ' >女</input>'
						detailHtml += '</div></div></form>'

						detailHtml += '</div></div></div>';
						layui.use('layer', function() {
							var layer = layui.layer;
							layer.open({
								type : 0,
								title : "",
								area : "600px",
								content : detailHtml,
								yes : function(index, layero) {
									editCusts();
									layer.close(index); //如果设定了yes回调，需进行手工关闭
								}

							});

						});
					} else if (layEvent === 'LAYTABLE_TIPS') {
						layer.alert('Hi，头部工具栏扩展的右侧图标。');
					}
				});
				//筛选
				form.on('submit(screenCusts)', function(data) {
					renderTable();
					return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
				});
			});

		}
		//修改客户
		function editCusts() {
			layui.use('table', function() {
				var table = layui.table;
				$.ajax({
					url : "${APP_PATH}/customer/editCust",
					method : "POST",
					data : $("#editCust").serialize(),
					success : function(data) {
						console.log(data)
						if (data.code == 100) {
							layer.msg(data.msg, {
								icon : 1
							});
							//表格重载
							table.reload('idCusts', {
								url : '${APP_PATH}/customer/getCusts'
							});
						} else {
							layer.msg(data.msg, {
								icon : 2
							});
							//表格重载
							table.reload('idCusts', {
								url : '${APP_PATH}/customer/getCusts'
							});
						}
					}
				});
			});
		}
		//批量删除
		$("#delCusts").click(function() {
			layui.use('table', function() {
				var table = layui.table;
				var checkStatus = table.checkStatus('idCusts'); //idTest 即为基础参数 id 对应的值
				custs = checkStatus.data;
				var custIds = new Array();
				//遍历获取到的数据
				$(custs).each(function(index, custs) {
					custIds.push(custs.custId); //只获取id，存入list
				});
				layer.confirm('真的删除行么', function(index) {
					delCust(custIds);
				});
			});
		});
		//抽取得删除客户方法
		function delCust(custIds) {
			layui.use('table', function() {
				var table = layui.table;
				$.ajax({
					url : "${APP_PATH}/customer/delCusts",
					type : 'post',
					contentType : "application/json",//必须指定，否则会报415错误
					dataType : 'json',
					processData : false,
					data : JSON.stringify(custIds),//序列化复杂对象
					//data:custIds,
					success : function(data) {
						console.log(data);
						if (data.code == 100) {
							layer.close();
							layer.msg(data.extend.msg, {
								icon : 1
							});
							//表格重载
							table.reload('idCusts', {
								url : '${APP_PATH}/customer/getCusts'
							});
						} else {
							layer.msg(data.extend.msg, {
								icon : 2
							});
						}

					}
				});
			});
		}
	</script>
	<script type="text/html" id="operate">
  <a class="btn btn-sm btn-rounded btn-outline-success" lay-event="detailCust">查看</a>
  <a class="btn btn-sm btn-rounded btn-outline-primary" lay-event="editCust">修改</a>
  <a class="btn btn-sm btn-rounded btn-outline-danger" lay-event="delCust">删除</a>
</script>
</body>
</html>
