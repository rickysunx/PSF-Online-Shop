<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script type="text/javascript">
	$(function(){
		initInput("search_guide","搜索指南品牌");
	});
</script>
<div class="tab_menu">
	<div class="searchbox01">
		<input id="search_guide" name="keyword" />
		<a class="searchbtn" href="javascript:void(0)" onclick="javascript:loadPostBrand(-1,-1,$('#search_guide').val(),1)"></a>
	</div>
	<div class="linkbox">
		<dl>
			<dt><a class="current" href="javascript:void(0)" onclick="javascript:loadPostBrand(1,-1,null,1)"><span><span>我的推荐</span></span></a></dt>
		</dl>
		<dl><dt>|</dt></dl>
		<dl>
			<dt><a href="javascript:void(0)" onclick="javascript:loadPostBrand(2,-1,null,1)"><span><span>我喜欢的</span></span></a></dt>
		</dl>
		<dl><dt>|</dt></dl>
		<dl>
			<dt><a href="javascript:void(0)" onclick="javascript:loadPostBrand(3,-1,null,1)"><span><span>好友推荐</span></span></a></dt>
		</dl>
		<dl><dt>|</dt></dl>
		<dl>
			<dt><a href="javascript:void(0)" onclick="javascript:loadPostBrand(4,-1,null,1)"><span><span>圈子推荐</span></span></a></dt>
		</dl>
		<dl><dt>|</dt></dl>
		<dl>
			<dt><a href="javascript:void(0)" onclick="javascript:loadPostBrand(5,-1,null,1)"><span><span>社区推荐</span></span></a></dt>
		</dl>
	</div>
</div>