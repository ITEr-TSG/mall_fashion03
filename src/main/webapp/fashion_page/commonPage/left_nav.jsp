<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="col-md-3 sidebar_box">
	   	 <div class="sidebar">
			<div class="menu_box">
		    <h3 class="menu_head">快速导航</h3>
			  <ul class="menu">
				<li class="item1"><a href="#"><img class="arrow-img" src="${APP_PATH }/fashion_page/images/f_menu.png" alt=""/> 适用人群</a>
					<ul class="cute">
						<li class="subitem1"><a href="#">Cute Kittens </a></li>
						<li class="subitem2"><a href="#">Strange Stuff </a></li>
						<li class="subitem3"><a href="#">Automatic Fails </a></li>
					</ul>
				</li>
				<li class="item2"><a href="#"><img class="arrow-img" src="${APP_PATH }/fashion_page/images/f_menu.png" alt=""/>Women</a>
					<ul class="cute">
						<li class="subitem1"><a href="#">Cute Kittens </a></li>
						<li class="subitem2"><a href="#">Strange Stuff </a></li>
						<li class="subitem3"><a href="#">Automatic Fails </a></li>
					</ul>
				</li>
				<li class="item3"><a href="#"><img class="arrow-img" src="${APP_PATH }/fashion_page/images/f_menu.png" alt=""/>Fashion 2015</a>
					<ul class="cute">
						<li class="subitem1"><a href="#">Cute Kittens </a></li>
						<li class="subitem2"><a href="#">Strange Stuff </a></li>
						<li class="subitem3"><a href="#">Automatic Fails</a></li>
					</ul>
				</li>
				<li class="item4"><a href="#"><img class="arrow-img" src="${APP_PATH }/fashion_page/images/f_menu.png" alt=""/>Kids</a>
					<ul class="cute">
						<li class="subitem1"><a href="#">Cute Kittens </a></li>
						<li class="subitem2"><a href="#">Strange Stuff </a></li>
						<li class="subitem3"><a href="#">Automatic Fails </a></li>
					</ul>
				</li>
				<li class="item5"><a href="#"><img class="arrow-img" src="${APP_PATH }/fashion_page/images/f_menu.png" alt=""/>Jeans</a>
					<ul class="cute">
						<li class="subitem1"><a href="#">Cute Kittens </a></li>
						<li class="subitem2"><a href="#">Strange Stuff </a></li>
						<li class="subitem3"><a href="#">Automatic Fails </a></li>
					</ul>
				</li>
				<li class="item6"><a href="#"><img class="arrow-img" src="${APP_PATH }/fashion_page/images/f_menu.png" alt=""/>Tshirt</a>
					<ul class="cute">
						<li class="subitem1"><a href="#">Cute Kittens </a></li>
						<li class="subitem2"><a href="#">Strange Stuff </a></li>
						<li class="subitem3"><a href="#">Automatic Fails </a></li>
					</ul>
				</li>
				<li class="item7"><a href="#"><img class="arrow-img" src="${APP_PATH }/fashion_page/images/f_menu.png" alt=""/>Top Fashion</a>
					<ul class="cute">
						<li class="subitem1"><a href="#">Cute Kittens </a></li>
						<li class="subitem2"><a href="#">Strange Stuff </a></li>
						<li class="subitem3"><a href="#">Automatic Fails </a></li>
					</ul>
				</li>
				<li class="item8"><a href="#"><img class="arrow-img" src="${APP_PATH }/fashion_page/images/f_menu.png" alt=""/>Summer Collection</a>
					<ul class="cute">
						<li class="subitem1"><a href="#">Cute Kittens </a></li>
						<li class="subitem2"><a href="#">Strange Stuff </a></li>
						<li class="subitem3"><a href="#">Automatic Fails </a></li>
					</ul>
				</li>
				<li class="item9"><a href="#"><img class="arrow-img" src="${APP_PATH }/fashion_page/images/f_menu.png" alt=""/>Special Offer</a>
					<ul class="cute">
						<li class="subitem1"><a href="#">Cute Kittens </a></li>
						<li class="subitem2"><a href="#">Strange Stuff </a></li>
						<li class="subitem3"><a href="#">Automatic Fails </a></li>
					</ul>
				</li>
			</ul>
		</div>
				<!--initiate accordion-->
		<script type="text/javascript">
			$(function() {
			   renderUl();
			});
			
			function renderUl(){
				 var menu_ul = $('.menu > li > ul'),
		           menu_a  = $('.menu > li > a');
		    menu_ul.hide();
		    menu_a.click(function(e) {
		        e.preventDefault();
		        if(!$(this).hasClass('active')) {
		            menu_a.removeClass('active');
		            menu_ul.filter(':visible').slideUp('normal');
		            $(this).addClass('active').next().stop(true,true).slideDown('normal');
		        } else {
		            $(this).removeClass('active');
		            $(this).next().stop(true,true).slideUp('normal');
		        }
		    });
			}
			
			
			
			
		</script>
       </div>
		    <div class="delivery">
				<img src="${APP_PATH }/fashion_page/images/delivery.jpg" class="img-responsive" alt=""/>
				<h3>配送</h3>
				<h4>全球包邮</h4>
			</div>
			<div class="twitter">
			   <h3>推特好评</h3>
			   <ul class="twt1">
			   	  <i class="twt"> </i>
			   	  <li class="twt1_desc"><span class="m_1">@Contrary</span> 一如既往的好评<span class="m_1"> 五星</span></li>
			   	  <div class="clearfix"> </div>
			   </ul>
			   <ul class="twt1">
			   	  <i class="twt"> </i>
			   	  <li class="twt1_desc">
			   	  	布衣得暖胜丝棉，新也可穿，旧也可穿。<br>
					粗茶淡饭饱三餐，早也香甜，晚也香甜。<br>
					夜归挚友话灯前，今也谈谈，古也谈谈。<br>
					一觉睡到日三竿，不是神仙，胜似神仙！<br>
					</li>
			   	  <div class="clearfix"> </div>
			   </ul>
			   <ul class="twt1">
			   	  <i class="twt"> </i>
			   	  <li class="twt1_desc">
			   	  	布衣得暖胜丝棉，新也可穿，旧也可穿。<br>
					粗茶淡饭饱三餐，早也香甜，晚也香甜。<br>
					夜归挚友话灯前，今也谈谈，古也谈谈。<br>
					一觉睡到日三竿，不是神仙，胜似神仙！<br>
			   	  </li>
			   	  <div class="clearfix"> </div>
			   </ul>
			</div>
			<div class="clients">
				<h3>我们的客户满意度</h3>
				<h4>依山傍水房数间，行也安然，坐也安然。<br>
				一头耕牛半顷田，收也凭天，荒也凭天。<br>
				雨过天晴驾小船，鱼在一边，酒在一边。<br>
				路逢骚客问诗篇，好也几言，歹也几言。<br>
				布衣得暖胜丝棉，新也可穿，旧也可穿。<br>
				粗茶淡饭饱三餐，早也香甜，晚也香甜。<br>
				夜归挚友话灯前，今也谈谈，古也谈谈。<br>
				一觉睡到日三竿，不是神仙，胜似神仙！</h4>
			   <ul class="user">
			   	<i class="user_icon"></i>
			   	<li class="user_desc"><a href="#"><p>关于我们</p></a></li>
			   	<div class="clearfix"> </div>
			   </ul>
			</div>
	   </div> 