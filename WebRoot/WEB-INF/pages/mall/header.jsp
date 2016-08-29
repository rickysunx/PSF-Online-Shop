<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<div class="top">
    <div class="hold"><img class="icon" src="/images/temp/pricewrap.png" alt="" /><a href="#"><img src="/images/temp/small-banner.png" alt="" /></a></div>
    <a id="logo" href="#"><img src="/images/mall/logo.png" alt="" /></a>
    
    <span>
        <a href="#"><img src="/images/mall/youhui.png" alt="" /></a>
        <a href="#"><img src="/images/mall/tuihuo.png" alt="" /></a>
        <a href="#"><img src="/images/mall/fenxiang.png" alt="" /></a>
        <a href="#"><img src="/images/mall/anquan.png" alt="" /></a>
    </span>
</div>

<div class="navgation">
    <ul>
        <li><a href="/mall">首 &nbsp; 页</a></li>
        <li><a class="red" href="#">促 &nbsp; 销</a></li>
        <li><a class="pink" href="#">新 &nbsp; 品</a></li>
        <li><a class="green" href="#">品友团</a></li>
        <li><a class="blue" href="#">全部分类</a></li>
    </ul>
</div>

<script type="text/javascript">
var current_nav = ${current_nav};
$(".navgation").find("a").hover(function(){
	$(this).parent("li").addClass("current");
},function(){
	$(this).parent("li").removeClass("current");
	if(current_nav>=0) $($(".navgation").find("li")[current_nav]).addClass("current");
});
if(current_nav>=0) $($(".navgation").find("li")[current_nav]).addClass("current");
</script>
  
