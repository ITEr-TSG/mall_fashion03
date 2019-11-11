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
<title>添加商品</title>
<link rel="stylesheet"
	href="${APP_PATH}/static/admin/vendor/simple-line-icons/css/simple-line-icons.css">
<link rel="stylesheet"
	href="${APP_PATH}/static/admin/vendor/font-awesome/css/fontawesome-all.min.css">
<link rel="stylesheet" href="${APP_PATH}/static/admin/css/styles.css">
	<script src="${APP_PATH}/static/vue/vue.min.js"></script>
	<script src="${APP_PATH}/static/vue/vue-resource.min.js"></script>
<%-- <link rel="stylesheet" href="${APP_PATH}/static/layui/css/layui.css"
	media="all"> --%>
<style type="text/css">
input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
}

input[type="number"] {
	-moz-appearance: textfield;
}
</style>
</head>
<body class="sidebar-fixed header-fixed">
	<!-- 模态框 -->
	<div class="modal fade" id="add_hot" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" style="display: none;"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header bg-primary border-0">
					<h5 class="modal-title text-white">添加商品属性</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>

				<div class="modal-body p-5">
					<div class="input-group mb-3">
						<input id="newHotName_input" class="form-control" name="hotName"
							placeholder="请输入属性名称">
						<button type="button" class="btn btn-primary" id="new_hot_btn">添加</button>
					</div>

					<div class="table-responsive">
						<table class="table table-hover" id="hot_table">
							<thead>
								<tr>
									<th>ID</th>
									<th>属性名称</th>
									<th>操做</th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="item in hot">
									<td>{{item.hotId}}</td>
									<td class="text-nowrap">{{item.hotName}}</td>
									<td>
									 <a :href="'${APP_PATH}/hotwares/delHot?hotId='+item.hotId" >删除</a>
									</td>
								</tr>

							</tbody>
						</table>
					</div>

				</div>

				<div class="modal-footer border-0">
					<button type="button" class="btn btn-link" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 分类模态框 -->
	<div class="modal fade" id="clothing_modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" style="display: none;"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header bg-primary border-0">
					<h5 class="modal-title text-white">添加商品分类</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>

				<div class="modal-body p-5">
					<div class="input-group mb-3">
						<input id="newClothingName_input" class="form-control"
							name="clothingName" placeholder="请输入分类名称">
						<button type="button" class="btn btn-primary"
							id="new_clothing_btn">添加</button>
					</div>

					<div class="table-responsive">
						<table class="table table-hover" id="clothing_table">
							<thead>
								<tr>
									<th>ID</th>
									<th>属性名称</th>
									<th>操做</th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="item in clothing">
									<td>{{item.clothingId}}</td>
									<td class="text-nowrap">{{item.clothingName}}</td>
									<td>
									<a :href="'${APP_PATH}/clothingwares/delClothing?clothingId='+item.clothingId">删除</a>  
									<!-- <button type="button" class="btn btn-link" id="delClothingById">删除</button> -->
									</td>
								</tr>

							</tbody>
						</table>
					</div>

				</div>

				<div class="modal-footer border-0">
					<button type="button" class="btn btn-link" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>



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
						<div class="card-header bg-light">添加商品</div>
						<div class="card-body">
							<form action="${APP_PATH}/wares/addWare" id="add_wares_form" method="post"
								enctype="multipart/form-data">
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
											<input type="number" name="waresPrice" placeholder="请输入商品金额"
												class="form-control">
											<div class="input-group-append">
												<span class="input-group-text">.00</span>
											</div>
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
											<div class="input-group-append">
												<button type="button" class="btn btn-primary"
													data-toggle="modal" data-target="#clothing_modal">分类管理</button>
											</div>
										</div>
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text">商品属性</span>
											</div>
											<select name="waresHotId" id="ishotSele" class="form-control">
												<option value="0" selected="selected">---请选择---</option>
												<option v-for="item in hot" :value="item.hotId">{{item.hotName}}</option>
											</select>
											<div class="input-group-append">
												<button type="button" class="btn btn-primary"
													data-toggle="modal" data-target="#add_hot">属性管理</button>
											</div>
										</div>
										<div class="input-group mb-3">
											<input type="file" name="file" id="upload-file">
											<p class="help-block" style="color:orange;">请选择大小不超过1M的图片</p>
										</div>
									</div>
								</div>
								<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text">商品描述</span>
											</div>
											<textarea id="textarea" name="waresDes" class="form-control" rows="6"></textarea>
										</div>
								<input type="button" onclick="add_wares_btn()"
									class="btn btn-outline-primary" value="添加"  /> <input
									type="reset" class="btn btn-outline-secondary" value="重置" />
							</form>
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
	<script src="${APP_PATH}/static/layer/layer.js"></script>

	<script>
	var msgDelHot = '<%=request.getAttribute("msgDelHot")%>';
	if(msgDelHot != "null"){
		layer.msg(msgDelHot, {icon: 2}, function(){
			window.location.href = "${APP_PATH}/wares/addWares";
		});
		
	}
	var msgDelClothing = '<%=request.getAttribute("msgDelClothing")%>';
	if(msgDelClothing != "null"){
		layer.msg(msgDelClothing, {icon: 2}, function(){
			window.location.href = "${APP_PATH}/wares/addWares";
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
    
	var ishotSele = new Vue({
		el:"#ishotSele",
		data:{
			hot:[]
		},
		created: function () {
			this.$http.get("${APP_PATH}/hotwares/getAll").then(function(response){
				//成功
				this.hot=response.body;
			},(response) => {
				//错误
				console.log("查询是否热销产品时，出现系统错误！")
			});
		}
	});
	
	var hotModul = new Vue({
		el:"#hot_table",
		data:{
			hot:[]
		},
		created: function (event) {
			this.$http.get("${APP_PATH}/hotwares/getAll").then(function(response){
				//成功
				this.hot=response.body;
			},(response) => {
				//错误
				console.log("弹出模态框，查询是否热销产品时，出现系统错误！")
			});
		}
	});
	
	$("#new_hot_btn").click(function(){
		 var newHotName = $("#newHotName_input").val();
		 $.ajax({
			 url:"${APP_PATH}/hotwares/addhot?newHotName="+newHotName,
			 method:"GET",
			 success:function(r){
				 if(r.code==100){
					 $("#add_hot").modal('hide');
					 location.reload();
				 }else{
					 layer.msg('添加商品属性失败！', {icon: 2}); 
				 }
			 }
		 })
	});
	
	//分类管理
	var clothingModul = new Vue({
		el:"#clothing_table",
		data:{
			clothing:[]
		},
		created: function (event) {
			this.$http.get("${APP_PATH}/clothingwares/getAll").then(function(response){
				//成功
				this.clothing=response.body;
			},function(response) {
				//错误
				console.log("跳出模态框，查询分类时，出现系统错误！")
			});
		}
	});
	var wares_clothingSele = new Vue({
		el:"#wares_clothingSele",
		data:{
			clothing:[]
		},
		created: function () {
			this.$http.get("${APP_PATH}/clothingwares/getAll").then(function(response){
				//成功
				this.clothing=response.body;
			},function(response) {
				//错误
				console.log("查询分类时，出现系统错误！")
			});
		}
	});
	
	$("#new_clothing_btn").click(function(){
		 var newClothingName = $("#newClothingName_input").val();
		 $.ajax({
			 url:"${APP_PATH}/clothingwares/addclothing?newClothingName="+newClothingName,
			 method:"GET",
			 success:function(r){
				 if(r.code==100){
					 $("#clothing_modal").modal('hide');
					 location.reload();
				 }else{
					 layer.msg('添加分类失败！', {icon: 2}); 
				 }
			 }
		 })
	});
	
	function add_wares_btn(){
     var formData = new FormData($("#add_wares_form")[0]);
     $.ajax({
              url:'${APP_PATH}/wares/addWare',
              type:'post',
              data:formData,
              //必须false才会自动加上正确的Content-Type
              contentType: false,
              //必须false才会避开jQuery对 formdata 的默认处理
             //XMLHttpRequest会对 formdata 进行正确的处理
             processData: false,
             success:function(data){
            	 if(data.code == 100){
            		 layer.msg('添加商品成功！', {icon: 1}); 
            		 location.reload();
            	 }else{
            		 layer.msg(data.extend.error,{icon: 2});
            	 }
             },
             error:function(data){
                 alert("后台发生异常");
             },
             cache:false,
             async:true
         }); 
		 }
	</script>
</body>
</html>
