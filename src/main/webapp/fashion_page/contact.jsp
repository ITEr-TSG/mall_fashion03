<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<head>
<title>联系我们</title>
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
</head>
<style type="text/css">
.contact-form input[type="button"] {
    display: inline-block;
    padding: 13px 25px;
    background: #df1f26;
    color: #FFF;
    font-size: 1em;
    line-height: 18px;
    text-transform: uppercase;
    border: none;
    outline: none;
    transition: 0.2s;
    -webkit-transition: 0.2s;
    -moz-transition: 0.2s;
    -o-transition: 0.2s;
}
</style>
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
<div class="about">
 <div class="container">
  <div class="singel_right">
			     <div class="col-md-8">
				      <div class="contact-form">
				  	        <form id="contactForm">
					    	    <p class="comment-form-author"><label for="author">姓名：</label>
					    	    	<input type="text" name="contactName" placeholder="请输入你的称呼" class="textbox" >
						    	</p>
						        <p class="comment-form-author"><label for="author">Email：</label>
						     	   <input type="text" name="contactEmail" placeholder="xxxxx@xx.com" class="textbox" >
						        </p>
						        <p class="comment-form-author"><label for="author">内容：</label>
						    	  <textarea name="contactText" placeholder="请填写您要留言的内容"></textarea>
						        </p>
						        <input type="button" id="submitContactBtn" value="提交">
					        </form>
				       </div>
			     </div>
			     <div class="col-md-4 contact_right">
					<h3>我们的地址</h3>
				    <div class="address">
						<i class="pin_icon"></i>
					    <div class="contact_address">
						  江西省南昌市向塘经济开发区丽湖中大道103号清河公寓9栋628
					    </div>
					    <div class="clearfix"></div>
					</div>
					<div class="address">
						<i class="phone"></i>
					    <div class="contact_address">
						   1-25-2568-897
					    </div>
					    <div class="clearfix"></div>
					</div>
					<div class="address">
						<i class="mail"></i>
					    <div class="contact_email">
						  <a href="#">jflaodage@qq.com</a>
					    </div>
					    <div class="clearfix"></div>
					</div>
		        </div>
		        <div class="clearfix"></div>
		</div>
		<div class="map">
			<img alt="公司地址" src="${APP_PATH}/fashion_page/images/addr_contact.png" style="width: 1000px">
        </div>
     </div>
</div>
<div class="footer_bg">
</div>
<%@ include file="/fashion_page/commonPage/footer.jsp" %>
<script type="text/javascript" src="${APP_PATH}/static/layer/layer.js"></script>
</body>
<script type="text/javascript">
	$("#submitContactBtn").click(function(){
		$.ajax({
			url:"${APP_PATH}/contact/addContact",
			method:"POST",
			data:$("#contactForm").serialize(),
			success:function(res){
				console.log(res)
				if(res.code == 100){
					layer.msg('感谢您的留言！', {icon: 6},function(){
						location.reload();
					}); 
				}else{
					layer.msg('系统繁忙！', {icon: 5});
				}
			}
		})
	});
</script>
</html>		