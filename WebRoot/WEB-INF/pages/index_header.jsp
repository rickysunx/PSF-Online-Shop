<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script>
	$(document).ready(function(){
		$(".index_menu .index_row .left .linkpoint").mouseenter(function(){
			$("body").append('<img id="buttonflash" src="/images/index/buttonflash.gif" height="10" style="position:absolute;top:'+
			($(this).position().top+10)+'px;left:'+
			($(this).position().left+55)+'px" />')
		}).mouseleave(function(){
			//alert("xxxxx");
			$("#buttonflash").remove();
		});
		
		
	})
</script>
<div class="index_header">
	<div class="index_row s_clear">
		<a id="logo"><img src="/images/index/index_logo.png" /></a>
		<div class="search">
			<p>在这里，你可以尽享购物的乐趣和认识跟你一样出色的朋友</p>
			<span class="searchinput"><input type="text" /><a href="javascript:void(0)"></a></span>
		</div>
	</div>
</div>
<div class="index_menu">
	<div class="index_row">
		<div class="left">
			<span class="index_menu_user">welcome,品友</span>
			<a href="/mall" class="linkpoint" >品上商城</a>
			<a href="/sns" class="linkpoint" >品上我家</a>
		</div>
		<div class="right">
			<a href="javascript:void(0)" href="javascript" class="linkpoint collection">加入收藏</a>
			<a href="javascript:void(0)" class="linkpoint setindex">设为首页</a>
			<a href="javascript:void(0)" class="linkpoint nav">网址导航</a>
		</div>
	</div>
</div>
<div class="logincard_box">
	<psf:include page="/index_logincard.jsp"/>
</div>