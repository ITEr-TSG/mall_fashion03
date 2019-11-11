<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<title>首页</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
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
<script src="${APP_PATH }/fashion_page/js/responsiveslides.min.js"></script>
<script>
    $(function () {
      $("#slider").responsiveSlides({
      	auto: true,
      	nav: true,
      	speed: 500,
        namespace: "callbacks",
        pager: true,
      });
    });
</script>
<script type="text/javascript" src="${APP_PATH }/fashion_page/js/hover_pack.js"></script>
<script src="${APP_PATH}/static/vue/vue.min.js"></script>
<script src="${APP_PATH}/static/vue/vue-resource.min.js"></script>
</head>
<body>
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
					<li class="active"><a href="${APP_PATH }/fashion_page/index.jsp" data-hover="Home">主页</a></li>
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

<div class="slider">
	  <div class="callbacks_container">
	      <ul class="rslides" id="slider">
	        <li><img src="${APP_PATH }/fashion_page/images/banner1.jpg" class="img-responsive" alt=""/>
	        <div class="banner_desc">
				<h1>We Provide Worlds top fashion for less fashionpress.</h1>
				<h2>FashionPress the name of the of hi class fashion Web FreePsd.</h2>
			</div>
	        </li>
	        <li><img src="${APP_PATH }/fashion_page/images/banner2.jpg" class="img-responsive" alt=""/>
	         <div class="banner_desc">
				<h1>Duis autem vel eum iriure dolor in hendrerit.</h1>
				<h2>Claritas est etiam processus dynamicus, qui sequitur .</h2>
			 </div>
	        </li>
	        <li><img src="${APP_PATH }/fashion_page/images/banner3.jpg" class="img-responsive" alt=""/>
	          <div class="banner_desc">
				<h1>Ut wisi enim ad minim veniam, quis nostrud.</h1>
				<h2>Mirum est notare quam littera gothica, quam nunc putamus.</h2>
			  </div>
	        </li>
	      </ul>
	  </div>
</div>
<div class="column_center">
  <div class="container">
	<div class="search">
	  <div class="stay">查询商品</div>
	  <div class="stay_right">
		  <form action="${APP_PATH}/wares/getByConditions">
		  <input type="text" name="waresName" placeholder="请输入商品的名称">
		  <input type="submit" value="">
		</form>
	  </div>
	  <div class="clearfix"> </div>
	</div>
    <div class="clearfix"> </div>
  </div>
</div>
<div class="main">
  <div class="content_top">
  	<div class="container">
	   <!-- 左侧导航 -->
	   <%@ include file="/fashion_page/commonPage/left_nav.jsp"%>
	   
	   <div class="col-md-9 content_right">


		<h4 class="head"><span class="m_2">热销</span> 商品</h4>
	    <div class="top_grid2" id="sell_well_wares">
	    
	    
	      <div class="col-md-4 top_grid1-box1" v-for="item in wellWares">
	      <a :href="'${APP_PATH}/wares/getById?id='+item.waresId">
	     	<div class="grid_1">
	     	  <div class="b-link-stroke b-animate-go  thickbox">
		        <img :src="item.waresImg" class="img-responsive" alt=""/> </div>
	     	  <div class="grid_2">
	     	  	<p>{{item.waresName}}</p>
	     	  	<ul class="grid_2-bottom">
	     	  		<li class="grid_2-left"><p>￥{{item.waresPrice}}</p></li>
	     	  		<li class="grid_2-right"><div class="btn btn-primary btn-normal btn-inline " target="_self" title="Get It">加入购物车</div></li>
	     	  		<div class="clearfix"> </div>
	     	  	</ul>
	     	  </div>
	     	</div>
	     	</a>
	     </div>
	     <div class="clearfix"> </div>
	    </div> 
	    
	    
	    <h4 class="head"><span class="m_2">折扣</span> 商品</h4>
	    <div class="top_grid2" id="discount_wares">
	     <div class="col-md-4 top_grid1-box1"  v-for="item in discountWares"><a :href="'${APP_PATH}/wares/getById?id='+item.waresId">
	     	<div class="grid_1">
	     	  <div class="b-link-stroke b-animate-go  thickbox">
		        <img :src="item.waresImg" class="img-responsive" alt=""/> </div>
	     	  <div class="grid_2">
	     	  	<p>{{item.waresName}}</p>
	     	  	<ul class="grid_2-bottom">
	     	  		<li class="grid_2-left"><p>￥{{item.waresPrice}}</p></li>
	     	  		<li class="grid_2-right"><div class="btn btn-primary btn-normal btn-inline " target="_self" title="Get It">加入购物车</div></li>
	     	  		<div class="clearfix"> </div>
	     	  	</ul>
	     	  </div>
	     	</div>
	    </a> </div>
	     <div class="clearfix"> </div>
	    </div> 
	     
       </div>
	  </div>  	    
	</div>
</div>
<div class="footer_bg">
</div>
<%@ include file="/fashion_page/commonPage/footer.jsp" %>

<script type="text/javascript">
	var sell_well_wares = new Vue({
		el:"#sell_well_wares",
		data:{
			wellWares:[]
		},
		created:function(){
			this.$http.get("${APP_PATH}/wares/getByOtherId?id=2").then(function(res){
				this.wellWares=res.body;
			},function(res){
				
			})
		}
	});
	var discount_wares = new Vue({
		el:"#discount_wares",
		data:{
			discountWares:[]
		},
		created:function(){
			this.$http.get("${APP_PATH}/wares/getByOtherId?id=3").then(function(res){
				this.discountWares=res.body;
			},function(res){
				
			})
		}
	});


</script>


</body>
</html>		