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
<title>所有订单</title>
<link rel="stylesheet"
	href="${APP_PATH}/static/admin/vendor/simple-line-icons/css/simple-line-icons.css">
<link rel="stylesheet"
	href="${APP_PATH}/static/admin/vendor/font-awesome/css/fontawesome-all.min.css">
<link rel="stylesheet" href="${APP_PATH}/static/admin/css/styles.css">
<link rel="stylesheet" href="${APP_PATH}/static/layui/css/layui.css"
	media="all">
	<script src="${APP_PATH}/static/vue/vue.min.js"></script>
	<script src="${APP_PATH}/static/vue/vue-resource.min.js"></script>
<style type="text/css">
input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
}
.top_grid1-box1 {
    padding-right: 0;
    margin-top: 10px;
    width: 100px;
    height: 100px;
}
.grid_1 {
    background: #fff;
    border: 5px solid #fff;
}
.b-link-stroke {
    position: relative;
    display: inline-block;
    vertical-align: top;
    font-weight: 300;
    overflow: hidden;
    margin-bottom: 5px;
}

.b-animate-go {
    text-decoration: none;
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
						<div class="" style="margin: 10px 5px ">
	                          <div class="input-group col-md-4">
	                              <input type="text" id="orderNumSearch"  class="form-control" placeholder="请输入订单号">
	                              <span class="input-group-btn">
	                                  <button type="button" lay-submit lay-filter="screenOrder" class="btn btn-primary"><i class="fa fa-search"></i> 查询</button>
	                              </span>
	                          </div>
	                          <table id="orderTable" lay-filter="orderTableFilter"></table>
	                      </div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 展示商品信息模态框 -->
	<div style="display: none;" id="detailOrderModal">
         <div class="card" style="border: 0">
             <div class="card-body">
				<div class="top_grid1-box1">
					<div class="grid_1" style="width: 500px;">
						<div class="grid_2" style="float: left;">
							订单号：<span class="orderNumSpan" style="color: gray;"></span><hr>
							商品名称：<span id="waresNameSpan" style="color: gray;"></span><hr>
							商品单价：<span id="waresPriceSpan" style="color: gray;"></span><hr>
							商品数量：<span id="waresNumSpan" style="color: gray;"></span><hr>
							商品尺码：<span id="waresSizeSpan" style="color: gray;"></span><hr>
							支付金额：<span id="waresPaySpan" style="color: gray;"></span><hr>
							<div class="toggle-switch" data-ts-color="danger">
                                <label for="isEditWares" class="ts-label">备注修改商品信息</label>
                                <input id="isEditWares" type="checkbox"/>
                                <label for="isEditWares" class="ts-helper"></label>
                            </div>
							<form style="margin-top: 10px;display: none;" id="orderRemarks">
								<input type="hidden" name="orderId" id="orderNumInput"/>
								<div class="form-group">
                                    <textarea name="remarkText"  id="remarkTextarea" placeholder="后期客户可能会要求修改商品信息" class="form-control" rows="3"></textarea>
                                </div>
                                <button type="button" id="submitRemark" class="btn btn-outline-success">提交</button>
							</form>
						</div>
						<div class="b-link-stroke b-animate-go  thickbox" style="float: right;">
							<img id="ImgModal" alt=""
								class="img-responsive" style="width: 200px;height: 300px">
						</div>
					</div>
				</div>
			</div>
         </div>
     </div>
     <!-- 收货人信息模态框 -->
	<div style="display: none;" id="editOrderModal">
         <div class="card" style="border: 0">
             <div class="card-body">
				<div class="top_grid1-box1">
					<div class="grid_1" style="width: 500px;">
						<div class="grid_2" style="float: left; ">
							订单号：<span class="orderNumSpan" style="color: gray;"></span><hr>
							收货人姓名：<span id="orderConsigneeSpan" style="color: gray;"></span><hr>
							收货人地址：<span id="orderAddrSpan" style="color: gray;"></span><hr>
							收货人Email：<span id="orderEmailSpan" style="color: gray;"></span><hr>
							<div class="toggle-switch" data-ts-color="danger">
                                <label for="isEditConsignee" class="ts-label">修改收货人信息</label>
                                <input id="isEditConsignee" type="checkbox"/>
                                <label for="isEditConsignee" class="ts-helper"></label>
                            </div>
						</div>
						<div class="b-link-stroke b-animate-go  thickbox" style="float: right;">
							<form style="display: none;" id="consigneeInfoForm">
							<input type="hidden" name="orderId" class="orderId"/>
								<div class="form-group">
                                    <label for="required-input" class="require">收货人</label>
                                    <input type="text" name="orderConsignee" id="orderConsigneeInput" class="form-control">
                                </div>
								<div class="form-group">
                                    <label for="required-input" class="require">地址</label>
                                    <input type="text" name="orderAddr"  id="orderAddrInput"  class="form-control">
                                </div>
								<div class="form-group">
                                    <label for="required-input" class="require">邮箱</label>
                                    <input type="email" name="orderEmail" id="orderEmailInput" class="form-control">
                                </div>
                                <button type="button" id="submitConsigneeInfo" class="btn btn-outline-success">提交</button>
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
	<script src="${APP_PATH}/static/layui/layui.js"></script>
	<script>

	$(function() {
		renderTable();
	});
	
	function renderTable(){
		layui.use(['table','layer','form'], function(){
			  var table = layui.table;
			  var layer = layui.layer;
			  var form = layui.form;
			  var orderNum = $("#orderNumSearch").val();
			  //第一个实例
			  table.render({
			    elem: '#orderTable'
			    ,height: 500
			    ,url: '${APP_PATH}/order/getAllOrders' //数据接口
			    ,page: true //开启分页
			    ,where:{orderNum:orderNum}
			    ,cols: [[ //表头
			      {field: 'orderNum', title: '订单号',rowspan:2,align:'center'}
			      ,{title: '收货人信息',colspan:3,align:'center'} 
			      ,{title: '订单信息',colspan:2,align:'center'} 
			      ,{field: 'payTime', title: '支付时间',align:'center', rowspan:2}
			      ,{align:'center', style:"padding-bottom:5px;",width:300,rowspan:2, title: '操做',toolbar: '#operateOrder'}
			    ],[
			    	 {field: 'orderConsignee', title: '收货人',align:'center'}
				    ,{field: 'orderAddr', title: '收货人地址',align:'center'}
				    ,{field: 'orderEmail', title: '收货人邮箱',align:'center'} 
			    	,{field: 'orderState',style:"color: orange;",align:'center', title: '订单状态'}
		    	    ,{field: 'isShip',style:"color: red;",align:'center',title: '是否收货',templet: function(d){
			          return d.isShip == -1?"未收货":"已收货"
			        }}
			    	
			    ]],
			    text: {
			        none: '暂无订单可以处理' //默认：无数据
			      }
			  ,parseData: function(res){ //res 即为原始返回的数据
				    return {
				      "code": res.code, //解析接口状态
				      "msg": res.msg, //解析提示文本
				      "count": res.count, //解析数据长度
				      "data": res.data //解析数据列表
				    };
				  }
			  
			  });
			  table.on('tool(orderTableFilter)', function(obj){ 
				  var data = obj.data; //获得当前行数据
				  var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
				  var tr = obj.tr;
				  console.log(data)
				  $(".orderNumSpan").html(data.orderNum);
				  if(layEvent === 'detailOrder'){ //查看
					  
					  $("#orderNumInput").val(data.orderNum);
					  //查询出该订单下的商品条目信息 
					  $.ajax({
						  url:"${APP_PATH}/waresShopcar/getWaresItemById?id="+data.orderCarId+"&orderNum="+data.orderNum,
						  method:"GET",
						  success:function(res){
							console.log(res)
							if(res.code == 100){
								$("#ImgModal").attr("src",res.extend.imgPath);
								$("#waresNameSpan").html(res.extend.waresItem.waresName);
								$("#waresPriceSpan").html("￥"+res.extend.waresItem.waresPrice);
								$("#waresNumSpan").html(res.extend.waresItem.waresNum);
								$("#waresSizeSpan").html(res.extend.waresItem.waresSize);
								$("#waresPaySpan").html("￥"+res.extend.waresItem.waresTotal);
								$("#remarkTextarea").val(res.extend.remark);
							}else{
								console.log("查询出该订单下的商品条目信息 失败！")
							}
						  }
					  });
					  var index = layer.open({
							title : '查看订单的商品信息',
							fix : true,
							maxmin : true,
							area: ['600px','520px'],
							resize :false,
							move: false,
							zIndex : 500,
							shadeClose : false,
							shade : 0.4,
							type : 1,
							content : $('#detailOrderModal')
						}); 
				  } else if(layEvent === 'editOrder'){ //修改收货人信息
					  $("#orderConsigneeSpan").html(data.orderConsignee);
					  $("#orderAddrSpan").html(data.orderAddr);
					  $("#orderEmailSpan").html(data.orderEmail);
					  $("#orderConsigneeInput").val(data.orderConsignee);
					  $("#orderAddrInput").val(data.orderAddr);
					  $("#orderEmailInput").val(data.orderEmail);
					  $(".orderId").val(data.orderId);
					  var index = layer.open({
							title : '收货人信息',
							fix : true,
							maxmin : true,
							area: ['600px','400px'],
							resize :false,
							move: false,
							zIndex : 500,
							shadeClose : false,
							shade : 0.4,
							type : 1,
							content : $('#editOrderModal')
						});
				  } else if(layEvent === 'editOrderState'){ //修改订单状态
					  if(data.orderState == "运输中"){
						  layer.msg("已经发货了！别点了！", {icon: 7}); 
						  return;
					  }
					  $.ajax({
						  url:"${APP_PATH}/order/updateOrderState?id="+data.orderId+"&state=运输中",
						  method:"GET",
						  success:function(res){
							  if(res.code == 100){
									layer.msg(res.extend.msg, {icon: 6},function(){
										obj.update({
											orderState: '运输中'
										    });
									});
								}else{
									layer.msg(res.extend.msg, {icon: 5}); 
								}
						  }
					  });
				  } else if(layEvent === 'LAYTABLE_TIPS'){
				    layer.alert('Hi，头部工具栏扩展的右侧图标。');
				  }
				});
				//筛选
				form.on('submit(screenOrder)', function(data) {
					renderTable();
					return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
				});
			});
	}
	//展开和关闭备注修改信息的表单
	$("#isEditWares").click(function(){
		if ($(this).is(":checked")) {
			$("#orderRemarks").css("display","")
		} else {
			$("#orderRemarks").css("display","none")
		}
	});
	$("#isEditConsignee").click(function(){
		if ($(this).is(":checked")) {
			$("#consigneeInfoForm").css("display","")
		} else {
			$("#consigneeInfoForm").css("display","none")
		}
	});
	//备注修改商品信息
	$("#submitRemark").click(function(){
		var remarkForm = $("#orderRemarks").serialize();
		$.ajax({
			url:"${APP_PATH}/waresRemark/addRemark",
			method:"POST",
			data:remarkForm,
			success:function(res){
				console.log(res)
				if(res.code == 100){
					layer.msg(res.extend.msg, {icon: 6},function(){
						location.reload();
					});
				}else{
					layer.msg(res.extend.msg, {icon: 5}); 
				}
			}
		});
	});
	//修改收货人信息
	$("#submitConsigneeInfo").click(function(){
		var consigneeForm = $("#consigneeInfoForm").serialize();
		$.ajax({
			url:"${APP_PATH}/order/updateConsigneeInfo",
			method:"POST",
			data:consigneeForm,
			success:function(res){
				console.log(res)
				if(res.code == 100){
					layer.msg(res.extend.msg, {icon: 6},function(){
						location.reload();
					});
				}else{
					layer.msg(res.extend.msg, {icon: 5}); 
				}
			}
		});
	});
	</script>
<script type="text/html" id="operateOrder">
  <a class="btn btn-sm btn-rounded btn-outline-success" lay-event="detailOrder">订单商品信息</a>
  <a class="btn btn-sm btn-rounded btn-outline-primary" lay-event="editOrder">收货人信息</a>
  <a class="btn btn-sm btn-rounded btn-outline-danger" lay-event="editOrderState">发货</a>
</script>

</body>
</html>
