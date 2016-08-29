<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script type="text/javascript">
	$(function(){
		initInput("search_group","圈子搜索");
	});
</script>
<div class="tab_menu">
	<div class="searchbox01">
		<input id="search_group" name="keyword"/>
		<a class="searchbtn" href="javascript:void(0)" onclick="getMyGroup(-1,-1,$('#search_group').val(),1)"></a>
	</div>
	<div class="linkbox">
		<dl>
			<dt><a class="current" href="javascript:void(0)" onclick="getMyGroup(1,-1,null,1)"><span><span>我参与的</span></span></a></dt>
		</dl>
		<dl><dt>|</dt></dl>
		<dl>
			<dt><a href="javascript:void(0)" onclick="getMyGroup(2,-1,null,1)"><span><span>我创建的</span></span></a></dt>
		</dl>
	</div>
</div>


