<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script type="text/javascript">
	$(function(){
		initInput("keyword", "请输入关键字");
	});
</script>
<div id="searchbar">
	<div class="searchicon"></div>
	<div class="searchbox">
		<div class="searchtext">
			<input id="keyword" type="text" class="userinput" value="关键字"/>
			<input type="button" class="searchBtn" value=搜索 onclick="loadResultPage(0,$('#keyword').val())"/>
		</div>
	</div>
</div>
<ul id="searchMenu">
	<li class="active"><a href="javascript:void(0)" onclick="loadResultPage(0)">全部发表</a></li>
	<li><a href="javascript:void(0)" onclick="loadResultPage(1)">广播</a></li>
	<li><a href="javascript:void(0)" onclick="loadResultPage(2)">秀场</a></li>
	<li><a href="javascript:void(0)" onclick="loadResultPage(3)">体验</a></li>
	<li><a href="javascript:void(0)" onclick="loadResultPage(4)">指南</a></li>
	<li><a href="javascript:void(0)" onclick="loadResultPage(5)">品友</a></li>
	<li><a href="javascript:void(0)" onclick="loadResultPage(6)">圈子</a></li>
	<li><a href="javascript:void(0)" onclick="loadResultPage(7)">话题</a></li>
</ul>