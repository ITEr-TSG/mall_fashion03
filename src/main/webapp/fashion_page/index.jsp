<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Home</title>
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
<link href='https://fonts.googleapis.com/css?family=Lato:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
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
<!-- 静态引入头部 -->
<%@ include file="/fashion_page/commonPage/header.jsp"%>

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
	    <%-- <div class="col-md-4 top_grid1-box1"><a href="single.html">
	     	<div class="grid_1">
	     	 <div class="b-link-stroke b-animate-go  thickbox">
		        <img src="${APP_PATH }/fashion_page/images/p10.jpg" class="img-responsive" alt=""/> </div>
	     	  <div class="grid_2">
	     	  	<p>There are many variations of passages</p>
	     	  	<ul class="grid_2-bottom">
	     	  		<li class="grid_2-left"><p>$99<small>.33</small></p></li>
	     	  		<li class="grid_2-right"><div class="btn btn-primary btn-normal btn-inline " target="_self" title="Get It">Get It</div></li>
	     	  		<div class="clearfix"> </div>
	     	  	</ul>
	     	  </div>
	     	</div>
	     </a></div>
	     <div class="col-md-4 top_grid1-box1"><a href="single.html">
	     	<div class="grid_1">
	     	  <div class="b-link-stroke b-animate-go  thickbox">
		        <img src="${APP_PATH }/fashion_page/images/p11.jpg" class="img-responsive" alt=""/> </div>
	     	  <div class="grid_2">
	     	  	<p>There are many variations of passages</p>
	     	  	<ul class="grid_2-bottom">
	     	  		<li class="grid_2-left"><p>$99<small>.33</small></p></li>
	     	  		<li class="grid_2-right"><div class="btn btn-primary btn-normal btn-inline " target="_self" title="Get It">Get It</div></li>
	     	  		<div class="clearfix"> </div>
	     	  	</ul>
	     	  </div>
	     	</div>
	     </a></div>
	     <div class="col-md-4 top_grid1-box1"><a href="single.html">
	     	<div class="grid_1">
	     	  <div class="b-link-stroke b-animate-go  thickbox">
		        <img src="${APP_PATH }/fashion_page/images/p12.jpg" class="img-responsive" alt=""/> </div>
	     	  <div class="grid_2">
	     	  	<p>There are many variations of passages</p>
	     	  	<ul class="grid_2-bottom">
	     	  		<li class="grid_2-left"><p>$99<small>.33</small></p></li>
	     	  		<li class="grid_2-right"><div class="btn btn-primary btn-normal btn-inline " target="_self" title="Get It">Get It</div></li>
	     	  		<div class="clearfix"> </div>
	     	  	</ul>
	     	  </div>
	     	</div>
	     </a></div>
	    <div class="col-md-4 top_grid1-box1"><a href="single.html">
	     	<div class="grid_1">
	     	  <div class="b-link-stroke b-animate-go  thickbox">
		        <img src="${APP_PATH }/fashion_page/images/p13.jpg" class="img-responsive" alt=""/> </div>
	     	  <div class="grid_2">
	     	  	<p>There are many variations of passages</p>
	     	  	<ul class="grid_2-bottom">
	     	  		<li class="grid_2-left"><p>$99<small>.33</small></p></li>
	     	  		<li class="grid_2-right"><div class="btn btn-primary btn-normal btn-inline " target="_self" title="Get It">Get It</div></li>
	     	  		<div class="clearfix"> </div>
	     	  	</ul>
	     	  </div>
	     	</div>
	     </a></div>
	     <div class="col-md-4 top_grid1-box1"><a href="single.html">
	     	<div class="grid_1">
	     	  <div class="b-link-stroke b-animate-go  thickbox">
		        <img src="${APP_PATH }/fashion_page/images/p14.jpg" class="img-responsive" alt=""/> </div>
	     	  <div class="grid_2">
	     	  	<p>There are many variations of passages</p>
	     	  	<ul class="grid_2-bottom">
	     	  		<li class="grid_2-left"><p>$99<small>.33</small></p></li>
	     	  		<li class="grid_2-right"><div class="btn btn-primary btn-normal btn-inline " target="_self" title="Get It">Get It</div></li>
	     	  		<div class="clearfix"> </div>
	     	  	</ul>
	     	  </div>
	     	</div>
	     </a></div>
	     <div class="col-md-4 top_grid1-box1"><a href="single.html">
	     	<div class="grid_1">
	     	  <div class="b-link-stroke b-animate-go  thickbox">
		        <img src="${APP_PATH }/fashion_page/images/p12.jpg" class="img-responsive" alt=""/> </div>
	     	  <div class="grid_2">
	     	  	<p>There are many variations of passages</p>
	     	  	<ul class="grid_2-bottom">
	     	  		<li class="grid_2-left"><p>$99<small>.33</small></p></li>
	     	  		<li class="grid_2-right"><div class="btn btn-primary btn-normal btn-inline " target="_self" title="Get It">Get It</div></li>
	     	  		<div class="clearfix"> </div>
	     	  	</ul>
	     	  </div>
	     	</div>
	     </a></div>
	    <div class="col-md-4 top_grid1-box1"><a href="single.html">
	     	<div class="grid_1">
	     	  <div class="b-link-stroke b-animate-go  thickbox">
		        <img src="${APP_PATH }/fashion_page/images/p13.jpg" class="img-responsive" alt=""/> </div>
	     	  <div class="grid_2">
	     	  	<p>There are many variations of passages</p>
	     	  	<ul class="grid_2-bottom">
	     	  		<li class="grid_2-left"><p>$99<small>.33</small></p></li>
	     	  		<li class="grid_2-right"><div class="btn btn-primary btn-normal btn-inline " target="_self" title="Get It">Get It</div></li>
	     	  		<div class="clearfix"> </div>
	     	  	</ul>
	     	  </div>
	     	</div>
	     </a></div>
	     <div class="col-md-4 top_grid1-box1"><a href="single.html">
	     	<div class="grid_1">
	     	  <div class="b-link-stroke b-animate-go  thickbox">
		        <img src="${APP_PATH }/fashion_page/images/p14.jpg" class="img-responsive" alt=""/> </div>
	     	  <div class="grid_2">
	     	  	<p>There are many variations of passages</p>
	     	  	<ul class="grid_2-bottom">
	     	  		<li class="grid_2-left"><p>$99<small>.33</small></p></li>
	     	  		<li class="grid_2-right"><div class="btn btn-primary btn-normal btn-inline " target="_self" title="Get It">Get It</div></li>
	     	  		<div class="clearfix"> </div>
	     	  	</ul>
	     	  </div>
	     	</div>
	     </a></div> --%>
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