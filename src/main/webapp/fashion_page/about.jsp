<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<title>关于我们</title>
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
					<li><a href="${APP_PATH }/fashion_page/index.jsp" data-hover="Home">主页</a></li>
					<li class="active"><a href="${APP_PATH }/fashion_page/about.jsp" data-hover="About Us">关于我们</a></li>
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
  <div class="about_top">
  	<div class="col-md-4 span1">
  	    <h3>关于我们</h3>
		<img src="images/p2.jpg" class="img-responsive" alt=""/>
		<h4>FASHIONPRESS是一家集综合开发、生产和销售运动鞋、服、配件为一体的大型服饰用品品牌；FASHIONPRESS官方商城是FASHIONPRESS电商直营的官方网站，正品保障，7天 无理由退换货！</h4>
		<p>FASHIONPRESS服饰用品有限公司 ，简称FASHIONPRESS服饰、FASHIONPRESS，是中国领先的服饰用品企业，主要从事设计、开发、制造和行销FASHIONPRESS品牌的服饰用品，包括运动鞋、服装及配饰。
		FASHIONPRESS：FASHIONPRESS是定位于大众的专业服饰用品品牌，专注于为最广大的普通消费者提供最高性价比的专业服饰用品。
		2017年，FASHIONPRESS服饰市值突破千亿港元，成为国内运动品牌千亿市值企业，在全球范围内成为第三大运动品牌</p>
	</div>
  	<div class="col-md-4 span1 span_2">
  		   <h3>历史</h3>
			<h5>2005</h5>
			<p class="m_4">“2005中国服饰品牌风云榜暨领袖年会”上，获得“2005中国服饰品牌科技创新奖”。</p>
			<h5>2006</h5>
			<p class="m_4">FASHIONPRESS“永不止步”案例被《21世纪经济报道》选为“中国最佳品牌建设案例奖”。</p>
			<h5>2012</h5>
			<p class="m_4">入选《环球企业家》杂志“2012中国最佳表现公司”50强。</p>
			<h5>2014</h5>
			<p>获得江西经济年会“十大市民最喜爱的品牌企业”称号。</p>
	</div>
  	<div class="col-md-4 span1">
  	       <h3>发展阶段</h3>
			<h4>FASHIONPRESS-1.0 生产制造：</h4>
			<p>工厂起家，逐步实现规模化生产；自有工厂建设，以生产管理为导向。</p>
			<p>开创央视+服饰明星代言营销模式，品牌认可度快速形成；渠道快速扩张，生意规模增长迅速。</p>
			<h4>FASHIONPRESS-4.0 单聚焦 多品牌 全渠道：</h4>
			<p>工匠精神专注运动鞋服行业；多品牌组合满足不同细分市场需求；全渠道零售关注消费者体验；集团化运作强化资源整合。</p>
	</div>
	<div class="clearfix"> </div>
  </div>  
  <div class="about_bottom">
  	     <div class="col-md-6">
				<h3 class="m_3">企业公益</h3>
				<div class="feature about_box1">
	                    <h4>服饰公益</h4>
	                    <p>
	                        2013年，由FASHIONPRESS服饰用品有限公司携手中国奥委会等联合发起的“奥林匹克公益合作联盟”正式启动。
	                                                               据悉，联盟将集合四方在服饰领域的优势资源，更进一步在我国推广奥林匹克精神，并广泛推动全民健身运动的开展。
	                        2013年4月，FASHIONPRESS服饰用品有限公司携手中国奥委会、冠军基金、萨马兰奇服饰发展基金会共同发起的“奥林匹克公益合作联盟”，
	                                                               在北京正式启动“爱心桥”公益项目，FASHIONPRESS作为首家爱心企业捐赠了价值2000万元的运动装备。
	                    </p>
	            </div>
	            <div class="feature about_box1">
	                    <h4>积极参与赈灾</h4>
	                    <p>
	                        2008年汶川发生地震后
							奥林匹克公益合作联盟全体为雅安地震默哀
							奥林匹克公益合作联盟全体为雅安地震默哀
							，FASHIONPRESS向灾区捐出资金和物资总额超过1000万，是服饰用品行业首家捐款过千万的企业。
							2010年4月青海玉树地震，FASHIONPRESS向灾区捐赠资200万元，并对灾后的学校建设予以了大力支持。
	                    </p>
	            </div>
	        </div>
			<div class="col-md-6 span_3">
				<h3 class="m_3">企业文化</h3>
				<ul class="about_box span_1">
				  <li class="box_img"><img src="images/p9.jpg" class="img-responsive" alt=""></li>
				  <li class="box_desc"><span  style="color: black;">消费者导向</span>——坚持以消费者为导向，理解消费者，洞察消费者趋势，快速响应并满足消费者需求</li>
				  <div class="clearfix"> </div>
				</ul>
				<ul class="about_box span_1">
				  <li class="box_img"><img src="images/p11.jpg" class="img-responsive" alt=""></li>
				  <li class="box_desc"><span  style="color: black;">专注务实</span>——我们秉持“精、细、实、严”的求真态度，致力于体育事业共成长。</li>
				  <div class="clearfix"> </div>
				</ul>
				<ul class="about_box span_1">
				  <li class="box_desc"><span  style="color: black;">创新超越</span>——我们从不惧怕变革的风险，预应前瞻的格局，以随需而变的创新，创造客户终身价值。</li>
				  <div class="clearfix"> </div>
				</ul>
				<ul class="about_box span_1">
				  <li class="box_desc"><span  style="color: black;">尊重包容</span>——我们坚持“尊重差异，包容多样，相互欣赏”的原则，营造开放包容的氛围，我们坚持以贡献者为榜样，使贡献者得到合理的回报。</li>
				  <div class="clearfix"> </div>
				</ul>
				<ul class="about_box span_1">
				  <li class="box_desc"><span  style="color: black;">诚信感恩</span>——我们笃信诚实正直、信守承诺的处世原则，永怀感恩之心，善尽社会责任。</li>
				  <div class="clearfix"> </div>
				</ul>
			</div>
		    <div class="clearfix"> </div>
     </div>
   </div>
  </div>
<div class="footer_bg">
</div>
<%@ include file="/fashion_page/commonPage/footer.jsp" %>

</body>
</html>		