<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script>
	$(document).ready(function(){
		//首页大广告
		var HomeAdShowTime = 5000; //播放时间
		var HomeAdTime = null;
		var HomeAdCon = '<a href="#" target="_blank"><img width="1400" height="461" src="/images/index/photo/psfAd.jpg"/></a>';
		
		function open_HomeAd(showBtn){
		    $('.HomeAd .AdBox').html(HomeAdCon).slideDown(1000,function(){
		        if(showBtn !== false){
		            $('.HomeAd .ad_btn').fadeIn();
		        }
		        if(HomeAdTime){clearTimeout(HomeAdTime);}
		        HomeAdTime = setTimeout(close_HomeAd,HomeAdShowTime);
		    });
		}
		function close_HomeAd(){
		    $('.HomeAd .AdBox').slideUp(1000,function(){
		        $(this).html('');
		        $('.ad_close').hide();
		        $('.ad_play').show();
		    });
		}
		$('.ad_close').click(function(){
		    if(HomeAdTime){clearTimeout(HomeAdTime);}
		    close_HomeAd();
		    return false;
		});
		//点击
		$('.ad_play').click(function(){
		    if(HomeAdTime){clearTimeout(HomeAdTime);}
		    open_HomeAd(false);
		    $('.ad_play').hide();
		    $('.ad_close').show();
		    return false;
		});
		setTimeout(open_HomeAd,1500);
		
	});
</script>
<div class="HomeAd">
	<div class=ad_btn>
	<a style="display: none" class=ad_play title=重播 href="#"></a>
	<a class=ad_close title=关闭 href="#"></a>
	</div>
	<div class=AdBox></div>
</div>