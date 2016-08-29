<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script type="text/javascript">
	$(function(){
		initInput("search_grouptopic", "圈子发言搜索");
	});
</script>
<div class="tab_menu">
	<div class="searchbox01">
		<input id="search_grouptopic" name="keyword"/>
		<a class="searchbtn" href="javascript:void(0)" onclick="javascript:loadGroupTopic(-1,-1,$('#search_grouptopic').val(),1)"></a>
	</div>
	<div class="linkbox">
		<dl>
			<dt><a class="current" href="javascript:void(0)" onclick="javascript:loadGroupTopic(4,-1,null,1)"><span><span>所有发言</span></span></a></dt>
		</dl>
		<dl><dt>|</dt></dl>
		<dl>
			<dt><a href="javascript:void(0)" onclick="javascript:loadGroupTopic(1,-1,null,1)"><span><span>我发表的</span></span></a></dt>
		</dl>
		<dl><dt>|</dt></dl>
		<dl>
			<dt><a href="javascript:void(0)" onclick="javascript:loadGroupTopic(2,-1,null,1)"><span><span>我品论的</span></span></a></dt>
		</dl>
		<dl><dt>|</dt></dl>
		<dl>
			<dt><a href="javascript:void(0)" onclick="javascript:loadGroupTopic(3,-1,null,1)"><span><span>提到我的</span></span></a></dt>
		</dl>
	</div>
</div>


