<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script type="text/javascript">
	$(function(){
		initInput("search_shopexp","搜索体验");	//初始化搜索框
	});
</script>
<div class="tab_menu">
	<div class="searchbox01">
		<input id="search_shopexp" name="search" />
		<a class="searchbtn" href="javascript:void(0);" onclick="javascript:loadShopexpList(-1,-1,$('#search_shopexp').val(),1,-1)"></a>
	</div>
	<div class="linkbox">
		<dl>
			<dt><a class="current" href="javascript:void(0)" onclick="javascript:loadShopexpList(1,-1,null,1,-1);"><span><span>我发表的</span></span></a></dt>
		</dl>
		<dl><dt>|</dt></dl>
		<dl>
			<dt><a href="javascript:void(0)" onclick="javascript:loadShopexpList(2,-1,null,1,-1);"><span><span>我喜欢的</span></span></a></dt>
		</dl>
		<dl><dt>|</dt></dl>
		<dl>
			<dt><a href="javascript:void(0)" onclick="javascript:loadShopexpList(3,-1,null,1,-1);"><span><span>我评论的</span></span></a></dt>
		</dl>
	</div>
</div>