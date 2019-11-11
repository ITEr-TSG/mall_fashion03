<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<head>
<title>订单中心</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Fashionpress Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="${APP_PATH }/fashion_page/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- Custom Theme files -->
<link href="${APP_PATH }/fashion_page/css/style.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<!--webfont-->
<link href='${APP_PATH }/fashion_page/css/font_google.css' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="${APP_PATH }/static/js/jquery2.0-min.js"></script>
<link rel="stylesheet" href="${APP_PATH}/static/layui/css/layui.css"
	media="all"></head>
<body>
<input type="hidden" name="custId" class="custId"/>
<script src="${APP_PATH}/fashion_page/js/bootstrap.min.js" type="text/javascript"></script>
<div class="header">
	<div class="header_top" style="padding-bottom: 10px">
		<div class="container">
			<div class="logo">
				<a href="${APP_PATH }/fashion_page/index.jsp"><img src="${APP_PATH }/fashion_page/images/logo.png" alt=""/></a>
			</div>
			<ul class="shopping_grid">
				<c:choose>
					<c:when test="${sessionScope.custNick == null}">
						<a href="${APP_PATH }/fashion_page/login.jsp"><li>登录</li></a>
						<a href="${APP_PATH }/fashion_page/register.jsp"><li>注册</li></a>
					</c:when>
					<c:otherwise>
					<li>
					<div class="dropdown">
					  <button id="userInfo" class="btn btn-primary btn-lg btn-block" style="height: 45px;" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    ${sessionScope.custNick}
					    <span class="caret"></span>
					  </button>
					  <ul class="dropdown-menu" aria-labelledby="userInfo">
					    <a href="${APP_PATH }/fashion_page/wishlist.jsp"><li><span class="m_1">购物车</span>&nbsp;&nbsp;&nbsp;<img src="${APP_PATH }/fashion_page/images/bag.png" alt=""/></li></a>
				      	<a href="${APP_PATH }/fashion_page/orderlist.jsp"><li>我的订单</li></a>
				      	<a href="${APP_PATH }/customer/loginOut"><li>退出登录</li></a>
				      	<a href="${APP_PATH }/admin/loginPage"><li>管理员登录</li></a>
					  </ul>
					</div></li>
					</c:otherwise>
				</c:choose>
			      <div class="clearfix"> </div>
			</ul>
			
		    <div class="clearfix"> </div>
		</div>
	</div>
	<div class="h_menu4"><!-- start h_menu4 -->
		<div class="container">
				<a class="toggleMenu" href="#">菜单</a>
				<ul class="nav">
					<li><a href="${APP_PATH }/fashion_page/index.jsp" data-hover="Home">主页</a></li>
					<li><a href="${APP_PATH }/fashion_page/about.jsp" data-hover="About Us">关于我们</a></li>
					<li><a href="${APP_PATH }/fashion_page/careers.jsp" data-hover="Careers">网站声明</a></li>
					<li><a href="${APP_PATH }/fashion_page/contact.jsp" data-hover="Contact Us">联系我们</a></li>
					<!-- <li><a href="404.html" data-hover="Company Profile">Company Profile</a></li>
					<li><a href="register.html" data-hover="Company Registration">Company Registration</a></li>
					<li><a href="wishlist.html" data-hover="Wish List">购物车</a></li> -->
				 </ul>
				 <script type="text/javascript" src="${APP_PATH }/fashion_page/js/nav.js"></script>
	      </div><!-- end h_menu4 -->
     </div>
</div>


<div class="column_center">
  <div class="container">
	<div class="search">
	  <div class="clearfix"> </div>
	</div>
    <div class="clearfix"> </div>
  </div>
</div>
<div class="about">
    <div class="container">
         <div class="register">
		  	  <h4 class="title">订单中心&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: red;">${sessionScope.error}</span></h4>
				<table class="layui-table" id="orderCenter" lay-filter="orderTable"> </table>
			</div>
	</div>
</div>
<div class="footer_bg">
</div>
<%@ include file="/fashion_page/commonPage/footer.jsp" %>
<div style="display: none" id="lookWaresModal">

		<div class="col-md-4 top_grid1-box1">
			<div class="grid_1" style="width: 500px">
				<div class="grid_2">
					订单号：<span id="orderNumModal" style="color: gray;"></span><hr>
					商品名称：<span id="waresNameModal" style="color: gray;"></span><hr>
					数量：<span id="waresNumModal" style="color: gray;"></span><hr>
					支付金额：<span id="waresTotalMoneyModal" style="color: gray;"></span>
					<div class="clearfix"></div>
				</div>
				<div><img id="waresImgModal"  alt="" class="img-responsive"></div>
			</div>
		</div>
		
		</div>


<script type="text/javascript" src="${APP_PATH}/static/layui/layui.all.js"></script>
<script type="text/javascript">
	var custId="<%=session.getAttribute("custId")%>" 
	$(".custId").attr("value",custId);
	layui.use(['table','layer'], function(){
		var layer = layui.layer
		  ,table = layui.table;
		if(custId!="null"){ //登录
			table.render({
			    elem: '#orderCenter'
			    ,url: "${APP_PATH}/order/getOrdersByCustId" //数据接口
			    ,where:{id:custId}
			    ,limit:50
			    ,skin: 'line' //行边框风格
			    ,size: 'lg'
			    ,cols: [[ //表头
			      {field: 'orderId', title: 'ID',hide:true}
			      ,{field: 'orderNum',unresize:true, title: '订单号'}
			      ,{field: 'orderConsignee',unresize:true, title: '收货人'}
			      ,{field: 'orderAddr',unresize:true, title: '收货地址'}
			      ,{field: 'orderEmail',unresize:true, title: '联系Email'}
			      ,{field: 'orderState',unresize:true, title: '订单状态'}
			      ,{fixed: 'right', unresize:true,title:'操做', toolbar: '#barShopCar'}
			    ]],
			    text: {
			        none: '哎呀！什么都还没买呢！' 
			      },
			    parseData: function(res){ //res 即为原始返回的数据
			    	    return {
			    	      "code": res.code, //解析接口状态
			    	      "msg": res.msg, //解析提示文本
			    	      "count": res.count, //解析数据长度
			    	      "data": res.data //解析数据列表
			    	};
			    }, 
			  });
			table.on('tool(orderTable)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
				  var data = obj.data; //获得当前行数据
				  var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
				  var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
				   if(layEvent === 'lookWares'){ //提交订单
					  $("#orderNumModal").html(data.orderNum);
					  $.ajax({
						  url:"${APP_PATH}/waresShopcar/getWaresItemById?id="+data.orderCarId+"&orderNum="+data.orderNum,
						  method:"get",
						  success:function(res){
							  if(res.code == 100){
								  $("#waresNameModal").html(res.extend.waresItem.waresName);
								  $("#waresNumModal").html(res.extend.waresItem.waresNum);
								  $("#waresTotalMoneyModal").html(res.extend.waresItem.waresPrice);
								  $("#waresImgModal").attr("src",res.extend.imgPath);
							  }else{
								  console.log("订单页面图片渲染错误")
							  }
						  }
					  })
					  var index = layer.open({
							title : '查看商品',
							fix : true,
							maxmin : true,
							area: ['600px','500px'],
							resize :false,
							move: false,
							zIndex : 500,
							shadeClose : false,
							shade : 0.4,
							type : 1,
							content : $('#lookWaresModal')
						});
					  
				  } else if(layEvent === 'isShip'){
					  if(data.orderState == "已收货"){
						  layer.msg("哎呀！已经收货了呢！", {icon: 7}); 
						  return;
					  }
					  $.ajax({
						  url:"${APP_PATH}/order/confirmOrder?id="+data.orderId+"&isShip=1",
						  method:"GET",
						  success:function(res){
							 if(res.code == 100){
								 layer.msg('收货成功！欢迎您再次购买！', {icon: 6});
								 obj.update({
									 orderState:"已收货"
								 });
							 } else{
								 layer.msg('收货好像除了点问题，反馈给我们吧！', {icon: 5});
								 console.log("用户收货失败")
							 }
						  }
					  });
					  
				  } else if(layEvent === 'LAYTABLE_TIPS'){
				    layer.alert('Hi，头部工具栏扩展的右侧图标。');
				  }
				});	
			
			
		}else{
			//未登录
			layer.msg('请先登录！', {icon: 5},function(){
				window.location.href="${APP_PATH}/fashion_page/login.jsp"
			});
		}
	});
</script>
<script type="text/html" id="barShopCar">
  <a class="layui-btn layui-btn-xs" lay-event="lookWares">查看商品</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="isShip">确认收货</a>
</script>
</body>
</html>		