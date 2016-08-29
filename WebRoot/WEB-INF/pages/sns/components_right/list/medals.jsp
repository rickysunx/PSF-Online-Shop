<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script>
$(document).ready(function(){
	$("body").append("<div id='medals_content' class='medals_content'>"+
	"<div class='medals_content_img'><img src='' width='100%' /></div>"+
	"<div class='medals_content_text'><p class='medals_content_h1' ></p><p class='medals_content_h2'>首次购物,获得次徽章,继续努力哦ooooooooo</p></div>"+
	"</div>");
	$(".medals_right img").mouseenter(function(){
		var objthis=this;
		$(this).data("outtime",setTimeout(function(){
			$(".medals_content_img img").attr("src",($(objthis).attr("src").split("."))[0]+"b.png");
			$("#medals_content").psfDialogClose().psfDialog({
				top:$(objthis).position().top+objthis.offsetHeight+5,
				left:$(objthis).position().left+15,
				width:342,
				height:155,
				arrow:true,
				arrowauto:true,
				arrowdirection:"top",
				arrowpos:280,
				arrowstyle:"2"
			});
		},500));
		
	}).mouseleave(function(){
		clearTimeout($(this).data("outtime"));
		$("#medals_content").psfDialogClose();
	});
	$(".medals_right_button").click(function(){
		if($(".medals_right").css("height")=="40px"){
			$(".medals_right").animate({height:80});
			$(this).find("em").css("background","url('/images/sns/default/sns.png') no-repeat -20px -4px");
		}else{
			$(".medals_right").animate({height:40});
			$(this).find("em").css("background","url('/images/sns/default/sns.png') no-repeat -20px 6px");
		}
	});
	
});
</script>
<div class="medals_right">
	<img alt="" src="/images/sns/default/temp/medals1.png">
	<img alt="" src="/images/sns/default/temp/medals2.png">
	<img alt="" src="/images/sns/default/temp/medals3.png">
	<img alt="" src="/images/sns/default/temp/medals4.png">
	<img alt="" src="/images/sns/default/temp/medals5.png">
	<img alt="" src="/images/sns/default/temp/medals4.png">
	<img alt="" src="/images/sns/default/temp/medals5.png">
	<img alt="" src="/images/sns/default/temp/medals6.png">
	<img alt="" src="/images/sns/default/temp/medals7.png">
</div>
<a class="medals_right_button" href="javascript:void(0)"><em></em></a>