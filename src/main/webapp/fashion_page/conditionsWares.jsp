<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<script src="${APP_PATH}/static/vue/vue.min.js"></script>
<script src="${APP_PATH}/static/vue/vue-resource.min.js"></script>
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
</head>
<body>
<!-- 静态引入头部 -->
<%@ include file="/fashion_page/commonPage/header.jsp"%>

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
	    <div class="top_grid2" id="sell_well_wares">
	    
	      <c:forEach items="${requestScope.list}" var="w">
	      <div class="col-md-4 top_grid1-box1">
	      <a href="${APP_PATH}/wares/getById?id=${w.waresId}">
	     	<div class="grid_1">
	     	  <div class="b-link-stroke b-animate-go  thickbox">
		        <img src="${w.waresImg}" class="img-responsive" alt=""/> </div>
	     	  <div class="grid_2">
	     	  	<p>${w.waresName}</p>
	     	  	<ul class="grid_2-bottom">
	     	  		<li class="grid_2-left"><p>${w.waresPrice}</p></li>
	     	  		<li class="grid_2-right"><div class="btn btn-primary btn-normal btn-inline " target="_self" title="Get It">加入购物车</div></li>
	     	  		<div class="clearfix"> </div>
	     	  	</ul>
	     	  </div>
	     	</div>
	     	</a>
	     </div>
	     </c:forEach>
	     
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
	
</script>
</body>
</html>		