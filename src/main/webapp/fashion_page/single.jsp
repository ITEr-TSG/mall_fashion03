<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<title>商品展示</title>
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
<script type="text/javascript" src="${APP_PATH }/fashion_page/js/hover_pack.js"></script>
<link rel="stylesheet" href="${APP_PATH }/fashion_page/css/etalage.css">

<script src="${APP_PATH }/fashion_page/js/jquery.etalage.min.js"></script>

<script>
			jQuery(document).ready(function($){

				$('#etalage').etalage({
					thumb_image_width: 300,
					thumb_image_height: 400,
					source_image_width: 900,
					source_image_height: 1200,
					show_hint: true,
					click_callback: function(image_anchor, instance_id){
						alert('Callback example:\nYou clicked on an image with the anchor: "'+image_anchor+'"\n(in Etalage instance: "'+instance_id+'")');
					}
				});

			});
		</script>
<script src="${APP_PATH }/fashion_page/js/easyResponsiveTabs.js" type="text/javascript"></script>
		    <script type="text/javascript">
			    $(document).ready(function () {
			        $('#horizontalTab').easyResponsiveTabs({
			            type: 'default', //Types: default, vertical, accordion           
			            width: 'auto', //auto or any width like 600px
			            fit: true   // 100% fit in a container
			        });
			    });
            </script>	

</head>
<body>


<!-- 静态引入头部 -->
<%@ include file="/fashion_page/commonPage/header.jsp"%>

<div class="column_center">
  <div class="container">
	<div class="search">
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
	   
	   	<div class="col-md-9 single_right">
	   	<div class="single_top">
	       <div class="single_grid">
				<div class="grid images_3_of_2" id="waresImg">
						<ul id="etalage">
							<li>
								<a href="optionallink.html">
									<img class="etalage_thumb_image" src="${APP_PATH }/fashion_page/images/s2.jpg" class="img-responsive" />
									<img class="etalage_source_image" src="${APP_PATH }/fashion_page/images/s2.jpg" class="img-responsive" title="" />
								</a>
							</li>
							<li>
								<img class="etalage_thumb_image" src="${APP_PATH }/fashion_page/images/s2.jpg" class="img-responsive" />
								<img class="etalage_source_image" src="${APP_PATH }/fashion_page/images/s2.jpg" class="img-responsive" title="" />
							</li>
							<li>
								<img class="etalage_thumb_image" src="${APP_PATH }/fashion_page/images/s3.jpg" class="img-responsive"  />
								<img class="etalage_source_image" src="${APP_PATH }/fashion_page/images/s3.jpg"class="img-responsive"  />
							</li>
						    <li>
								<img class="etalage_thumb_image" src="${APP_PATH }/fashion_page/images/s4.jpg" class="img-responsive"  />
								<img class="etalage_source_image" src="${APP_PATH }/fashion_page/images/s4.jpg"class="img-responsive"  />
							</li>
						</ul>
						 <div class="clearfix"></div>		
				  </div> 
				  <div class="desc1 span_3_of_2">
				  	<h1>${wares.waresName}</h1>
				<p class="availability">适用人群：<span class="color" id="keyWordsOfMan">${wares.waresOfMan}</span></p><br>
				<p class="availability">适用季节： <span class="color" id="keyWordsSeaso">${wares.waresSeaso}</span></p><br>
			    <div class="price_single">
				  <span class="reducedfrom">${wares.waresPrice}</span>
				  <span class="actual">${wares.waresPrice}</span><!-- <a href="#">click for offer</a> -->
				</div>
				<h2 class="quick">商品描述:</h2>
				<p class="quick_desc">${wares.waresDes}</p>
			    <!-- <div class="wish-list">
				 	<ul>
				 		<li class="wish"><a href="#">Add to Wishlist</a></li>
				 	    <li class="compare"><a href="#">Add to Compare</a></li>
				 	</ul>
				 </div> -->
				<ul class="size">
					<h3>尺码</h3>
					<li><a href="#">${wares.waresSize}</a></li>
				</ul>
				<div class="quantity_box">
					<ul class="product-qty">
					   <span>数量：</span>
					   <select>
						 <option>1</option>
						 <option>2</option>
						 <option>3</option>
						 <option>4</option>
						 <option>5</option>
						 <option>6</option>
					   </select>
				    </ul>
				    <!-- <ul class="single_social">
						<li><a href="#"><i class="fb1"> </i> </a></li>
						<li><a href="#"><i class="tw1"> </i> </a></li>
						<li><a href="#"><i class="g1"> </i> </a></li>
						<li><a href="#"><i class="linked"> </i> </a></li>
		   		    </ul> -->
		   		    <div class="clearfix"></div>
	   		    </div>
			    <a href="reservation.html" title="Online Reservation" class="btn bt1 btn-primary btn-normal btn-inline " target="_self">加入购物车</a>
			</div>
		    <div class="clearfix"> </div>
				</div>
          	    <div class="clearfix"></div>
          </div>
          <div class="sap_tabs">	
				     <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
						  <ul class="resp-tabs-list">
						  	  <li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>商品描述</span></li>
							  <li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>附加信息</span></li>
							  <li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span>评论</span></li>
							  <div class="clear"></div>
						  </ul>				  	 
							<div class="resp-tabs-container">
							    <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
									<div class="facts">
									  <ul class="tab_list">
									  	<li><a href="#">有件事从始至终 我从未明白过 无论我如何挣扎努力
											却没有一丝效果 在我脑海中 只能铭记下这首疑歌 合适的时机解析自我 但我明白
											时间何等珍贵 白驹过隙 如挂钟摇摆 开始倒数 直到终结 人生会随时间起伏改变 犹如无知觉的梦境
											过程超乎你的掌控 凝望时光 看它从窗棂悄然遁走 试图挽留 可我不曾领悟 时间不等人 只能默默望着你的离去
											将一切铭存于心 即使锲而不舍，披奏坚韧之铠 最后努力却轻易分崩离析 对我来说 最好的结果 便是把这段固执信念深埋
											我曾努力挣扎 走到现今 最终才发现 原来都无济于事 不可控制的 失去了所有 最终才明白 前途渺茫 有件事 我不曾明白
											无论你如何竭尽全力 为什么却于事无补 在我脑海深处 撰写下这首疑歌 时刻警醒自己 我曾经努力过
											但我所谓的信念你却只会嘲笑 可我的灵魂 早已全然属于你 曾经历历在目 那潸然动容的瞬间 如今却是过往云烟 万事皆变，物是人非 再此重逢 你或许 早已不再认识我 并非是你的过错 而是我已改变 但是过去的一切 都有可能重蹈覆辙 你把一切抛之脑后 我曾挣扎过 但一切徒劳 对我来说 这段记忆 我只能掩埋在深处 我曾努力挣扎 走到至今 最终才发现 一切都徒劳 不受我的控制 失去了所有 最终才明白
											</a></li>
									  	<!-- <li><a href="#">augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigatione</a></li>
									  	<li><a href="#">claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica</a></li>
									  	<li><a href="#">Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.</a></li> -->
									  </ul>           
							        </div>
							     </div>	
							      <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
									<div class="facts">
									  <ul class="tab_list">
									    <li><a href="#">有件事从始至终 我从未明白过 无论我如何挣扎努力
											却没有一丝效果 在我脑海中 只能铭记下这首疑歌 合适的时机解析自我 但我明白
											时间何等珍贵 白驹过隙 如挂钟摇摆 开始倒数 直到终结 人生会随时间起伏改变 犹如无知觉的梦境
											过程超乎你的掌控 凝望时光 看它从窗棂悄然遁走 试图挽留 可我不曾领悟 时间不等人 只能默默望着你的离去
											将一切铭存于心 即使锲而不舍，披奏坚韧之铠 最后努力却轻易分崩离析 对我来说 最好的结果 便是把这段固执信念深埋
											我曾努力挣扎 走到现今 最终才发现 原来都无济于事 不可控制的 失去了所有 最终才明白 前途渺茫 有件事 我不曾明白
											无论你如何竭尽全力 为什么却于事无补 在我脑海深处 撰写下这首疑歌 时刻警醒自己 我曾经努力过
											但我所谓的信念你却只会嘲笑 可我的灵魂 早已全然属于你 曾经历历在目 那潸然动容的瞬间 如今却是过往云烟 万事皆变，物是人非 再此重逢 你或许 早已不再认识我 并非是你的过错 而是我已改变 但是过去的一切 都有可能重蹈覆辙 你把一切抛之脑后 我曾挣扎过 但一切徒劳 对我来说 这段记忆 我只能掩埋在深处 我曾努力挣扎 走到至今 最终才发现 一切都徒劳 不受我的控制 失去了所有 最终才明白</a></li>
									  	<!-- <li><a href="#">claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica</a></li>
									  	<li><a href="#">Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.</a></li> -->
									  </ul>           
							        </div>
							     </div>	
							      <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-2">
									<ul class="tab_list">
									  	<li><a href="#">有件事从始至终 我从未明白过 无论我如何挣扎努力
											却没有一丝效果 在我脑海中 只能铭记下这首疑歌 合适的时机解析自我 但我明白
											时间何等珍贵 白驹过隙 如挂钟摇摆 开始倒数 直到终结 人生会随时间起伏改变 犹如无知觉的梦境
											过程超乎你的掌控 凝望时光 看它从窗棂悄然遁走 试图挽留 可我不曾领悟 时间不等人 只能默默望着你的离去
											将一切铭存于心 即使锲而不舍，披奏坚韧之铠 最后努力却轻易分崩离析 对我来说 最好的结果 便是把这段固执信念深埋
											我曾努力挣扎 走到现今 最终才发现 原来都无济于事 不可控制的 失去了所有 最终才明白 前途渺茫 有件事 我不曾明白
											无论你如何竭尽全力 为什么却于事无补 在我脑海深处 撰写下这首疑歌 时刻警醒自己 我曾经努力过
											但我所谓的信念你却只会嘲笑 可我的灵魂 早已全然属于你 曾经历历在目 那潸然动容的瞬间 如今却是过往云烟 万事皆变，物是人非 再此重逢 你或许 早已不再认识我 并非是你的过错 而是我已改变 但是过去的一切 都有可能重蹈覆辙 你把一切抛之脑后 我曾挣扎过 但一切徒劳 对我来说 这段记忆 我只能掩埋在深处 我曾努力挣扎 走到至今 最终才发现 一切都徒劳 不受我的控制 失去了所有 最终才明白</a></li>
									  	<!-- <li><a href="#">augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigatione</a></li>
									  	<li><a href="#">claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores leg</a></li>
									  	<li><a href="#">Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.</a></li> -->
									  </ul>      
							     </div>	
							 </div>
					      </div>
			  </div>
		<h3 class="single_head">猜你喜欢</h3>	
	    <div class="related_products" id="similarWares">
	    
	    
	     <div class="col-md-4 top_grid1-box1">
	     	<a href="single.html">
		     	<div class="grid_1">
		     	  <div class="b-link-stroke b-animate-go  thickbox">
			        <img src="${APP_PATH }/fashion_page/images/p12.jpg" class="img-responsive" alt=""/> 
			      </div>
		     	  <div class="grid_2">
		     	  	<p>There are many variations of passages</p>
		     	  	<ul class="grid_2-bottom">
		     	  		<li class="grid_2-left"><p>￥99</p></li>
		     	  		<li class="grid_2-right">
		     	  			<a href="single.html" title="Get It" class="btn btn-primary btn-normal btn-inline " target="_self">加入购物车</a>
		     	  		</li>
		     	  		<div class="clearfix"> </div>
		     	  	</ul>
		     	  </div>
		     	</div>
	     	</a>
	     </div>
	     
	     
	    <div class="col-md-4 top_grid1-box1"><a href="single.html">
	     	<div class="grid_1">
	     	  <div class="b-link-stroke b-animate-go  thickbox">
		        <img src="${APP_PATH }/fashion_page/images/p13.jpg" class="img-responsive" alt=""/> </div>
	     	  <div class="grid_2">
	     	  	<p>There are many variations of passages</p>
	     	  	<ul class="grid_2-bottom">
	     	  		<li class="grid_2-left"><p>$99<small>.33</small></p></li>
	     	  		<li class="grid_2-right"><a href="single.html" title="Get It" class="btn btn-primary btn-normal btn-inline " target="_self">Get It</a></li>
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
	     	  		<li class="grid_2-right"><a href="single.html" title="Get It" class="btn btn-primary btn-normal btn-inline " target="_self">Get It</a></li>
	     	  		<div class="clearfix"> </div>
	     	  	</ul>
	     	  </div>
	     	</div>
	     </a></div>
	     <div class="clearfix"> </div>
	    </div> 
	    <div class="top_grid2">
	     <div class="col-md-4 top_grid1-box1 top_grid2-box2"><a href="single.html">
	     	<div class="grid_1">
	     	  <div class="b-link-stroke b-animate-go  thickbox">
		        <img src="${APP_PATH }/fashion_page/images/p9.jpg" class="img-responsive" alt=""/> </div>
	     	  <div class="grid_2">
	     	  	<p>There are many variations of passages</p>
	     	  	<ul class="grid_2-bottom">
	     	  		<li class="grid_2-left"><p>$99<small>.33</small></p></li>
	     	  		<li class="grid_2-right"><a href="single.html" title="Get It" class="btn btn-primary btn-normal btn-inline " target="_self">Get It</a></li>
	     	  		<div class="clearfix"> </div>
	     	  	</ul>
	     	  </div>
	     	</div>
	    </a> </div>
	    <div class="col-md-4 top_grid1-box1"><a href="single.html">
	     	<div class="grid_1">
	     	 <div class="b-link-stroke b-animate-go  thickbox">
		        <img src="${APP_PATH }/fashion_page/images/p10.jpg" class="img-responsive" alt=""/> </div>
	     	  <div class="grid_2">
	     	  	<p>There are many variations of passages</p>
	     	  	<ul class="grid_2-bottom">
	     	  		<li class="grid_2-left"><p>$99<small>.33</small></p></li>
	     	  		<li class="grid_2-right"><a href="single.html" title="Get It" class="btn btn-primary btn-normal btn-inline " target="_self">Get It</a></li>
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
	     	  		<li class="grid_2-right"><a href="single.html" title="Get It" class="btn btn-primary btn-normal btn-inline " target="_self">Get It</a></li>
	     	  		<div class="clearfix"> </div>
	     	  	</ul>
	     	  </div>
	     	</div>
	     </a></div>
	     <div class="clearfix"> </div>
	    </div> 
        </div>
      </div> 
	</div>
</div>
<div class="footer_bg">
</div>
<%@ include file="/fashion_page/commonPage/footer.jsp" %>
<script src="${APP_PATH}/static/vue/vue.min.js"></script>
<script src="${APP_PATH}/static/vue/vue-resource.min.js"></script>

<script type="text/javascript">

	var imgPath="<%=request.getAttribute("ImgPath")%>"
	$("#waresImg img").attr("src",imgPath);
	
	var keyWordsOfMan = $("#keyWordsOfMan").text();
	var keyWordsSeaso = $("#keyWordsSeaso").text();
	$.ajax({
		url:"${APP_PATH}/wares/similarWares?keyWordsOfMan="+keyWordsOfMan+"&keyWordsSeaso="+keyWordsSeaso,
		method:"GET",
		success:function(result){
			console.log(result)
			console.log(result.extend.similarWares)
			console.log(result.extend.similarWares[0])
			if(result.code == 100){
				/* <div class="col-md-4 top_grid1-box1"><a href="single.html">
		     	<div class="grid_1">
		     	  <div class="b-link-stroke b-animate-go  thickbox">
			        <img src="${APP_PATH }/fashion_page/images/p12.jpg" class="img-responsive" alt=""/> </div>
		     	  <div class="grid_2">
		     	  	<p>There are many variations of passages</p>
		     	  	<ul class="grid_2-bottom">
		     	  		<li class="grid_2-left"><p>$99<small>.33</small></p></li>
		     	  		<li class="grid_2-right"><a href="single.html" title="Get It" class="btn btn-primary btn-normal btn-inline " target="_self">Get It</a></li>
		     	  		<div class="clearfix"> </div>
		     	  	</ul>
		     	  </div>
		     	</div>
		     	</a>
		     </div> */
				
				
				
				
			}
			
			
		}
	});
</script>
</body>
</html>		