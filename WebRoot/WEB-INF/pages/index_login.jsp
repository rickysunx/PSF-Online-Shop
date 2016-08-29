<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script>
$(document).ready(function(){
	$("#loginmessage").psfArrow({direction:"bottom",arrowpos:20});
	$("#index_login_button").click(function(){
		$.post(
			"/login_check",
			{username:$("#loginid").val(),userpass:$("#loginpwd").val()},
			function(data) {
				if(data.success==1) {
					//$("#info").text("登录成功，正在跳转页面...");
					$(".index_login").slideUp("fast");
					//window.location.hash = 'pagebody';
					$(".logincard_box").show();
					$(".logincard").stop().animate({top:0},200)
					$(".index_menu_user").data("logincardtime",setTimeout(function(){
						$(".logincard").stop().animate({top:-219},200,function(){$(".logincard_box").hide();});
					},2000));
					//用户名片效果
					$(".index_menu_user").mouseenter(function(){
						$(".logincard_box").show();
						clearTimeout($(".logincard").data("logincardtime"));
						$(".logincard").stop().animate({top:0},200);
					}).mouseleave(function(){
						$(this).data("logincardtime",setTimeout(function(){
							$(".logincard").stop().animate({top:-219},200,function(){$(".logincard_box").hide();});		
						},400));
					});
					$(".logincard").unbind().mouseenter(function(){
						$(".logincard_box").show();
						clearTimeout($(".index_menu_user").data("logincardtime"));
					}).mouseleave(function(){
						$(this).data("logincardtime",setTimeout(function(){
						$(".logincard").stop().animate({top:-219},200,function(){$(".logincard_box").hide();});		
						},300));
					});
				} else {
					//$("#info").text(data.info);
					$("#loginmessage h4").html(data.info)
					$("#loginmessage").fadeOut().css({top:$("#loginid").getElCoordinate().top-55,left:$("#loginid").getElCoordinate().left}).fadeIn().delay(1400).fadeOut();
					//alert(data.info);
				}
			},
			"json"
		);
	});
})
</script>
<div class="index_row index_login s_clear">
	<div class="loginbox">
		<div class="loginbox_top s_clear">
			<div class="left">
				<span class="defaultid" style="display:none"></span>
				<span class="defaultpwd" style="display:none"></span>
				<span class="inputstyle"><input id="loginid" type="text" /></span>
				<span class="inputstyle"><input id="loginpwd" type="password" /></span>
			</div>
			<a id="index_login_button" href="javascript:void(0)"></a>
		</div>
		<div class="loginbox_bottom">
			<input type="checkbox" />
			<span>记住密码</span>
			<a href="javascript:void(0)">忘记密码?</a>
		</div>
	</div>
	<div class="regbox">
		<a href="javascript:void(0)" ></a>
		<h5>花一分钟注册，享受我们的贴心服务</h5>
		<p>我们也讨厌注册表单，但是诶了我们共同的将来，这一分钟是值得的。^_^</p>
	</div>
	<div class="raiders">
	<a href="javascript:void(0)"></a>
	</div>
</div>
<div id="loginmessage" style="position:absolute;background-color:#FFF;top:10px;left:10px;display:none;height:15px;padding:13px 12px;border:1px solid #7E7E7D"><h4 style="color:#CF0909;font-weight: bold;"></h4></div>