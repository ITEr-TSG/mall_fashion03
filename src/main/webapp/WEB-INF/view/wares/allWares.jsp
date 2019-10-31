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
<title>所有商品</title>
<link rel="stylesheet"
	href="${APP_PATH}/static/admin/vendor/simple-line-icons/css/simple-line-icons.css">
<link rel="stylesheet"
	href="${APP_PATH}/static/admin/vendor/font-awesome/css/fontawesome-all.min.css">
<link rel="stylesheet" href="${APP_PATH}/static/admin/css/styles.css">
<link rel="stylesheet" href="${APP_PATH}/static/layui/css/layui.css"
	media="all">
<style type="text/css">
input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
}

input[type="number"] {
	-moz-appearance: textfield;
}
.layui-form-label {
	width: 100px;
}
</style>
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
					<div class="card">
						<div class="card-header bg-light">
							添加商品 &nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" id="delWares"
								class="btn btn-sm btn-rounded btn-outline-danger">
								<i class="fa fa-trash"></i> 选中删除
							</button>
						</div>

						<div class="card-body">
							<form action="${APP_PATH}/wares/addWare" id="add_wares_form"
								method="post" enctype="multipart/form-data">
								<div class="row">
									<div class="col-md-6">
										<!-- <label>Text addon</label> -->

										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text">商品名称</span>
											</div>
											<input type="text" name="waresName" class="form-control"
												placeholder="请输入商品名称">
										</div>

										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text">商品金额</span>
											</div>
											<input type="number" name="peice_min" placeholder="￥"
												class="form-control">
											<div class="input-group-append"
												style="margin-left: 5px; margin-right: 5px">
												<span class="input-group-text">-</span>
											</div>
											<input type="number" name="price_max" placeholder="￥"
												class="form-control">
										</div>
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text">适用季节</span>
											</div>
											<select id="single-select" name="waresSeaso"
												class="form-control">
												<option value="null" selected="selected">---请选择---</option>
												<option value="春季">春季</option>
												<option value="夏季">夏季</option>
												<option value="秋季">秋季</option>
												<option value="冬季">冬季</option>
											</select>
										</div>
										
									</div>


									<div class="col-md-6">
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text">适用人群</span>
											</div>
											<select id="single-select" name="waresOfMan"
												class="form-control">
												<option value="null" selected="selected">---请选择---</option>
												<option value="男">男</option>
												<option value="女">女</option>
												<option value="儿童-男">儿童-男</option>
												<option value="儿童-女">儿童-女</option>
												<option value="老人">老人</option>
											</select>
										</div>

										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text">商品分类</span>
											</div>
											<select name="waresClothingId" id="wares_clothingSele"
												class="form-control">
												<option value="0" selected="selected">---请选择---</option>
												<option v-for="item in clothing" :value="item.clothingId">{{item.clothingName}}</option>
											</select>
										</div>
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text">商品属性</span>
											</div>
											<select name="waresHotId" id="ishotSele" class="form-control">
												<option value="0" selected="selected">---请选择---</option>
												<option v-for="item in hot" :value="item.hotId">{{item.hotName}}</option>
											</select>
										</div>
									</div>

								</div>
								<button class="btn btn-outline-primary" lay-submit
									lay-filter="screenWares" style="margin-right: 10px">筛选</button>
								<button type="reset" class="btn btn-outline-secondary">重置</button>
							</form>
						</div>


						<div class="card-body" style="margin-top: 10px">
							<div class="table-responsive">

								<table class="table table-hover" lay-filter="grid-wares"
									id="listWares">

								</table>
							</div>
						</div>
						<div style="display: none" id="detailWaresModal">
							<form class="layui-form" style="margin: 10px">
								<div class="layui-form-item">
									<label class="layui-form-label">名称：</label>
									<div class="layui-input-block">
										<input type="text" readonly="readonly" id="detailModalWName" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">价格：</label>
									<div class="layui-input-block">
										<input type="text" readonly="readonly" id="detailModalWPrice" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">属性：</label>
									<div class="layui-input-block">
										<input type="text" readonly="readonly" id="detailModalWHot" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">适用人群：</label>
									<div class="layui-input-block">
										<input type="text" readonly="readonly" id="detailModalWMan" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">分类：</label>
									<div class="layui-input-block">
										<input type="text" readonly="readonly" id="detailModalWClothing" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">适用季节：</label>
									<div class="layui-input-block">
										<input type="text" readonly="readonly" id="detailModalWSeaso" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">上架时间：</label>
									<div class="layui-input-block">
										<input type="text" readonly="readonly" id="detailModalWTime" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">描述：</label>
									<div class="layui-input-block">
										<textarea readonly="readonly" id="detailModalWDes"  class="layui-textarea"></textarea>
									</div>
								</div>
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">图片：</label>
									<div class="layui-input-block">
									<img id="detailModalWImg" style="width:100px;height: 133px " src=""/>
									</div>
								</div>
								
							</form>
						</div>
						<!-- 修改模态框 -->
						<div style="display: none" id="editWaresModal">
							<form class="layui-form" id="editWaresModalForm" style="margin: 10px">
								<div class="layui-form-item">
									<label class="layui-form-label">名称：</label>
									<div class="layui-input-block">
									    <input type="hidden" id="editModalWId" name="waresId">
										<input type="text"  id="editModalWName" name="waresName" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">价格：</label>
									<div class="layui-input-block">
										<input type="text" name="waresPrice" id="editModalWPrice" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">属性：</label>
									<div class="layui-input-block">
									<select name="waresHotId" id="ishotSeleModal" class="form-control">
										<option v-for="item in hot" :value="item.hotId">{{item.hotName}}</option>
									</select>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">适用人群：</label>
									<div class="layui-input-block">
										<select id="waresManSele" name="waresOfMan"
											class="form-control">
											<option value="男">男</option>
											<option value="女">女</option>
											<option value="儿童-男">儿童-男</option>
											<option value="儿童-女">儿童-女</option>
											<option value="老人">老人</option>
										</select>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">分类：</label>
									<div class="layui-input-block">
										<select name="waresClothingId" id="wares_clothingSeleModal"
												class="form-control">
											<option v-for="item in clothing" :value="item.clothingId">{{item.clothingName}}</option>
										</select>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">适用季节：</label>
									<div class="layui-input-block">
										<select id="waresSeasoSele" name="waresSeaso"
											class="form-control">
											<option value="春季">春季</option>
											<option value="夏季">夏季</option>
											<option value="秋季">秋季</option>
											<option value="冬季">冬季</option>
										</select>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">尺码：</label>
								</div>
								
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">描述：</label>
									<div class="layui-input-block">
										<textarea  id="editModalWDes" name="waresDes"  class="layui-textarea"></textarea>
									</div>
								</div>
								<div class="layui-form-item layui-form-text">
									<label class="layui-form-label">图片：</label>
									<div class="layui-input-block">
									<img id="editModalWImg" style="width:100px;height: 133px "/>
									
									<input type="file"  name="file" id="upload-file" style="margin-left: 50px;width: 180px">
									<span class="help-block" style="color:orange;">重新选择的图片大小不要超过1M</span>
									</div>
								</div>
								<button class="btn btn-outline-primary" onclick="edit_wares_btn()" style="margin-left: 10px">修改</button>
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
	<script src="${APP_PATH}/static/admin/js/carbon.js"></script>
	<script src="${APP_PATH}/static/vue/vue.min.js"></script>
	<script src="${APP_PATH}/static/vue/vue-resource.min.js"></script>
	<script src="${APP_PATH}/static/layui/layui.js"></script>
	<script>
		var wares_clothingSele = new Vue({
			el : "#wares_clothingSele",
			data : {
				clothing : []
			},
			created : function() {
				this.$http.get("${APP_PATH}/clothingwares/getAll").then(function(response) {
					//成功
					this.clothing = response.body;
				}, function(response) {
					//错误
					console.log("查询分类时，出现系统错误！")
				});
			}
		});
		var wares_clothingSeleModal = new Vue({
			el : "#wares_clothingSeleModal",
			data : {
				clothing : []
			},
			created : function() {
				this.$http.get("${APP_PATH}/clothingwares/getAll").then(function(response) {
					//成功
					this.clothing = response.body;
				}, function(response) {
					//错误
					console.log("查询分类时，出现系统错误！")
				});
			}
		});
		var ishotSele = new Vue({
			el : "#ishotSele",
			data : {
				hot : []
			},
			created : function() {
				this.$http.get("${APP_PATH}/hotwares/getAll").then(function(response) {
					//成功
					this.hot = response.body;
				}, function(response) {
					//错误
					console.log("查询是否热销产品时，出现系统错误！")
				});
			}
		});
		var ishotSele = new Vue({
			el : "#ishotSeleModal",
			data : {
				hot : []
			},
			created : function() {
				this.$http.get("${APP_PATH}/hotwares/getAll").then(function(response) {
					//成功
					this.hot = response.body;
				}, function(response) {
					//错误
					console.log("查询是否热销产品时，出现系统错误！")
				});
			}
		});

		$(function() {
			renderTable();
		});

		function renderTable() {
			layui.use([ 'table', 'form' ], function() {
				var form = layui.form;
				var table = layui.table;//第一个实例
				var datas = $("#add_wares_form").serializeArray();
				/* var keydatas = new Array();
				//遍历获取到的数据
				$(datas).each(function(index, datas) {
					keydatas.push(datas); //只获取id，存入list
				}); */

				table.render({
					elem : '#listWares',
					id : 'idWares',//选中行
					height : 600,
					page : true,
					limit : 10,
					limits : [10, 15,20 ],
					size : 'lg',
					url : '${APP_PATH}/wares/getAllWares', //数据接口
					method : "POST",
					dataType : 'json',
					contentType : "application/json",//必须指定，否则会报415错误
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
					},{
						field : 'waresName',
						title : '商品名称',
						width : 200
					}, {
						field : 'waresPrice',
						title : '价格',
						width : 100
					}, {
						field : 'clothingwares',
						title : '分类',
						width : 110,
						templet : '<div>{{d.clothingwares.clothingName}}</div>'
					}, {
						field : 'hotwares',
						title : '属性',
						width : 150,
						templet : '<div>{{d.hotwares.hotName}}</div>'
					}, {
						field : 'waresOfMan',
						title : '适用人群',
						width : 100
					},{
						field : 'waresSeaso',
						title : '适用季节',
						width : 100
					},{
						title : '操做',
						width : 230,
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
				table.on('tool(grid-wares)', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
					var data = obj.data; //获得当前行数据
					var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
					var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
					if (layEvent === 'detailWares') { //查看
						$("#detailModalWName").val(data.waresName);
						$("#detailModalWPrice").val(data.waresPrice);
						$("#detailModalWHot").val(data.hotwares.hotName);
						$("#detailModalWMan").val(data.waresOfMan);
						$("#detailModalWClothing").val(data.clothingwares.clothingName);
						$("#detailModalWSeaso").val(data.waresSeaso);
						$("#detailModalWTime").val(data.creatTime);
						$("#detailModalWDes").val(data.waresDes);
						$("#detailModalWImg").attr("src",data.waresImg)
						var index = layer.open({
							title : '查看商品',
							fix : true,
							maxmin : true,
							area: ['800px','700px'],
							resize :false,
							move: false,
							zIndex : 500,
							shadeClose : false,
							shade : 0.4,
							type : 1,
							content : $('#detailWaresModal')
						});
						//向页面隐藏index
					} else if (layEvent === 'delWares') { //删除
						layer.confirm('真的删除行么', function(index) {
							obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
							//向服务端发送删除指令
							var waresIds = new Array();
							waresIds.push(obj.data.waresId); //只获取id，存入list
							delWares(waresIds);
						});
					} else if (layEvent === 'editWares') { //编辑
						$("#editModalWName").val(data.waresName);
						$("#editModalWPrice").val(data.waresPrice);
						$("#editModalWId").val(data.waresId);
						var waresHotSele = 'dd[lay-value=' + data.waresHotId + ']';
						$('#ishotSeleModal').siblings("div.layui-form-select").find('dl').find(waresHotSele).click();
						var waresManSele = 'dd[lay-value=' + data.waresOfMan + ']';
						$('#waresManSele').siblings("div.layui-form-select").find('dl').find(waresManSele).click();
						var waresClothingSele = 'dd[lay-value=' + data.waresClothingId + ']';
						$('#wares_clothingSeleModal').siblings("div.layui-form-select").find('dl').find(waresClothingSele).click();
						var waresSeasoSele = 'dd[lay-value=' + data.waresSeaso + ']';
						$('#waresSeasoSele').siblings("div.layui-form-select").find('dl').find(waresSeasoSele).click();
						$("#editModalWDes").val(data.waresDes);
						$("#editModalWImg").attr("src",data.waresImg)
						var index = layer.open({
							title : '修改商品',
							fix : true,
							maxmin : true,
							area: ['800px','700px'],
							resize :false,
							move: false,
							zIndex : 500,
							shadeClose : false,
							shade : 0.4,
							type : 1,
							content : $('#editWaresModal')
						});
					} else if (layEvent === 'LAYTABLE_TIPS') {
						layer.alert('Hi，头部工具栏扩展的右侧图标。');
					}
				});
				//筛选
				form.on('submit(screenWares)', function(data) {
					renderTable();
					return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
				});
			});

		}
		//批量删除
		$("#delWares").click(function() {
			layui.use('table', function() {
				var table = layui.table;
				var checkStatus = table.checkStatus('idWares'); //idTest 即为基础参数 id 对应的值
				wares = checkStatus.data;
				var waresIds = new Array();
				//遍历获取到的数据
				$(wares).each(function(index, wares) {
					waresIds.push(wares.waresId); //只获取id，存入list
				});
				layer.confirm('真的删除行么', function(index) {
					delWares(waresIds);
				});
			});
		});

		function delWares(waresIds) {
			layui.use('table', function() {
				var table = layui.table;
				$.ajax({
					url : "${APP_PATH}/wares/delWares",
					type : 'post',
					contentType : "application/json",//必须指定，否则会报415错误
					dataType : 'json',
					processData : false,
					data : JSON.stringify(waresIds),//序列化复杂对象
					//data:custIds,
					success : function(data) {
						console.log(data);
						if (data.code == 100) {
							layer.close();
							layer.msg(data.extend.msg, {
								icon : 1
							});
							//表格重载
							table.reload('idWares', {
								url : '${APP_PATH}/wares/getAllWares'
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
		//文件上传
		$('#upload-file').change(function() {
	        fileValid(this, 1024, 'image')
	    })
		function fileValid (value_, size_, type_) {
	    var file = value_.files[0]
	    var fileSize = (file.size / 1024).toFixed(0)
	    var fileType = value_.value.substring(value_.value.lastIndexOf("."))
	 
	    if (fileSize > size_) {
	    	layer.msg('文件过大！', {icon: 2}); 
	        return false;
	    }
	 
	    switch (type_) {
	        case 'image':
	            if (!fileType.match(/.jpg|.jpeg|.gif|.png|.bmp/i)) {
	            	layer.msg('请上传图片！', {icon: 2}); 
	                return false;
	            }
	            break;
	        default:
	            console.error('type_参数设置不正确！')
	            return false;
	            break;
	    		}
			}
		//修改商品信息
		function edit_wares_btn(){
		     var formData = new FormData($("#editWaresModalForm")[0]);
		     $.ajax({
		              url:'${APP_PATH}/wares/editWare',
		              type:'post',
		              data:formData,
		              //必须false才会自动加上正确的Content-Type
		              contentType: false,
		              //必须false才会避开jQuery对 formdata 的默认处理
		             //XMLHttpRequest会对 formdata 进行正确的处理
		             processData: false,
		             success:function(data){
		            	 if(data.code == 100){
		            		 layer.msg(data.extend.success, {icon: 1}); 
		            	 }else{
		            		 layer.msg(data.extend.error,{icon: 2});
		            	 }
		             },
		             error:function(data){
		                 console.log(data)
		                 alert("后台发生异常");
		             },
		             cache:false,
		             async:true
		         }); 
				 }
	</script>
	<script type="text/html" id="operate">
  <a class="btn btn-sm btn-rounded btn-outline-success" lay-event="detailWares">查看</a>
  <a class="btn btn-sm btn-rounded btn-outline-primary" lay-event="editWares">修改</a>
  <a class="btn btn-sm btn-rounded btn-outline-danger" lay-event="delWares">删除</a>
</script>

</body>
</html>
